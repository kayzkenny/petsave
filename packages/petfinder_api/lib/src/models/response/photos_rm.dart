import 'package:json_annotation/json_annotation.dart';

part 'photos_rm.g.dart';

@JsonSerializable(createToJson: false)
class PhotosRM {
  PhotosRM({
    this.small,
    this.medium,
    this.large,
    this.full,
  });

  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  static const fromJson = _$PhotosRMFromJson;
}
