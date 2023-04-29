import 'package:animal_repository/animal_repository.dart';
import 'package:animals_near_you/animals_near_you.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:routing/routing.dart';
import 'package:search/src/search_query.dart';

enum AnimalSearchType {
  none(null),
  cat("cat"),
  dog("dog"),
  rabbit("rabbit"),
  smallAndFurry("smallAndFurry"),
  horse("horse"),
  bird("bird"),
  scalesFinsAndOther("scalesFinsAndOther"),
  barnyard("barnyard");

  const AnimalSearchType(this.value);
  final String? value;

  // get card label
  String get label {
    switch (this) {
      case AnimalSearchType.none:
        return "None";
      case AnimalSearchType.cat:
        return "Cat";
      case AnimalSearchType.dog:
        return "Dog";
      case AnimalSearchType.rabbit:
        return "Rabbit";
      case AnimalSearchType.smallAndFurry:
        return "Small & Furry";
      case AnimalSearchType.horse:
        return "Horse";
      case AnimalSearchType.bird:
        return "Bird";
      case AnimalSearchType.scalesFinsAndOther:
        return "Scales, Fins & Other";
      case AnimalSearchType.barnyard:
        return "Barnyard";
    }
  }
}

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  static const _pageSize = 20;
  SearchQuery _searchQuery = SearchQuery();

  // is search query empty
  // return true if all search query fields are null
  bool isSearchQueryEmpty() {
    if (_searchQuery.after != null) {
      return false;
    }
    if (_searchQuery.age != null) {
      return false;
    }
    if (_searchQuery.before != null) {
      return false;
    }
    if (_searchQuery.breed != null) {
      return false;
    }
    if (_searchQuery.coat != null) {
      return false;
    }
    if (_searchQuery.color != null) {
      return false;
    }
    if (_searchQuery.declawed != null) {
      return false;
    }
    if (_searchQuery.name != null) {
      return false;
    }
    if (_searchQuery.organization != null) {
      return false;
    }
    if (_searchQuery.size != null) {
      return false;
    }
    if (_searchQuery.sort != null) {
      return false;
    }
    if (_searchQuery.status != null) {
      return false;
    }
    if (_searchQuery.type != null) {
      return false;
    }
    if (_searchQuery.goodWithCats != null) {
      return false;
    }
    if (_searchQuery.goodWithChildren != null) {
      return false;
    }
    if (_searchQuery.goodWithDogs != null) {
      return false;
    }
    if (_searchQuery.houseTrained != null) {
      return false;
    }
    if (_searchQuery.gender != null) {
      return false;
    }

    return true;
  }

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

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<Animal> newItems = <Animal>[];
      if (isSearchQueryEmpty()) {
        final animalRepository =
            await ref.read(animalRepositoryProvider.future);
        newItems = await animalRepository.getAnimals(
          limit: _pageSize,
          page: 1,
          name: _searchQuery.name,
        );
      }

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

  Future<void> _refresh() async {
    // Reset the paging controller to the first page.
    _pagingController.refresh();
    // Fetch the first page of data again.
    await _fetchPage(_pagingController.firstPageKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Find your future pet',
          style: const TextStyle(color: Colors.black),
        ),
        toolbarHeight: 80,
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              fillColor: Colors.grey,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = _searchQuery.copyWith(name: value);
              });
              _refresh();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PagedListView<int, Animal>.separated(
          pagingController: _pagingController,
          separatorBuilder: (context, index) => const Divider(indent: 136),
          builderDelegate: PagedChildBuilderDelegate<Animal>(
            noItemsFoundIndicatorBuilder: (context) {
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: AnimalSearchType.values
                    .map(
                      (animalType) => AnimalTypeCard(
                        label: animalType.label,
                        imagePath: 'assets/images/${animalType.value}.jpg',
                        onTap: () {
                          _searchQuery = _searchQuery.copyWith(
                            name: animalType.value,
                          );
                          _searchController.text = animalType.value!;
                        },
                      ),
                    )
                    .where(
                      (element) => element.label != AnimalSearchType.none.label,
                    )
                    .toList(),
              );
            },
            itemBuilder: (context, animal, index) {
              return GestureDetector(
                onTap: () => AnimalDetailsRouteData(animal.id!).go(context),
                child: AnimalRow(animal: animal),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AnimalTypeCard extends StatelessWidget {
  const AnimalTypeCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.onTap,
  });

  final String label;
  final String imagePath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 96,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
