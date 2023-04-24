import 'package:domain_models/domain_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';

@freezed
class Animal with _$Animal {
  const factory Animal({
    int? id,
    String? organizationId,
    String? url,
    String? type,
    String? species,
    Breeds? breeds,
    AnimalColors? colors,
    String? age,
    String? gender,
    String? size,
    String? coat,
    String? name,
    String? description,
    List<Photos>? photos,
    List<Videos>? videos,
    String? status,
    Attributes? attributes,
    Environment? environment,
    List<String>? tags,
    DateTime? publishedAt,
    double? distance,
    Contact? contact,
  }) = _Animal;
}
