import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/src/models/response/animal_types_rm.dart';

part 'animal_types_data_rm.g.dart';

@JsonSerializable(createToJson: false)
class AnimalTypesDataRM {
  const AnimalTypesDataRM({required this.types});

  final List<AnimalTypesRM> types;

  static const fromJson = _$AnimalTypesDataRMFromJson;
}
