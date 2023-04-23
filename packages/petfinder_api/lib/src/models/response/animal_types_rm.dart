import 'package:json_annotation/json_annotation.dart';

part 'animal_types_rm.g.dart';

@JsonSerializable(createToJson: false)
class AnimalTypesRM {
  const AnimalTypesRM({
    required this.name,
    required this.coats,
    required this.colors,
    required this.genders,
  });

  final String name;
  final List<String> coats;
  final List<String> colors;
  final List<String> genders;

  static const fromJson = _$AnimalTypesRMFromJson;
}
