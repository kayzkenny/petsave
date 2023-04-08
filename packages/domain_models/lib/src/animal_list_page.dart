import 'package:freezed_annotation/freezed_annotation.dart';

import 'animal.dart';
import 'pagination.dart';

part 'animal_list_page.freezed.dart';

@freezed
class AnimalListPage with _$AnimalListPage {
  const factory AnimalListPage({
    required List<Animal> animalList,
    required Pagination pagination,
  }) = _AnimalListPage;
}
