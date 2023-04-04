// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationListPageRM _$OrganizationListPageRMFromJson(
        Map<String, dynamic> json) =>
    OrganizationListPageRM(
      organizationList: (json['organizations'] as List<dynamic>)
          .map((e) => OrganizationRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationRM.fromJson(json['pagination'] as Map<String, dynamic>),
    );
