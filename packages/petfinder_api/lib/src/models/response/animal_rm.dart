import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/petfinder_api.dart';

part 'animal_rm.g.dart';

@JsonSerializable(createToJson: false)
class AnimalRM {
  AnimalRM({
    this.id,
    this.organizationId,
    this.url,
    this.type,
    this.species,
    this.breeds,
    this.colors,
    this.age,
    this.gender,
    this.size,
    this.coat,
    this.name,
    this.description,
    this.photos,
    this.videos,
    this.status,
    this.attributes,
    this.environment,
    this.tags,
    this.publishedAt,
    this.distance,
    this.contact,
  });

  final int? id;
  @JsonKey(name: 'organization_id')
  final String? organizationId;
  final String? url;
  final String? type;
  final String? species;
  final BreedsRM? breeds;
  final ColorsRM? colors;
  final String? age;
  final String? gender;
  final String? size;
  final String? coat;
  final String? name;
  final String? description;
  final List<PhotosRM>? photos;
  final List<VideosRM>? videos;
  final String? status;
  final AttributesRM? attributes;
  final EnvironmentRM? environment;
  final List<String>? tags;
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  final double? distance;
  final ContactRM? contact;

  static const fromJson = _$AnimalRMFromJson;
}
