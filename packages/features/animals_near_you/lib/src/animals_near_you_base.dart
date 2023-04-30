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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<Animal>> fetchCachedAnimals() async {
    final animalRepository = await ref.watch(animalRepositoryProvider.future);
    return animalRepository.getAnimalsFromCache();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final animalRepository = await ref.watch(animalRepositoryProvider.future);
      final newItems = await animalRepository.getAnimalsFromNetwork(
        location: '${widget.position?.latitude},${widget.position?.longitude}',
        page: pageKey,
        limit: _pageSize,
      );

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
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
          // firstPageErrorIndicatorBuilder: (context) {
          //   // show results from cache
          //   return FutureBuilder<List<Animal>>(
          //     future: fetchCachedAnimals(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return ListView.builder(
          //           itemCount: snapshot.data?.length,
          //           itemBuilder: (context, index) {
          //             return GestureDetector(
          //               onTap: () => AnimalDetailsRouteData(
          //                 snapshot.data![index].id!,
          //               ).go(context),
          //               child: AnimalRow(animal: snapshot.data![index]),
          //             );
          //           },
          //         );
          //       } else if (snapshot.hasError) {
          //         return Center(child: Text(snapshot.error.toString()));
          //       } else {
          //         return Center(child: CircularProgressIndicator());
          //       }
          //     },
          //   );
          // },
        ),
      ),
    );
  }
}
