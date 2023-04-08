import 'package:freezed_annotation/freezed_annotation.dart';

import 'organization.dart';
import 'pagination.dart';

part 'organization_list_page.freezed.dart';

@freezed
class OrganizationListPage with _$OrganizationListPage {
  const factory OrganizationListPage({
    required List<Organization> organizationList,
    required Pagination pagination,
  }) = _OrganizationListPage;
}
