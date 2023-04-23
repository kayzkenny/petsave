import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_types.freezed.dart';

@freezed
class AnimalTypes with _$AnimalTypes {
  const factory AnimalTypes({
    String? name,
    List<String>? coats,
    List<String>? colors,
    List<String>? genders,
  }) = _AnimalTypes;
}
