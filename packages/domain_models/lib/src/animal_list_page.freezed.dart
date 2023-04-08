// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_list_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimalListPage {
  List<Animal> get animalList => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimalListPageCopyWith<AnimalListPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalListPageCopyWith<$Res> {
  factory $AnimalListPageCopyWith(
          AnimalListPage value, $Res Function(AnimalListPage) then) =
      _$AnimalListPageCopyWithImpl<$Res, AnimalListPage>;
  @useResult
  $Res call({List<Animal> animalList, Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$AnimalListPageCopyWithImpl<$Res, $Val extends AnimalListPage>
    implements $AnimalListPageCopyWith<$Res> {
  _$AnimalListPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animalList = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      animalList: null == animalList
          ? _value.animalList
          : animalList // ignore: cast_nullable_to_non_nullable
              as List<Animal>,
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
abstract class _$$_AnimalListPageCopyWith<$Res>
    implements $AnimalListPageCopyWith<$Res> {
  factory _$$_AnimalListPageCopyWith(
          _$_AnimalListPage value, $Res Function(_$_AnimalListPage) then) =
      __$$_AnimalListPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Animal> animalList, Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$_AnimalListPageCopyWithImpl<$Res>
    extends _$AnimalListPageCopyWithImpl<$Res, _$_AnimalListPage>
    implements _$$_AnimalListPageCopyWith<$Res> {
  __$$_AnimalListPageCopyWithImpl(
      _$_AnimalListPage _value, $Res Function(_$_AnimalListPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animalList = null,
    Object? pagination = null,
  }) {
    return _then(_$_AnimalListPage(
      animalList: null == animalList
          ? _value._animalList
          : animalList // ignore: cast_nullable_to_non_nullable
              as List<Animal>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc

class _$_AnimalListPage implements _AnimalListPage {
  const _$_AnimalListPage(
      {required final List<Animal> animalList, required this.pagination})
      : _animalList = animalList;

  final List<Animal> _animalList;
  @override
  List<Animal> get animalList {
    if (_animalList is EqualUnmodifiableListView) return _animalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animalList);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'AnimalListPage(animalList: $animalList, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimalListPage &&
            const DeepCollectionEquality()
                .equals(other._animalList, _animalList) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_animalList), pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimalListPageCopyWith<_$_AnimalListPage> get copyWith =>
      __$$_AnimalListPageCopyWithImpl<_$_AnimalListPage>(this, _$identity);
}

abstract class _AnimalListPage implements AnimalListPage {
  const factory _AnimalListPage(
      {required final List<Animal> animalList,
      required final Pagination pagination}) = _$_AnimalListPage;

  @override
  List<Animal> get animalList;
  @override
  Pagination get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_AnimalListPageCopyWith<_$_AnimalListPage> get copyWith =>
      throw _privateConstructorUsedError;
}
