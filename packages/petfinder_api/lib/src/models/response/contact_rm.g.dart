// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactRM _$ContactRMFromJson(Map<String, dynamic> json) => ContactRM(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] == null
          ? null
          : AddressRM.fromJson(json['address'] as Map<String, dynamic>),
    );
