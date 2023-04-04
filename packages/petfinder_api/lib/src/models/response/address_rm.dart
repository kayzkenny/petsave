import 'package:json_annotation/json_annotation.dart';

part 'address_rm.g.dart';

@JsonSerializable(createToJson: false)
class AddressRM {
  AddressRM({
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
  });

  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;

  static const fromJson = _$AddressRMFromJson;
}
