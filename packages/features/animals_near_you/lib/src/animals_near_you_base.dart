import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:animal_repository/animal_repository.dart';
import 'package:domain_models/domain_models.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  /// Constructor for [AsyncValueWidget].
  const AsyncValueWidget({super.key, required this.value, required this.data});

  /// Async value to display.
  final AsyncValue<T> value;

  /// Widget to display when the async value is data.
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: Text(e.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

final locationPermissionProvider =
    FutureProvider<LocationPermission>((ref) async {
  return Geolocator.checkPermission();
});

final currentPositionProvider = FutureProvider<Position>((ref) async {
  return Geolocator.getCurrentPosition();
});

class AnimalsNearYouPage extends StatelessWidget {
  const AnimalsNearYouPage({super.key});

  Future<Position> _determinePosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final locationPermissionValue = ref.watch(locationPermissionProvider);

        return locationPermissionValue.when(
          data: (data) {
            if (data == LocationPermission.denied ||
                data == LocationPermission.deniedForever) {
              return RequestLocationPermissionPage();
            } else {
              return FutureBuilder<Position>(
                future: _determinePosition(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AnimalsNearYouPageContents(position: snapshot.data);
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        ),
                      ],
                    );
                  }
                },
              );
            }
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class RequestLocationPermissionPage extends ConsumerWidget {
  const RequestLocationPermissionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/creature_dog-and-bone.png",
          height: 200.0,
          width: 200.0,
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            'To find pets near you, first you need to share your current location',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () async {
            final permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.whileInUse ||
                permission == LocationPermission.always) {
              ref.invalidate(locationPermissionProvider);
            }

            if (permission == LocationPermission.deniedForever) {
              await Geolocator.openAppSettings();
              await Geolocator.openLocationSettings();
            }
          },
          icon: Icon(Icons.near_me),
          label: Text('Share Location'),
        ),
      ],
    );
  }
}

class AnimalsNearYouPageContents extends ConsumerStatefulWidget {
  AnimalsNearYouPageContents({super.key, this.position});

  final Position? position;

  @override
  ConsumerState<AnimalsNearYouPageContents> createState() =>
      _AnimalsNearYouContentsPageState();
}

class _AnimalsNearYouContentsPageState
    extends ConsumerState<AnimalsNearYouPageContents> {
  static const _pageSize = 20;

  final PagingController<int, Animal> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(AnimalsNearYouPageContents oldWidget) {
    if (oldWidget.position != widget.position) {
      _pagingController.refresh();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _fetchPage(int pageKey) async {
    final animalstream = await ref.read(animalRepositoryPod.future).then(
          (value) => value.getAnimalListStream(
            page: pageKey,
            limit: _pageSize,
            fetchPolicy: AnimalFetchPolicy.cacheAndNetwork,
            location: widget.position == null
                ? null
                : '${widget.position?.latitude},${widget.position?.longitude}',
          ),
        );
    // Stream<List<Animal>> characterStream =
    //     RemoteApi.getCharacterStream(pageKey, _pageSize);
    animalstream.listen((newItems) {
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
        // show a snackbar or any other notification that you've reached the end of the list
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reached the end of the list')),
        );
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    }, onError: (error) {
      _pagingController.error = error;
    });
  }

  Future<void> _refresh() async {
    // Reset the paging controller to the first page.
    _pagingController.refresh();
    // Fetch the first page of data again.
    await _fetchPage(_pagingController.firstPageKey);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: PagedListView<int, Animal>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Animal>(
          itemBuilder: (context, animal, index) {
            return AnimalRow(animal: animal);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class AnimalRow extends StatelessWidget {
  const AnimalRow({
    required this.animal,
    super.key,
  });
  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          animal.photos?.isEmpty ?? true
              ? FlutterLogo(size: 100.0)
              : Image.network(
                  animal.photos![0].medium!,
                  width: 100.0,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${animal.name}',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  '${animal.breeds?.primary} ${animal.type}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 4.0),
                if (animal.description != null) ...[
                  Text(
                    '${animal.description}',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 8.0),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PillWidget(
                      label: '${animal.age}',
                      color: Colors.lightBlue,
                    ),
                    SizedBox(width: 8.0),
                    PillWidget(
                      label: '${animal.gender}',
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(width: 16.0),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class PillWidget extends StatelessWidget {
  final String label;
  final Color color;
  const PillWidget({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 12.0,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
