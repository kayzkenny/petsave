import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/src/models/response/animal_types_rm.dart';

part 'animal_single_type_data_rm.g.dart';

@JsonSerializable(createToJson: false)
class AnimalSingleTypeDataRM {
  const AnimalSingleTypeDataRM({required this.type});

  final List<AnimalTypesRM> type;

  static const fromJson = _$AnimalSingleTypeDataRMFromJson;
}
