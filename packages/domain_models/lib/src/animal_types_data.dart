import 'package:domain_models/src/animal_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_types_data.freezed.dart';

@freezed
class AnimalTypesData with _$AnimalTypesData {
  const factory AnimalTypesData({
    AnimalTypes? animal,
  }) = _AnimalTypesData;
}
