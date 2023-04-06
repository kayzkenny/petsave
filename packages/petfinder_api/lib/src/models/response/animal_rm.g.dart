// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalRM _$AnimalRMFromJson(Map<String, dynamic> json) => AnimalRM(
      id: json['id'] as int?,
      organizationId: json['organization_id'] as String?,
      url: json['url'] as String?,
      type: json['type'] as String?,
      species: json['species'] as String?,
      breeds: json['breeds'] == null
          ? null
          : BreedsRM.fromJson(json['breeds'] as Map<String, dynamic>),
      colors: json['colors'] == null
          ? null
          : ColorsRM.fromJson(json['colors'] as Map<String, dynamic>),
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      size: json['size'] as String?,
      coat: json['coat'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotosRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => VideosRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesRM.fromJson(json['attributes'] as Map<String, dynamic>),
      environment: json['environment'] == null
          ? null
          : EnvironmentRM.fromJson(json['environment'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publishedAt: json['published_at'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
    );
