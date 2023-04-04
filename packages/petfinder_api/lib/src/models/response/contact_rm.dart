import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/src/models/response/address_rm.dart';

part 'contact_rm.g.dart';

@JsonSerializable(createToJson: false)
class ContactRM {
  ContactRM({
    required this.email,
    required this.phone,
    required this.address,
  });

  final String? email;
  final String? phone;
  final AddressRM? address;

  static const fromJson = _$ContactRMFromJson;
}
