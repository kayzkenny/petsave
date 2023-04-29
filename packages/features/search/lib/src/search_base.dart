import 'dart:async';

import 'package:animal_repository/animal_repository.dart';
import 'package:animals_near_you/animals_near_you.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:routing/routing.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/src/animal_search_type.dart';
import 'package:search/src/animal_type_card.dart';
import 'package:search/src/search_query.dart';

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
  bool _showPlaceholder = true;

  @override
  void initState() {
    _searchController
        .where((query) => query.isNotEmpty)
        .distinct() // Optional: Ensure that only distinct search queries are emitted
        .debounceTime(
            Duration(milliseconds: 500)) // Set your desired debounce duration
        .listen((String query) {
      // Perform the search operation
      // Call your search function or perform any desired action here
      // e.g., make an API request with the debounced query
      setState(() {
        _showPlaceholder = false;
      });
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
        // Handle empty query case
        setState(() {
          _showPlaceholder = true;
        });
        _pagingController.refresh();
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
      body: SafeArea(
        child: Padding(
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
                      prefixIcon: const Icon(Icons.search, color: Colors.blue),
                    ),
                    onChanged: (String query) {
                      setState(() {
                        _showPlaceholder = query.isEmpty;
                      });
                      _searchController.add(query);
                    },
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
              _showPlaceholder
                  ? SliverFillRemaining(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Browse by Type',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              children: AnimalSearchType.values
                                  .map(
                                    (animalType) => AnimalTypeCard(
                                      label: animalType.label,
                                      imagePath:
                                          'assets/images/${animalType.value}.jpg',
                                      onTap: () {
                                        _searchController
                                            .add(animalType.value!);
                                      },
                                    ),
                                  )
                                  .where((element) =>
                                      element.label !=
                                      AnimalSearchType.none.label)
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  : PagedSliverList<int, Animal>.separated(
                      pagingController: _pagingController,
                      separatorBuilder: (context, index) =>
                          const Divider(indent: 136),
                      builderDelegate: PagedChildBuilderDelegate<Animal>(
                        animateTransitions: true,
                        itemBuilder: (context, animal, index) {
                          return GestureDetector(
                            onTap: () =>
                                AnimalDetailsRouteData(animal.id!).go(context),
                            child: AnimalRow(animal: animal),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
