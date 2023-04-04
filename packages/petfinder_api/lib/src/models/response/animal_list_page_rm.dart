import 'package:json_annotation/json_annotation.dart';
import 'package:petfinder_api/src/models/response/animal_rm.dart';
import 'package:petfinder_api/src/models/response/pagination_rm.dart';

part 'animal_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class AnimalListPageRM {
  const AnimalListPageRM({
    required this.animalList,
    required this.pagination,
  });

  @JsonKey(name: 'animals')
  final List<AnimalRM> animalList;
  final PaginationRM pagination;

  static const fromJson = _$AnimalListPageRMFromJson;
}
