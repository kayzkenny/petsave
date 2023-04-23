// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_single_type_data_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalSingleTypeDataRM _$AnimalSingleTypeDataRMFromJson(
        Map<String, dynamic> json) =>
    AnimalSingleTypeDataRM(
      type: (json['type'] as List<dynamic>)
          .map((e) => AnimalTypesRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
