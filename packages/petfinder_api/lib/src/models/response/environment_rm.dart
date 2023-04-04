import 'package:json_annotation/json_annotation.dart';

part 'environment_rm.g.dart';

@JsonSerializable(createToJson: false)
class EnvironmentRM {
  EnvironmentRM({
    required this.children,
    required this.dogs,
    required this.cats,
  });

  final bool? children;
  final bool? dogs;
  final bool? cats;

  static const fromJson = _$EnvironmentRMFromJson;
}
