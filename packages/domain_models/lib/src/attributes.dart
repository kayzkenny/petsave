import 'package:freezed_annotation/freezed_annotation.dart';

part 'attributes.freezed.dart';

@freezed
class Attributes with _$Attributes {
  const factory Attributes({
    bool? spayedNeutered,
    bool? houseTrained,
    bool? declawed,
    bool? specialNeeds,
    bool? shotsCurrent,
  }) = _Attributes;
}
