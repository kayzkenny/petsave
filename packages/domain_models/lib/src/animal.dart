import 'package:freezed_annotation/freezed_annotation.dart';

import 'attributes.dart';
import 'breeds.dart';
import 'colors.dart';
import 'environment.dart';
import 'photos.dart';
import 'videos.dart';

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
  }) = _Animal;
}
