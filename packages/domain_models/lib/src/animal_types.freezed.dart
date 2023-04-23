// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimalTypes {
  String? get name => throw _privateConstructorUsedError;
  List<String>? get coats => throw _privateConstructorUsedError;
  List<String>? get colors => throw _privateConstructorUsedError;
  List<String>? get genders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimalTypesCopyWith<AnimalTypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalTypesCopyWith<$Res> {
  factory $AnimalTypesCopyWith(
          AnimalTypes value, $Res Function(AnimalTypes) then) =
      _$AnimalTypesCopyWithImpl<$Res, AnimalTypes>;
  @useResult
  $Res call(
      {String? name,
      List<String>? coats,
      List<String>? colors,
      List<String>? genders});
}

/// @nodoc
class _$AnimalTypesCopyWithImpl<$Res, $Val extends AnimalTypes>
    implements $AnimalTypesCopyWith<$Res> {
  _$AnimalTypesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? coats = freezed,
    Object? colors = freezed,
    Object? genders = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      coats: freezed == coats
          ? _value.coats
          : coats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      genders: freezed == genders
          ? _value.genders
          : genders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimalTypesCopyWith<$Res>
    implements $AnimalTypesCopyWith<$Res> {
  factory _$$_AnimalTypesCopyWith(
          _$_AnimalTypes value, $Res Function(_$_AnimalTypes) then) =
      __$$_AnimalTypesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      List<String>? coats,
      List<String>? colors,
      List<String>? genders});
}

/// @nodoc
class __$$_AnimalTypesCopyWithImpl<$Res>
    extends _$AnimalTypesCopyWithImpl<$Res, _$_AnimalTypes>
    implements _$$_AnimalTypesCopyWith<$Res> {
  __$$_AnimalTypesCopyWithImpl(
      _$_AnimalTypes _value, $Res Function(_$_AnimalTypes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? coats = freezed,
    Object? colors = freezed,
    Object? genders = freezed,
  }) {
    return _then(_$_AnimalTypes(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      coats: freezed == coats
          ? _value._coats
          : coats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      colors: freezed == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      genders: freezed == genders
          ? _value._genders
          : genders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_AnimalTypes implements _AnimalTypes {
  const _$_AnimalTypes(
      {this.name,
      final List<String>? coats,
      final List<String>? colors,
      final List<String>? genders})
      : _coats = coats,
        _colors = colors,
        _genders = genders;

  @override
  final String? name;
  final List<String>? _coats;
  @override
  List<String>? get coats {
    final value = _coats;
    if (value == null) return null;
    if (_coats is EqualUnmodifiableListView) return _coats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _colors;
  @override
  List<String>? get colors {
    final value = _colors;
    if (value == null) return null;
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _genders;
  @override
  List<String>? get genders {
    final value = _genders;
    if (value == null) return null;
    if (_genders is EqualUnmodifiableListView) return _genders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnimalTypes(name: $name, coats: $coats, colors: $colors, genders: $genders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimalTypes &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._coats, _coats) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            const DeepCollectionEquality().equals(other._genders, _genders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_coats),
      const DeepCollectionEquality().hash(_colors),
      const DeepCollectionEquality().hash(_genders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimalTypesCopyWith<_$_AnimalTypes> get copyWith =>
      __$$_AnimalTypesCopyWithImpl<_$_AnimalTypes>(this, _$identity);
}

abstract class _AnimalTypes implements AnimalTypes {
  const factory _AnimalTypes(
      {final String? name,
      final List<String>? coats,
      final List<String>? colors,
      final List<String>? genders}) = _$_AnimalTypes;

  @override
  String? get name;
  @override
  List<String>? get coats;
  @override
  List<String>? get colors;
  @override
  List<String>? get genders;
  @override
  @JsonKey(ignore: true)
  _$$_AnimalTypesCopyWith<_$_AnimalTypes> get copyWith =>
      throw _privateConstructorUsedError;
}
