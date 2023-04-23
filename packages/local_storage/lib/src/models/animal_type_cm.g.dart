// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_type_cm.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAnimalTypeCMCollection on Isar {
  IsarCollection<AnimalTypeCM> get animalTypeCMs => this.collection();
}

const AnimalTypeCMSchema = CollectionSchema(
  name: r'AnimalType',
  id: 1383567233025495680,
  properties: {
    r'coats': PropertySchema(
      id: 0,
      name: r'coats',
      type: IsarType.stringList,
    ),
    r'colors': PropertySchema(
      id: 1,
      name: r'colors',
      type: IsarType.stringList,
    ),
    r'genders': PropertySchema(
      id: 2,
      name: r'genders',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _animalTypeCMEstimateSize,
  serialize: _animalTypeCMSerialize,
  deserialize: _animalTypeCMDeserialize,
  deserializeProp: _animalTypeCMDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _animalTypeCMGetId,
  getLinks: _animalTypeCMGetLinks,
  attach: _animalTypeCMAttach,
  version: '3.0.5',
);

int _animalTypeCMEstimateSize(
  AnimalTypeCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.coats;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.colors;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.genders;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _animalTypeCMSerialize(
  AnimalTypeCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.coats);
  writer.writeStringList(offsets[1], object.colors);
  writer.writeStringList(offsets[2], object.genders);
  writer.writeString(offsets[3], object.name);
}

AnimalTypeCM _animalTypeCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimalTypeCM();
  object.coats = reader.readStringList(offsets[0]);
  object.colors = reader.readStringList(offsets[1]);
  object.genders = reader.readStringList(offsets[2]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[3]);
  return object;
}

P _animalTypeCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _animalTypeCMGetId(AnimalTypeCM object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalTypeCMGetLinks(AnimalTypeCM object) {
  return [];
}

void _animalTypeCMAttach(
    IsarCollection<dynamic> col, Id id, AnimalTypeCM object) {
  object.id = id;
}

extension AnimalTypeCMQueryWhereSort
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QWhere> {
  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalTypeCMQueryWhere
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QWhereClause> {
  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AnimalTypeCMQueryFilter
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QFilterCondition> {
  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coats',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coats',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coats',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coats',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coats',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coats',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coats',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coats',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coats',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coats',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      coatsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coats',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colors',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colors',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colors',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colors',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      colorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'colors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genders',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genders',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genders',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genders',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genders',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genders',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genders',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genders',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genders',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genders',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genders',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genders',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      gendersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genders',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension AnimalTypeCMQueryObject
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QFilterCondition> {}

extension AnimalTypeCMQueryLinks
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QFilterCondition> {}

extension AnimalTypeCMQuerySortBy
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QSortBy> {
  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension AnimalTypeCMQuerySortThenBy
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QSortThenBy> {
  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension AnimalTypeCMQueryWhereDistinct
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QDistinct> {
  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QDistinct> distinctByCoats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coats');
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QDistinct> distinctByColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colors');
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QDistinct> distinctByGenders() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genders');
    });
  }

  QueryBuilder<AnimalTypeCM, AnimalTypeCM, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension AnimalTypeCMQueryProperty
    on QueryBuilder<AnimalTypeCM, AnimalTypeCM, QQueryProperty> {
  QueryBuilder<AnimalTypeCM, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnimalTypeCM, List<String>?, QQueryOperations> coatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coats');
    });
  }

  QueryBuilder<AnimalTypeCM, List<String>?, QQueryOperations> colorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colors');
    });
  }

  QueryBuilder<AnimalTypeCM, List<String>?, QQueryOperations>
      gendersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genders');
    });
  }

  QueryBuilder<AnimalTypeCM, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
