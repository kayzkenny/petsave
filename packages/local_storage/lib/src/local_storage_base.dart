import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:local_storage/src/models/animal_cm.dart';
import 'package:local_storage/src/models/organization_cm.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  LocalStorage(this.isar);
  final Isar isar;

  // clear all animals
  Future<void> clearAllAnimals() async {
    await isar.animalCMs.clear();
  }

  // clear all organizations
  Future<void> clearAllOrganizations() async {
    await isar.organizationCMs.clear();
  }

  // get all list of animals
  Future<List<AnimalCM>> getAllAnimals() async {
    final query = isar.animalCMs.where();
    return query.findAll();
  }

  // insert animals into local storage
  Future<void> insertAnimals(List<AnimalCM> animals) async {
    await isar.writeTxn(() async {
      await isar.animalCMs.putAll(animals);
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
}

final isarPod = FutureProvider((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([AnimalCMSchema, OrganizationCMSchema], directory: dir.path);
});
