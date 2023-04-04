import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/src/models/response/address_rm.dart';
import 'package:petfinder_api/src/models/response/photos_rm.dart';

part 'organization_rm.g.dart';

@JsonSerializable(createToJson: false)
class OrganizationRM {
  OrganizationRM({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.url,
    required this.website,
    required this.missionStatement,
    required this.distance,
    required this.photos,
  });

  final String id;
  final String? name;
  final String? email;
  final String? phone;
  final AddressRM? address;
  final String? url;
  final String? website;
  @JsonKey(name: 'mission_statement')
  final String? missionStatement;
  final double? distance;
  final List<PhotosRM>? photos;

  static const fromJson = _$OrganizationRMFromJson;
}
