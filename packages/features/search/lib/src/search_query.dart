import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_query.freezed.dart';

@freezed
class SearchQuery with _$SearchQuery {
  const factory SearchQuery({
    String? breed,
    String? coat,
    String? color,
    String? gender,
    String? age,
    String? organization,
    String? size,
    String? sort,
    String? status,
    String? type,
    bool? declawed,
    bool? goodWithCats,
    bool? goodWithChildren,
    bool? goodWithDogs,
    bool? houseTrained,
    DateTime? after,
    DateTime? before,
  }) = _SearchQuery;
}
