import 'package:domain_models/domain_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_data.freezed.dart';

@freezed
class OrganizationData with _$OrganizationData {
  const factory OrganizationData({
    Organization? organization,
  }) = _OrganizationData;
}
