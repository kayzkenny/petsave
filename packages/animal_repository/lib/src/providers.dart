import 'package:domain_models/domain_models.dart';
import 'package:local_storage/local_storage.dart';
import 'package:petfinder_api/petfinder_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'animal_repository_base.dart';

part 'providers.g.dart';

// final animalRepositoryProvider = FutureProvider<AnimalRepository>((ref) async {
//   final api = ref.watch(apiPod);
//   final localStorage = await ref.watch(localStoragePod.future);

//   return AnimalRepository(
//     remoteApi: api,
//     localStorage: localStorage,
//   );
// });

@riverpod
Future<AnimalRepository> animalRepository(AnimalRepositoryRef ref) async {
  final api = ref.watch(apiPod);
  final localStorage = await ref.watch(localStoragePod.future);

  return AnimalRepository(
    remoteApi: api,
    localStorage: localStorage,
  );
}

@riverpod
Future<Animal> animal(AnimalRef ref, int id) async {
  final animalRepository = await ref.watch(animalRepositoryProvider.future);
  return animalRepository.getAnimalById(id);
}

@riverpod
Stream<List<Animal>> animalsStream(
  AnimalsStreamRef ref, {
  String? name,
  String? location,
  required int page,
  required int limit,
  required AnimalFetchPolicy fetchPolicy,
}) async* {
  final animalRepository = await ref.watch(animalRepositoryProvider.future);
  yield* animalRepository.getAnimalListStream(
    name: name,
    location: location,
    page: page,
    limit: limit,
    fetchPolicy: fetchPolicy,
  );
}

@riverpod
Future<List<AnimalTypes>> animalTypes(AnimalTypesRef ref) async {
  final animalRepository = await ref.watch(animalRepositoryProvider.future);
  return animalRepository.getAnimalTypes();
}
