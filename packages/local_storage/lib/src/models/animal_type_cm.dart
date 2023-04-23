import 'package:isar/isar.dart';

part 'animal_type_cm.g.dart';

@collection
@Name("AnimalType")
class AnimalTypeCM {
  Id id = Isar.autoIncrement;

  String? name;

  List<String>? coats;

  List<String>? colors;

  List<String>? genders;
}
