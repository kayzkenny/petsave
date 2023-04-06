import 'package:isar/isar.dart';

import 'animal_cm.dart';

part 'organization_cm.g.dart';

@collection
@Name("Organization")
class OrganizationCM {
  @Name("id")
  Id? id;
  @Name("name")
  String? name;
  @Name("email")
  String? email;
  @Name("phone")
  String? phone;
  @Name("address")
  AddressCM? address;
  @Name("url")
  String? url;
  @Name("website")
  String? website;
  @Name("mission_statement")
  String? missionStatement;
  @Name("distance")
  double? distance;
  @Name("photos")
  List<PhotosCM>? photos;
}

@embedded
class AddressCM {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
}
