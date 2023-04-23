import 'package:animal_repository/animal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimalDetailsPage extends StatelessWidget {
  const AnimalDetailsPage({super.key, required this.animalId});

  final int animalId;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final animalValue = ref.watch(animalProvider(animalId));
        return animalValue.when(
          data: (data) {
            return Scaffold(
              appBar: AppBar(
                title: Text(data.name ?? 'No name'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.name ?? 'No name'),
                  Text(data.description ?? 'No description'),
                ],
              ),
            );
          },
          loading: () => Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => Scaffold(
            body: const Center(child: Text('Error')),
          ),
        );
      },
    );
  }
}
