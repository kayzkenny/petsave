import 'package:json_annotation/json_annotation.dart';

part 'address_rm.g.dart';

@JsonSerializable(createToJson: false)
class AddressRM {
  AddressRM({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;

  static const fromJson = _$AddressRMFromJson;
}
