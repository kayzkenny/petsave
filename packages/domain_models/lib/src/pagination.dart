import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int countPerPage,
    required int totalCount,
    required int currentPage,
    required int totalPages,
  }) = _Pagination;
}
