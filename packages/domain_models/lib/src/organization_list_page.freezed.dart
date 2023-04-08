// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_list_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrganizationListPage {
  List<Organization> get organizationList => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrganizationListPageCopyWith<OrganizationListPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationListPageCopyWith<$Res> {
  factory $OrganizationListPageCopyWith(OrganizationListPage value,
          $Res Function(OrganizationListPage) then) =
      _$OrganizationListPageCopyWithImpl<$Res, OrganizationListPage>;
  @useResult
  $Res call({List<Organization> organizationList, Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$OrganizationListPageCopyWithImpl<$Res,
        $Val extends OrganizationListPage>
    implements $OrganizationListPageCopyWith<$Res> {
  _$OrganizationListPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationList = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      organizationList: null == organizationList
          ? _value.organizationList
          : organizationList // ignore: cast_nullable_to_non_nullable
              as List<Organization>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrganizationListPageCopyWith<$Res>
    implements $OrganizationListPageCopyWith<$Res> {
  factory _$$_OrganizationListPageCopyWith(_$_OrganizationListPage value,
          $Res Function(_$_OrganizationListPage) then) =
      __$$_OrganizationListPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Organization> organizationList, Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$_OrganizationListPageCopyWithImpl<$Res>
    extends _$OrganizationListPageCopyWithImpl<$Res, _$_OrganizationListPage>
    implements _$$_OrganizationListPageCopyWith<$Res> {
  __$$_OrganizationListPageCopyWithImpl(_$_OrganizationListPage _value,
      $Res Function(_$_OrganizationListPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationList = null,
    Object? pagination = null,
  }) {
    return _then(_$_OrganizationListPage(
      organizationList: null == organizationList
          ? _value._organizationList
          : organizationList // ignore: cast_nullable_to_non_nullable
              as List<Organization>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc

class _$_OrganizationListPage implements _OrganizationListPage {
  const _$_OrganizationListPage(
      {required final List<Organization> organizationList,
      required this.pagination})
      : _organizationList = organizationList;

  final List<Organization> _organizationList;
  @override
  List<Organization> get organizationList {
    if (_organizationList is EqualUnmodifiableListView)
      return _organizationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizationList);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'OrganizationListPage(organizationList: $organizationList, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizationListPage &&
            const DeepCollectionEquality()
                .equals(other._organizationList, _organizationList) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_organizationList), pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizationListPageCopyWith<_$_OrganizationListPage> get copyWith =>
      __$$_OrganizationListPageCopyWithImpl<_$_OrganizationListPage>(
          this, _$identity);
}

abstract class _OrganizationListPage implements OrganizationListPage {
  const factory _OrganizationListPage(
      {required final List<Organization> organizationList,
      required final Pagination pagination}) = _$_OrganizationListPage;

  @override
  List<Organization> get organizationList;
  @override
  Pagination get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationListPageCopyWith<_$_OrganizationListPage> get copyWith =>
      throw _privateConstructorUsedError;
}
