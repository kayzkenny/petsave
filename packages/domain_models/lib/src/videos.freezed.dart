// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'videos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Videos {
  String? get embed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideosCopyWith<Videos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideosCopyWith<$Res> {
  factory $VideosCopyWith(Videos value, $Res Function(Videos) then) =
      _$VideosCopyWithImpl<$Res, Videos>;
  @useResult
  $Res call({String? embed});
}

/// @nodoc
class _$VideosCopyWithImpl<$Res, $Val extends Videos>
    implements $VideosCopyWith<$Res> {
  _$VideosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embed = freezed,
  }) {
    return _then(_value.copyWith(
      embed: freezed == embed
          ? _value.embed
          : embed // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideosCopyWith<$Res> implements $VideosCopyWith<$Res> {
  factory _$$_VideosCopyWith(_$_Videos value, $Res Function(_$_Videos) then) =
      __$$_VideosCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? embed});
}

/// @nodoc
class __$$_VideosCopyWithImpl<$Res>
    extends _$VideosCopyWithImpl<$Res, _$_Videos>
    implements _$$_VideosCopyWith<$Res> {
  __$$_VideosCopyWithImpl(_$_Videos _value, $Res Function(_$_Videos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embed = freezed,
  }) {
    return _then(_$_Videos(
      embed: freezed == embed
          ? _value.embed
          : embed // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Videos implements _Videos {
  const _$_Videos({this.embed});

  @override
  final String? embed;

  @override
  String toString() {
    return 'Videos(embed: $embed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Videos &&
            (identical(other.embed, embed) || other.embed == embed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, embed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideosCopyWith<_$_Videos> get copyWith =>
      __$$_VideosCopyWithImpl<_$_Videos>(this, _$identity);
}

abstract class _Videos implements Videos {
  const factory _Videos({final String? embed}) = _$_Videos;

  @override
  String? get embed;
  @override
  @JsonKey(ignore: true)
  _$$_VideosCopyWith<_$_Videos> get copyWith =>
      throw _privateConstructorUsedError;
}
