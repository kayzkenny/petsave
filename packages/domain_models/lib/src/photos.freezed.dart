// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Photos {
  String? get small => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;
  String? get full => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotosCopyWith<Photos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosCopyWith<$Res> {
  factory $PhotosCopyWith(Photos value, $Res Function(Photos) then) =
      _$PhotosCopyWithImpl<$Res, Photos>;
  @useResult
  $Res call({String? small, String? medium, String? large, String? full});
}

/// @nodoc
class _$PhotosCopyWithImpl<$Res, $Val extends Photos>
    implements $PhotosCopyWith<$Res> {
  _$PhotosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = freezed,
    Object? medium = freezed,
    Object? large = freezed,
    Object? full = freezed,
  }) {
    return _then(_value.copyWith(
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      full: freezed == full
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotosCopyWith<$Res> implements $PhotosCopyWith<$Res> {
  factory _$$_PhotosCopyWith(_$_Photos value, $Res Function(_$_Photos) then) =
      __$$_PhotosCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? small, String? medium, String? large, String? full});
}

/// @nodoc
class __$$_PhotosCopyWithImpl<$Res>
    extends _$PhotosCopyWithImpl<$Res, _$_Photos>
    implements _$$_PhotosCopyWith<$Res> {
  __$$_PhotosCopyWithImpl(_$_Photos _value, $Res Function(_$_Photos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = freezed,
    Object? medium = freezed,
    Object? large = freezed,
    Object? full = freezed,
  }) {
    return _then(_$_Photos(
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      full: freezed == full
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Photos implements _Photos {
  const _$_Photos({this.small, this.medium, this.large, this.full});

  @override
  final String? small;
  @override
  final String? medium;
  @override
  final String? large;
  @override
  final String? full;

  @override
  String toString() {
    return 'Photos(small: $small, medium: $medium, large: $large, full: $full)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Photos &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.full, full) || other.full == full));
  }

  @override
  int get hashCode => Object.hash(runtimeType, small, medium, large, full);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotosCopyWith<_$_Photos> get copyWith =>
      __$$_PhotosCopyWithImpl<_$_Photos>(this, _$identity);
}

abstract class _Photos implements Photos {
  const factory _Photos(
      {final String? small,
      final String? medium,
      final String? large,
      final String? full}) = _$_Photos;

  @override
  String? get small;
  @override
  String? get medium;
  @override
  String? get large;
  @override
  String? get full;
  @override
  @JsonKey(ignore: true)
  _$$_PhotosCopyWith<_$_Photos> get copyWith =>
      throw _privateConstructorUsedError;
}
