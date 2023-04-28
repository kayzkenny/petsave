// enum AnimalSearchType: String, CaseIterable {
//   case none
//   case cat
//   case dog
//   case rabbit
//   case smallAndFurry = "small & furry"
//   case horse
//   case bird
//   case scalesFinsAndOther = "scales, fins & other"
//   case barnyard
// }

// create an enum from the example above
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AnimalSearchType {
  none,
  cat,
  dog,
  rabbit,
  smallAndFurry,
  horse,
  bird,
  scalesFinsAndOther,
  barnyard,
}

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Find your future pet',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text('Search Page'),
      ),
    );
  }
}
