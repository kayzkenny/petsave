import 'dart:async';

import 'package:animal_repository/animal_repository.dart';
import 'package:animals_near_you/animals_near_you.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:routing/routing.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/src/animal_search_type.dart';
import 'package:search/src/animal_type_card.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _searchController = BehaviorSubject<String>();
  static const _pageSize = 20;
  final PagingController<int, Animal> _pagingController =
      PagingController(firstPageKey: 1);
  bool _showPlaceholder = true;
  bool declawed = false;
  bool goodWithCats = false;
  bool goodWithChildren = false;
  bool goodWithDogs = false;
  bool houseTrained = false;
  bool specialNeeds = false;
  DateTime? after;
  DateTime? before;
  String? age;
  List<String> ages = ['baby', 'young', 'adult', 'senior'];
  String? status;
  List<String> statuses = ['adoptable', 'adopted', 'found'];
  String? coat;
  List<String> coats = ['short', 'medium', 'long', 'wire', 'hairless', 'curly'];
  String? gender;
  List<String> genders = ['male', 'female'];
  String? size;
  List<String> sizes = ['small', 'medium', 'large', 'xlarge'];
  String? sort;
  List<String> sorts = ['recent', '-recent', 'distance', '-distance', 'random'];
  AnimalTypes? animalType;
  List<AnimalTypes> animalTypes = [];

  @override
  void initState() {
    _searchController
        .where((query) => query.isNotEmpty)
        // Optional: Ensure that only distinct search queries are emitted
        .distinct()
        .debounceTime(Duration(milliseconds: 500))
        .listen((String query) {
      setState(() {
        _showPlaceholder = false;
      });
      _pagingController.refresh();
    });

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    _pagingController.addStatusListener((status) {
      if (status == PagingStatus.subsequentPageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Something went wrong while fetching a new page.',
            ),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () => _pagingController.retryLastFailedRequest(),
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.close();
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<AnimalTypes>> fetchAnimalTypes() async {
    if (animalTypes.isNotEmpty) {
      return animalTypes;
    }
    final animalRepository = await ref.read(animalRepositoryProvider.future);
    final types = await animalRepository.getAnimalTypes();
    animalTypes = types;
    return types;
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
        after: after,
        before: before,
        age: age,
        type: animalType?.name,
        status: status,
        coat: coat,
        declawed: declawed,
        gender: gender,
        goodWithCats: goodWithCats,
        goodWithChildren: goodWithChildren,
        goodWithDogs: goodWithDogs,
        houseTrained: houseTrained,
        size: size,
        specialNeeds: specialNeeds,
        sort: sort,
        page: pageKey,
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

  Future<void> _showFilterDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            _pagingController.refresh();
            return true;
          },
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Dialog.fullscreen(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: Colors.black,
                    title: Text(
                      'Filters',
                      style: const TextStyle(color: Colors.black),
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          // reset the state of the fields
                          setState(() {
                            after = null;
                            before = null;
                            age = null;
                            animalType = null;
                            coat = null;
                            status = null;
                            gender = null;
                            size = null;
                            sort = null;
                          });
                          context.pop();
                        },
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: ListBody(
                      children: <Widget>[
                        SwitchListTile(
                          title: const Text('Declawed'),
                          value: declawed,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          onChanged: (value) {
                            setState(() {
                              declawed = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('Good with cats'),
                          value: goodWithCats,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          onChanged: (value) {
                            setState(() {
                              goodWithCats = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('Good with children'),
                          value: goodWithChildren,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          onChanged: (value) {
                            setState(() {
                              goodWithChildren = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('Good with dogs'),
                          value: goodWithDogs,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          onChanged: (value) {
                            setState(() {
                              goodWithDogs = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('House trained'),
                          value: houseTrained,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          onChanged: (value) {
                            setState(() {
                              houseTrained = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          title: const Text('Special needs'),
                          value: specialNeeds,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          onChanged: (value) {
                            setState(() {
                              specialNeeds = value;
                            });
                          },
                        ),
                        DropdownSearch<String>(
                          items: ages,
                          selectedItem: age,
                          popupProps: PopupProps.menu(showSelectedItems: true),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Age",
                              hintText: "age of the animal",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              age = value;
                            });
                          },
                        ),
                        DropdownSearch<String>(
                          items: statuses,
                          selectedItem: status,
                          popupProps: PopupProps.menu(showSelectedItems: true),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Status",
                              hintText: "status of the animal",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                status = value;
                              });
                            }
                          },
                        ),
                        DropdownSearch<String>(
                          items: coats,
                          selectedItem: coat,
                          popupProps: PopupProps.menu(showSelectedItems: true),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Coat",
                              hintText: "coat of the animal",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                coat = value;
                              });
                            }
                          },
                        ),
                        DropdownSearch<String>(
                          items: genders,
                          selectedItem: gender,
                          popupProps: PopupProps.menu(showSelectedItems: true),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Gender",
                              hintText: "gender of the animal",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                gender = value;
                              });
                            }
                          },
                        ),
                        DropdownSearch<String>(
                          items: sizes,
                          selectedItem: size,
                          popupProps: PopupProps.menu(showSelectedItems: true),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Size",
                              hintText: "size of the animal",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                size = value;
                              });
                            }
                          },
                        ),
                        DropdownSearch<String>(
                          items: sorts,
                          selectedItem: sort,
                          popupProps: PopupProps.menu(showSelectedItems: true),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Sort",
                              hintText: "sort of the animal",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                sort = value;
                              });
                            }
                          },
                        ),
                        DropdownSearch<AnimalTypes>(
                          popupProps: PopupProps.menu(
                            showSearchBox: true,
                            emptyBuilder: (context, string) => const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Failed to animal types. Please try again',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Animal Type",
                              hintText: "types of animals",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          asyncItems: (string) => fetchAnimalTypes(),
                          selectedItem: animalType,
                          itemAsString: (AnimalTypes t) => t.name ?? '',
                          onChanged: (AnimalTypes? value) {
                            setState(() {
                              animalType = value;
                            });
                          },
                        ),
                        ListTile(
                          title: const Text('Published Before'),
                          subtitle: before == null
                              ? null
                              : Text(DateFormat.yMEd().format(before!)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          trailing: IconButton(
                            onPressed: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now()
                                    .subtract(const Duration(days: 2)),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365 * 30)),
                                lastDate: DateTime.now()
                                    .subtract(const Duration(days: 1)),
                              );
                              setState(() {
                                before = date;
                              });
                            },
                            icon: Icon(Icons.calendar_month),
                          ),
                        ),
                        ListTile(
                          title: const Text('Published After'),
                          subtitle: after == null
                              ? null
                              : Text(DateFormat.yMEd().format(after!)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          trailing: IconButton(
                            onPressed: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now()
                                    .subtract(const Duration(days: 2)),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365 * 30)),
                                lastDate: DateTime.now()
                                    .subtract(const Duration(days: 1)),
                              );
                              setState(() {
                                after = date;
                              });
                            },
                            icon: Icon(Icons.calendar_month),
                          ),
                        ),
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            context.pop();
                            _pagingController.refresh();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
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
                    onPressed: _showFilterDialog,
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
