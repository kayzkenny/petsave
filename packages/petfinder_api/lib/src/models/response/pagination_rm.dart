import 'package:json_annotation/json_annotation.dart';

part 'pagination_rm.g.dart';

@JsonSerializable(createToJson: false)
class PaginationRM {
  PaginationRM({
    required this.countPerPage,
    required this.totalCount,
    required this.currentPage,
    required this.totalPages,
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
