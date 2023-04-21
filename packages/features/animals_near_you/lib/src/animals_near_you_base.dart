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
  Widget build(BuildContext context) => RefreshIndicator(
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
