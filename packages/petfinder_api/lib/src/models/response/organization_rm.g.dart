// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationRM _$OrganizationRMFromJson(Map<String, dynamic> json) =>
    OrganizationRM(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] == null
          ? null
          : AddressRM.fromJson(json['address'] as Map<String, dynamic>),
      url: json['url'] as String?,
      website: json['website'] as String?,
      missionStatement: json['mission_statement'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotosRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
