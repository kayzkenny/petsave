import 'package:freezed_annotation/freezed_annotation.dart';

part 'colors.freezed.dart';

@freezed
class Colors with _$Colors {
  const factory Colors({
    String? primary,
    String? secondary,
    String? tertiary,
  }) = _Colors;
}
