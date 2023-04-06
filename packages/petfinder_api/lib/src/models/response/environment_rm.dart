import 'package:json_annotation/json_annotation.dart';

part 'environment_rm.g.dart';

@JsonSerializable(createToJson: false)
class EnvironmentRM {
  EnvironmentRM({
    this.children,
    this.dogs,
    this.cats,
  });

  final bool? children;
  final bool? dogs;
  final bool? cats;

  static const fromJson = _$EnvironmentRMFromJson;
}
