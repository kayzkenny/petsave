import 'package:json_annotation/json_annotation.dart';

part 'videos_rm.g.dart';

@JsonSerializable(createToJson: false)
class VideosRM {
  VideosRM({required this.embed});

  final String? embed;

  static const fromJson = _$VideosRMFromJson;
}
