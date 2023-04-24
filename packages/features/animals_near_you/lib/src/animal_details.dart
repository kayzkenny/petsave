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
          data: (animal) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                foregroundColor: Colors.black,
                title: Text(
                  animal.name ?? 'No name',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              body: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        animal.photos?.isEmpty ?? true
                            ? FlutterLogo(size: 100.0)
                            : CircleAvatar(
                                radius: 48,
                                backgroundImage: NetworkImage(
                                  animal.photos![0].medium!,
                                ),
                              ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${animal.name}',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                '${animal.breeds?.primary} ${animal.type}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.favorite_outline, size: 48.0),
                      ],
                    ),
                  ),
                  Divider(),
                  if (animal.photos?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          Text(
                            'Rank Me!',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 16),
                          ...[1, 2, 3, 4, 5].map(
                            (i) {
                              if (i != 1) {
                                return Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: Image.asset(
                                          "assets/images/creature_dog-and-bone.png"),
                                    ),
                                  ),
                                );
                              }
                              return Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: Image.asset(
                                      "assets/images/creature_dog-and-bone.png"),
                                ),
                              );
                            },
                          ).toList()
                        ],
                      ),
                    ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      '${animal.description}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.mail, color: Colors.blueAccent),
                          SizedBox(height: 4.0),
                          Center(
                            child: Text(
                              '${animal.contact?.email}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
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
