// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_types_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalTypesRM _$AnimalTypesRMFromJson(Map<String, dynamic> json) =>
    AnimalTypesRM(
      name: json['name'] as String,
      coats: (json['coats'] as List<dynamic>).map((e) => e as String).toList(),
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      genders:
          (json['genders'] as List<dynamic>).map((e) => e as String).toList(),
    );
