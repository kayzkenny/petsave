import 'package:domain_models/domain_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_data.freezed.dart';

@freezed
class AnimalData with _$AnimalData {
  const factory AnimalData({
    Animal? animal,
  }) = _AnimalData;
}
