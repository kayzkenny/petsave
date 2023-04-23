import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/petfinder_api.dart';

part 'organization_data_rm.g.dart';

@JsonSerializable(createToJson: false)
class OrganizationDataRM {
  const OrganizationDataRM({required this.organization});

  final OrganizationRM organization;

  static const fromJson = _$OrganizationDataRMFromJson;
}
