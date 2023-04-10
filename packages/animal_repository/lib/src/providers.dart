import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_storage/local_storage.dart';
import 'package:petfinder_api/petfinder_api.dart';

import 'animal_repository_base.dart';

final apiPod = Provider<PetFinderApi>((ref) {
  final dio = createDio();

  return PetFinderApi(dio);
});

final localStoragePod = FutureProvider<LocalStorage>((ref) async {
  final isar = await ref.watch(isarPod.future);

  return LocalStorage(isar);
});

final animalRepositoryPod = FutureProvider<AnimalRepository>((ref) async {
  final api = ref.watch(apiPod);
  final localStorage = await ref.watch(localStoragePod.future);

  return AnimalRepository(
    remoteApi: api,
    localStorage: localStorage,
  );
});
