import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:local_storage/src/models/animal_cm.dart';
import 'package:local_storage/src/models/organization_cm.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  LocalStorage(this.isar);
  final Isar isar;

  // get all list of animals
  Future<List<AnimalCM>> getAllAnimals() async {
    final query = isar.animalCMs.where();
    return query.findAll();
  }

  // get all list of organizations
  Future<List<OrganizationCM>> getAllOrganizations() async {
    final query = isar.organizationCMs.where();
    return query.findAll();
  }

  Future<List<AnimalCM>> animalsPaginated(int offset) async {
    final results =
        await isar.animalCMs.where().offset(offset).limit(10).findAll();
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
