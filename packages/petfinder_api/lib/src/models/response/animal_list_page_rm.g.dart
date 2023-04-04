// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalListPageRM _$AnimalListPageRMFromJson(Map<String, dynamic> json) =>
    AnimalListPageRM(
      animalList: (json['animals'] as List<dynamic>)
          .map((e) => AnimalRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationRM.fromJson(json['pagination'] as Map<String, dynamic>),
    );
