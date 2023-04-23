import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/src/models/response/animal_rm.dart';

part 'animal_data_rm.g.dart';

@JsonSerializable(createToJson: false)
class AnimalDataRM {
  const AnimalDataRM({required this.animal});

  final AnimalRM animal;

  static const fromJson = _$AnimalDataRMFromJson;
}
