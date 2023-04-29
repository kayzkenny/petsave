import 'dart:async';

import 'package:animal_repository/animal_repository.dart';
import 'package:animals_near_you/animals_near_you.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:routing/routing.dart';
import 'package:rxdart/rxdart.dart';
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
  final _searchController = BehaviorSubject<String>();
  static const _pageSize = 20;
  final SearchQuery _searchQuery = SearchQuery();

  final PagingController<int, Animal> _pagingController =
      PagingController(firstPageKey: 1);
  // String? _searchTerm;

  @override
  void initState() {
    _searchController
        .distinct() // Optional: Ensure that only distinct search queries are emitted
        .debounceTime(
            Duration(milliseconds: 500)) // Set your desired debounce duration
        .listen((String query) {
      // Perform the search operation
      // Call your search function or perform any desired action here
      // e.g., make an API request with the debounced query
      _pagingController.refresh();
    });
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.close();
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final query = _searchController.valueOrNull ?? '';
      if (query.isEmpty) {
        // Show placeholder widget or handle empty query case
        return;
      }

      final animalRepository = await ref.read(animalRepositoryProvider.future);
      final newItems = await animalRepository.getAnimals(
        name: query,
        limit: _pageSize,
        page: 1,
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                  onChanged: (String query) {
                    _searchController.add(query);
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
            PagedSliverList<int, Animal>.separated(
              pagingController: _pagingController,
              separatorBuilder: (context, index) => const Divider(indent: 136),
              builderDelegate: PagedChildBuilderDelegate<Animal>(
                animateTransitions: true,
                itemBuilder: (context, animal, index) {
                  return GestureDetector(
                    onTap: () => AnimalDetailsRouteData(animal.id!).go(context),
                    child: AnimalRow(animal: animal),
                  );
                },
              ),
            ),
            // PagedSliverList.separated(
            //   separatorBuilder: (context, index) => const Divider(indent: 136),
            //   pagingController: _pagingController,
            //   builderDelegate: PagedChildBuilderDelegate<Animal>(
            //     noItemsFoundIndicatorBuilder: (context) {
            //       return GridView.count(
            //         crossAxisCount: 2,
            //         childAspectRatio: 1.5,
            //         crossAxisSpacing: 12,
            //         mainAxisSpacing: 12,
            //         children: AnimalSearchType.values
            //             .map(
            //               (animalType) => AnimalTypeCard(
            //                 label: animalType.label,
            //                 imagePath: 'assets/images/${animalType.value}.jpg',
            //                 onTap: () {
            //                   _searchQuery = _searchQuery.copyWith(
            //                     name: animalType.value,
            //                   );
            //                   _searchController.text = animalType.value!;
            //                 },
            //               ),
            //             )
            //             .where(
            //               (element) =>
            //                   element.label != AnimalSearchType.none.label,
            //             )
            //             .toList(),
            //       );
            //     },
            //     itemBuilder: (context, animal, index) {
            //       return GestureDetector(
            //         onTap: () => AnimalDetailsRouteData(animal.id!).go(context),
            //         child: AnimalRow(animal: animal),
            //       );
            //     },
            //   ),
            // ),
          ],
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
