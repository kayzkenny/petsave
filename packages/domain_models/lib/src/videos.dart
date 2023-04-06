import 'package:freezed_annotation/freezed_annotation.dart';

part 'videos.freezed.dart';

@freezed
class Videos with _$Videos {
  const factory Videos({String? embed}) = _Videos;
}
