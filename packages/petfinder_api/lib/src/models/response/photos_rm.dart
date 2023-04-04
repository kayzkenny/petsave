import 'package:json_annotation/json_annotation.dart';

part 'photos_rm.g.dart';

@JsonSerializable(createToJson: false)
class PhotosRM {
  PhotosRM({
    required this.small,
    required this.medium,
    required this.large,
    required this.full,
  });

  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  static const fromJson = _$PhotosRMFromJson;
}
