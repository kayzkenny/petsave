import 'package:domain_models/domain_models.dart';
import 'package:isar/isar.dart';
import 'package:local_storage/src/models/animal_cm.dart';
import 'package:local_storage/src/models/animal_type_cm.dart';
import 'package:local_storage/src/models/organization_cm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:animal_repository/animal_repository.dart';

part 'local_storage_base.g.dart';

class LocalStorage {
  LocalStorage(this.isar);
  final Isar isar;

  // clear all animals
  Future<void> clearAllAnimals() async {
    await isar.writeTxn(() async {
      await isar.animalCMs.clear();
    });
  }

  // clear all organizations
  Future<void> clearAllOrganizations() async {
    await isar.writeTxn(() async {
      await isar.organizationCMs.clear();
    });
  }

  // get all list of animals
  Future<List<AnimalCM>> getAllAnimals() async {
    final query = isar.animalCMs.where();
    return query.findAll();
  }

  // get a single animal from local storage
  Future<AnimalCM?> getAnimal(int id) async {
    final animal = await isar.animalCMs.get(id);
    return animal;
  }

  // insert animals into local storage
  Future<void> insertAnimals(List<AnimalCM> animals) async {
    await isar.writeTxn(() async {
      await isar.animalCMs.putAll(animals);
    });
  }

  // insert single animal into local storage
  Future<void> insertAnimal(AnimalCM animal) async {
    await isar.writeTxn(() async {
      await isar.animalCMs.put(animal);
    });
  }

  // get animal by id
  Future<AnimalCM?> getAnimalById(int id) async {
    final animal = await isar.animalCMs.get(id);
    return animal;
  }

  // get all list of organizations
  Future<List<OrganizationCM>> getAllOrganizations() async {
    final query = isar.organizationCMs.where();
    return query.findAll();
  }

  Future<List<AnimalCM>> animalsPaginated({
    required int page,
    required int limit,
  }) async {
    final offset = (page * 10) - 10;
    final results =
        await isar.animalCMs.where().offset(offset).limit(limit).findAll();
    return results;
  }

  Future<List<OrganizationCM>> organizationsPaginated(int offset) async {
    final results =
        await isar.organizationCMs.where().offset(offset).limit(10).findAll();
    return results;
  }

  Future<List<AnimalTypeCM>> getAnimalTypes() async {
    final results = await isar.animalTypeCMs.where().findAll();
    return results;
  }

  // insert animals into local storage
  Future<void> insertAnimalTypes(List<AnimalTypeCM> animalsTypes) async {
    await isar.writeTxn(() async {
      await isar.animalTypeCMs.putAll(animalsTypes);
    });
  }

  // returns a stream of the animals collection
  Stream<List<AnimalCM>> animalsStream() {
    return isar.animalCMs.where().watch();
  }
}

final isarPod = Provider<Isar>((ref) {
  // final dir = await getApplicationDocumentsDirectory();
  // return Isar.open([
  //   AnimalCMSchema,
  //   OrganizationCMSchema,
  //   AnimalTypeCMSchema,
  // ], directory: dir.path);
  throw UnimplementedError();
});

final localStoragePod =
    Provider<LocalStorage>((ref) => LocalStorage(ref.watch(isarPod)));

@riverpod
Stream<List<Animal>> animalsStream(AnimalsStreamRef ref) async* {
  final localStorage = ref.watch(localStoragePod);
  yield* localStorage
      .animalsStream()
      .map((animals) => animals.map((e) => e.toDomainModel()).toList());
}
