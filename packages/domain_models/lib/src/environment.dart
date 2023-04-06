import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment.freezed.dart';

@freezed
class Environment with _$Environment {
  const factory Environment({
    bool? children,
    bool? dogs,
    bool? cats,
  }) = _Environment;
}
