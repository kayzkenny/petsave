import 'package:domain_models/src/animal_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_single_types_data.freezed.dart';

@freezed
class AnimalSingleTypesData with _$AnimalSingleTypesData {
  const factory AnimalSingleTypesData({
    AnimalTypes? animal,
  }) = _AnimalSingleTypesData;
}
