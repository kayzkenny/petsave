import 'package:json_annotation/json_annotation.dart';

part 'pagination_rm.g.dart';

@JsonSerializable(createToJson: false)
class PaginationRM {
  PaginationRM({
    this.countPerPage,
    this.totalCount,
    this.currentPage,
    this.totalPages,
  });

  @JsonKey(name: 'count_per_page')
  final int? countPerPage;
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  static const fromJson = _$PaginationRMFromJson;
}
