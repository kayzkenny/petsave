import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:animal_repository/animal_repository.dart';
import 'package:domain_models/domain_models.dart';

class AnimalsNearYouPage extends ConsumerStatefulWidget {
  const AnimalsNearYouPage({super.key});

  @override
  ConsumerState<AnimalsNearYouPage> createState() => _AnimalsNearYouPageState();
}

class _AnimalsNearYouPageState extends ConsumerState<AnimalsNearYouPage> {
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

  Future<void> _fetchPage(int pageKey) async {
    final animalstream = await ref.read(animalRepositoryPod.future).then(
          (value) => value.getAnimalListStream(
            page: pageKey,
            limit: _pageSize,
            fetchPolicy: AnimalFetchPolicy.cacheAndNetwork,
          ),
        );
    // Stream<List<Animal>> characterStream =
    //     RemoteApi.getCharacterStream(pageKey, _pageSize);
    animalstream.listen((newItems) {
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
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
  Widget build(BuildContext context) =>
      // Don't worry about displaying progress or error indicators on screen; the
      // package takes care of that. If you want to customize them, use the
      // [PagedChildBuilderDelegate] properties.
      Scaffold(
        appBar: AppBar(
          title: const Text('Aniamls Near You'),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: PagedListView<int, Animal>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Animal>(
              itemBuilder: (context, animal, index) {
                return ListTile(
                  isThreeLine: true,
                  title: Text(
                      '${animal.name}\n${animal.breeds?.primary} ${animal.type}'),
                  subtitle: Text(
                      '${animal.description}\n${animal.age} ${animal.gender}'),
                  leading: animal.photos?.isEmpty ?? true
                      ? null
                      : Image.network(animal.photos![0].medium!),
                );
              },
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
