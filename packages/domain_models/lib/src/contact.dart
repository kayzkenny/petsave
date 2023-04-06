import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.dart';

part 'contact.freezed.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    String? email,
    String? phone,
    Address? address,
  }) = _Contact;
}
