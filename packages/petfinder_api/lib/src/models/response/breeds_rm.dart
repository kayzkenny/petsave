import 'package:json_annotation/json_annotation.dart';

part 'breeds_rm.g.dart';

@JsonSerializable(createToJson: false)
class BreedsRM {
  BreedsRM({
    this.primary,
    this.secondary,
    this.mixed,
    this.unknown,
  });

  final String? primary;
  final String? secondary;
  final bool? mixed;
  final bool? unknown;

  static const fromJson = _$BreedsRMFromJson;
}
