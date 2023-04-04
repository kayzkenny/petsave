import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/src/models/response/organization_rm.dart';
import 'package:petfinder_api/src/models/response/pagination_rm.dart';

part 'organization_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class OrganizationListPageRM {
  const OrganizationListPageRM({
    required this.organizationList,
    required this.pagination,
  });

  @JsonKey(name: 'organizations')
  final List<OrganizationRM> organizationList;
  final PaginationRM pagination;

  static const fromJson = _$OrganizationListPageRMFromJson;
}
