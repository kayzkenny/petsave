import 'package:freezed_annotation/freezed_annotation.dart';

part 'photos.freezed.dart';

@freezed
class Photos with _$Photos {
  const factory Photos({
    String? small,
    String? medium,
    String? large,
    String? full,
  }) = _Photos;
}
