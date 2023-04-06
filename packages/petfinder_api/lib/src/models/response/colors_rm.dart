import 'package:json_annotation/json_annotation.dart';

part 'colors_rm.g.dart';

@JsonSerializable(createToJson: false)
class ColorsRM {
  ColorsRM({
    this.primary,
    this.secondary,
    this.tertiary,
  });

  final String? primary;
  final String? secondary;
  final String? tertiary;

  static const fromJson = _$ColorsRMFromJson;
}
