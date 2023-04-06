import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? postcode,
    String? country,
  }) = _Address;
}
