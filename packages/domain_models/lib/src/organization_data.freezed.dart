// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrganizationData {
  Organization? get organization => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrganizationDataCopyWith<OrganizationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationDataCopyWith<$Res> {
  factory $OrganizationDataCopyWith(
          OrganizationData value, $Res Function(OrganizationData) then) =
      _$OrganizationDataCopyWithImpl<$Res, OrganizationData>;
  @useResult
  $Res call({Organization? organization});

  $OrganizationCopyWith<$Res>? get organization;
}

/// @nodoc
class _$OrganizationDataCopyWithImpl<$Res, $Val extends OrganizationData>
    implements $OrganizationDataCopyWith<$Res> {
  _$OrganizationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = freezed,
  }) {
    return _then(_value.copyWith(
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganizationCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $OrganizationCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrganizationDataCopyWith<$Res>
    implements $OrganizationDataCopyWith<$Res> {
  factory _$$_OrganizationDataCopyWith(
          _$_OrganizationData value, $Res Function(_$_OrganizationData) then) =
      __$$_OrganizationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Organization? organization});

  @override
  $OrganizationCopyWith<$Res>? get organization;
}

/// @nodoc
class __$$_OrganizationDataCopyWithImpl<$Res>
    extends _$OrganizationDataCopyWithImpl<$Res, _$_OrganizationData>
    implements _$$_OrganizationDataCopyWith<$Res> {
  __$$_OrganizationDataCopyWithImpl(
      _$_OrganizationData _value, $Res Function(_$_OrganizationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = freezed,
  }) {
    return _then(_$_OrganizationData(
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization?,
    ));
  }
}

/// @nodoc

class _$_OrganizationData implements _OrganizationData {
  const _$_OrganizationData({this.organization});

  @override
  final Organization? organization;

  @override
  String toString() {
    return 'OrganizationData(organization: $organization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizationData &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizationDataCopyWith<_$_OrganizationData> get copyWith =>
      __$$_OrganizationDataCopyWithImpl<_$_OrganizationData>(this, _$identity);
}

abstract class _OrganizationData implements OrganizationData {
  const factory _OrganizationData({final Organization? organization}) =
      _$_OrganizationData;

  @override
  Organization? get organization;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationDataCopyWith<_$_OrganizationData> get copyWith =>
      throw _privateConstructorUsedError;
}
