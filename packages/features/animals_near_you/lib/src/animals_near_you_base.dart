import 'package:animals_near_you/src/animal_row.dart';
import 'package:animals_near_you/src/request_location_permission_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:animal_repository/animal_repository.dart';
import 'package:domain_models/domain_models.dart';
import 'package:routing/routing.dart';

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
        desiredAccuracy: LocationAccuracy.medium);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Animals Near You',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final locationPermissionValue =
                ref.watch(locationPermissionProvider);

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
                        return AnimalsNearYouPageContents(
                            position: snapshot.data);
                      } else if (snapshot.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
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

  Future<void> _fetchPage(int pageKey, {bool isRefreshing = false}) async {
    final animalstream = await ref.watch(animalRepositoryProvider.future).then(
          (value) => value.getAnimalListStream(
            page: pageKey,
            limit: _pageSize,
            fetchPolicy: isRefreshing
                ? AnimalFetchPolicy.networkOnly
                : AnimalFetchPolicy.cacheAndNetwork,
            location: widget.position == null
                ? null
                : '${widget.position?.latitude},${widget.position?.longitude}',
          ),
        );
    animalstream.listen((newItems) {
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reached the end of the list')),
        );
      } else {
        if (pageKey == 1 &&
            _pagingController.itemList != null &&
            _pagingController.itemList!.isNotEmpty) {
          // We were previewing the list from the cache, so we need to clear it
          _pagingController.itemList?.clear();
        }
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
    await _fetchPage(_pagingController.firstPageKey, isRefreshing: true);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: PagedListView<int, Animal>.separated(
        pagingController: _pagingController,
        separatorBuilder: (context, index) => const Divider(indent: 136),
        builderDelegate: PagedChildBuilderDelegate<Animal>(
          itemBuilder: (context, animal, index) {
            return GestureDetector(
              onTap: () => AnimalDetailsRouteData(animal.id!).go(context),
              child: AnimalRow(animal: animal),
            );
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
