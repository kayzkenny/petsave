// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_types_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimalTypesData {
  AnimalTypes? get animal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimalTypesDataCopyWith<AnimalTypesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalTypesDataCopyWith<$Res> {
  factory $AnimalTypesDataCopyWith(
          AnimalTypesData value, $Res Function(AnimalTypesData) then) =
      _$AnimalTypesDataCopyWithImpl<$Res, AnimalTypesData>;
  @useResult
  $Res call({AnimalTypes? animal});

  $AnimalTypesCopyWith<$Res>? get animal;
}

/// @nodoc
class _$AnimalTypesDataCopyWithImpl<$Res, $Val extends AnimalTypesData>
    implements $AnimalTypesDataCopyWith<$Res> {
  _$AnimalTypesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animal = freezed,
  }) {
    return _then(_value.copyWith(
      animal: freezed == animal
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as AnimalTypes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimalTypesCopyWith<$Res>? get animal {
    if (_value.animal == null) {
      return null;
    }

    return $AnimalTypesCopyWith<$Res>(_value.animal!, (value) {
      return _then(_value.copyWith(animal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnimalTypesDataCopyWith<$Res>
    implements $AnimalTypesDataCopyWith<$Res> {
  factory _$$_AnimalTypesDataCopyWith(
          _$_AnimalTypesData value, $Res Function(_$_AnimalTypesData) then) =
      __$$_AnimalTypesDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AnimalTypes? animal});

  @override
  $AnimalTypesCopyWith<$Res>? get animal;
}

/// @nodoc
class __$$_AnimalTypesDataCopyWithImpl<$Res>
    extends _$AnimalTypesDataCopyWithImpl<$Res, _$_AnimalTypesData>
    implements _$$_AnimalTypesDataCopyWith<$Res> {
  __$$_AnimalTypesDataCopyWithImpl(
      _$_AnimalTypesData _value, $Res Function(_$_AnimalTypesData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animal = freezed,
  }) {
    return _then(_$_AnimalTypesData(
      animal: freezed == animal
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as AnimalTypes?,
    ));
  }
}

/// @nodoc

class _$_AnimalTypesData implements _AnimalTypesData {
  const _$_AnimalTypesData({this.animal});

  @override
  final AnimalTypes? animal;

  @override
  String toString() {
    return 'AnimalTypesData(animal: $animal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimalTypesData &&
            (identical(other.animal, animal) || other.animal == animal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, animal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimalTypesDataCopyWith<_$_AnimalTypesData> get copyWith =>
      __$$_AnimalTypesDataCopyWithImpl<_$_AnimalTypesData>(this, _$identity);
}

abstract class _AnimalTypesData implements AnimalTypesData {
  const factory _AnimalTypesData({final AnimalTypes? animal}) =
      _$_AnimalTypesData;

  @override
  AnimalTypes? get animal;
  @override
  @JsonKey(ignore: true)
  _$$_AnimalTypesDataCopyWith<_$_AnimalTypesData> get copyWith =>
      throw _privateConstructorUsedError;
}
