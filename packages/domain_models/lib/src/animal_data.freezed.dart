// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimalData {
  Animal? get animal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimalDataCopyWith<AnimalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalDataCopyWith<$Res> {
  factory $AnimalDataCopyWith(
          AnimalData value, $Res Function(AnimalData) then) =
      _$AnimalDataCopyWithImpl<$Res, AnimalData>;
  @useResult
  $Res call({Animal? animal});

  $AnimalCopyWith<$Res>? get animal;
}

/// @nodoc
class _$AnimalDataCopyWithImpl<$Res, $Val extends AnimalData>
    implements $AnimalDataCopyWith<$Res> {
  _$AnimalDataCopyWithImpl(this._value, this._then);

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
              as Animal?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimalCopyWith<$Res>? get animal {
    if (_value.animal == null) {
      return null;
    }

    return $AnimalCopyWith<$Res>(_value.animal!, (value) {
      return _then(_value.copyWith(animal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnimalDataCopyWith<$Res>
    implements $AnimalDataCopyWith<$Res> {
  factory _$$_AnimalDataCopyWith(
          _$_AnimalData value, $Res Function(_$_AnimalData) then) =
      __$$_AnimalDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Animal? animal});

  @override
  $AnimalCopyWith<$Res>? get animal;
}

/// @nodoc
class __$$_AnimalDataCopyWithImpl<$Res>
    extends _$AnimalDataCopyWithImpl<$Res, _$_AnimalData>
    implements _$$_AnimalDataCopyWith<$Res> {
  __$$_AnimalDataCopyWithImpl(
      _$_AnimalData _value, $Res Function(_$_AnimalData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animal = freezed,
  }) {
    return _then(_$_AnimalData(
      animal: freezed == animal
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as Animal?,
    ));
  }
}

/// @nodoc

class _$_AnimalData implements _AnimalData {
  const _$_AnimalData({this.animal});

  @override
  final Animal? animal;

  @override
  String toString() {
    return 'AnimalData(animal: $animal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimalData &&
            (identical(other.animal, animal) || other.animal == animal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, animal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimalDataCopyWith<_$_AnimalData> get copyWith =>
      __$$_AnimalDataCopyWithImpl<_$_AnimalData>(this, _$identity);
}

abstract class _AnimalData implements AnimalData {
  const factory _AnimalData({final Animal? animal}) = _$_AnimalData;

  @override
  Animal? get animal;
  @override
  @JsonKey(ignore: true)
  _$$_AnimalDataCopyWith<_$_AnimalData> get copyWith =>
      throw _privateConstructorUsedError;
}
