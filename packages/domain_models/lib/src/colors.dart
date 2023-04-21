import 'package:freezed_annotation/freezed_annotation.dart';

part 'colors.freezed.dart';

@freezed
class AnimalColors with _$AnimalColors {
  const factory AnimalColors({
    String? primary,
    String? secondary,
    String? tertiary,
  }) = _AnimalColors;
}
