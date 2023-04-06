import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.dart';
import 'photos.dart';

part 'organization.freezed.dart';

@freezed
class Organization with _$Organization {
  const factory Organization({
    String? id,
    String? name,
    String? email,
    String? phone,
    Address? address,
    String? url,
    String? website,
    String? missionStatement,
    double? distance,
    List<Photos>? photos,
  }) = _Organization;
}
