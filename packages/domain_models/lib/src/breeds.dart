import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeds.freezed.dart';

@freezed
class Breeds with _$Breeds {
  const factory Breeds({
    String? primary,
    String? secondary,
    bool? mixed,
    bool? unknown,
  }) = _Breeds;
}
