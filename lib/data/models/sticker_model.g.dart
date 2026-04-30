// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStickerModelCollection on Isar {
  IsarCollection<StickerModel> get stickerModels => this.collection();
}

const StickerModelSchema = CollectionSchema(
  name: r'StickerModel',
  id: -3420117257359591185,
  properties: {
    r'canonicalId': PropertySchema(
      id: 0,
      name: r'canonicalId',
      type: IsarType.string,
    ),
    r'isSpecial': PropertySchema(
      id: 1,
      name: r'isSpecial',
      type: IsarType.bool,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'stickerNumber': PropertySchema(
      id: 3,
      name: r'stickerNumber',
      type: IsarType.long,
    ),
    r'stickerSection': PropertySchema(
      id: 4,
      name: r'stickerSection',
      type: IsarType.string,
    )
  },
  estimateSize: _stickerModelEstimateSize,
  serialize: _stickerModelSerialize,
  deserialize: _stickerModelDeserialize,
  deserializeProp: _stickerModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'canonicalId': IndexSchema(
      id: 4719907467128787314,
      name: r'canonicalId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'canonicalId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _stickerModelGetId,
  getLinks: _stickerModelGetLinks,
  attach: _stickerModelAttach,
  version: '3.1.0+1',
);

int _stickerModelEstimateSize(
  StickerModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.canonicalId.length * 3;
  bytesCount += 3 + object.stickerSection.length * 3;
  return bytesCount;
}

void _stickerModelSerialize(
  StickerModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.canonicalId);
  writer.writeBool(offsets[1], object.isSpecial);
  writer.writeLong(offsets[2], object.quantity);
  writer.writeLong(offsets[3], object.stickerNumber);
  writer.writeString(offsets[4], object.stickerSection);
}

StickerModel _stickerModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StickerModel(
    isSpecial: reader.readBool(offsets[1]),
    quantity: reader.readLong(offsets[2]),
    stickerNumber: reader.readLong(offsets[3]),
    stickerSection: reader.readString(offsets[4]),
  );
  object.canonicalId = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _stickerModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stickerModelGetId(StickerModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stickerModelGetLinks(StickerModel object) {
  return [];
}

void _stickerModelAttach(
    IsarCollection<dynamic> col, Id id, StickerModel object) {
  object.id = id;
}

extension StickerModelByIndex on IsarCollection<StickerModel> {
  Future<StickerModel?> getByCanonicalId(String canonicalId) {
    return getByIndex(r'canonicalId', [canonicalId]);
  }

  StickerModel? getByCanonicalIdSync(String canonicalId) {
    return getByIndexSync(r'canonicalId', [canonicalId]);
  }

  Future<bool> deleteByCanonicalId(String canonicalId) {
    return deleteByIndex(r'canonicalId', [canonicalId]);
  }

  bool deleteByCanonicalIdSync(String canonicalId) {
    return deleteByIndexSync(r'canonicalId', [canonicalId]);
  }

  Future<List<StickerModel?>> getAllByCanonicalId(
      List<String> canonicalIdValues) {
    final values = canonicalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'canonicalId', values);
  }

  List<StickerModel?> getAllByCanonicalIdSync(List<String> canonicalIdValues) {
    final values = canonicalIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'canonicalId', values);
  }

  Future<int> deleteAllByCanonicalId(List<String> canonicalIdValues) {
    final values = canonicalIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'canonicalId', values);
  }

  int deleteAllByCanonicalIdSync(List<String> canonicalIdValues) {
    final values = canonicalIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'canonicalId', values);
  }

  Future<Id> putByCanonicalId(StickerModel object) {
    return putByIndex(r'canonicalId', object);
  }

  Id putByCanonicalIdSync(StickerModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'canonicalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCanonicalId(List<StickerModel> objects) {
    return putAllByIndex(r'canonicalId', objects);
  }

  List<Id> putAllByCanonicalIdSync(List<StickerModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'canonicalId', objects, saveLinks: saveLinks);
  }
}

extension StickerModelQueryWhereSort
    on QueryBuilder<StickerModel, StickerModel, QWhere> {
  QueryBuilder<StickerModel, StickerModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StickerModelQueryWhere
    on QueryBuilder<StickerModel, StickerModel, QWhereClause> {
  QueryBuilder<StickerModel, StickerModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<StickerModel, StickerModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<StickerModel, StickerModel, QAfterWhereClause>
      canonicalIdEqualTo(String canonicalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'canonicalId',
        value: [canonicalId],
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterWhereClause>
      canonicalIdNotEqualTo(String canonicalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'canonicalId',
              lower: [],
              upper: [canonicalId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'canonicalId',
              lower: [canonicalId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'canonicalId',
              lower: [canonicalId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'canonicalId',
              lower: [],
              upper: [canonicalId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension StickerModelQueryFilter
    on QueryBuilder<StickerModel, StickerModel, QFilterCondition> {
  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canonicalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canonicalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canonicalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canonicalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'canonicalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'canonicalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'canonicalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'canonicalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canonicalId',
        value: '',
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      canonicalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'canonicalId',
        value: '',
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      isSpecialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSpecial',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stickerNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stickerNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stickerNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stickerNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stickerSection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stickerSection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stickerSection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stickerSection',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stickerSection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stickerSection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stickerSection',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stickerSection',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stickerSection',
        value: '',
      ));
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterFilterCondition>
      stickerSectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stickerSection',
        value: '',
      ));
    });
  }
}

extension StickerModelQueryObject
    on QueryBuilder<StickerModel, StickerModel, QFilterCondition> {}

extension StickerModelQueryLinks
    on QueryBuilder<StickerModel, StickerModel, QFilterCondition> {}

extension StickerModelQuerySortBy
    on QueryBuilder<StickerModel, StickerModel, QSortBy> {
  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> sortByCanonicalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canonicalId', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      sortByCanonicalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canonicalId', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> sortByIsSpecial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSpecial', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> sortByIsSpecialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSpecial', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> sortByStickerNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerNumber', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      sortByStickerNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerNumber', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      sortByStickerSection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerSection', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      sortByStickerSectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerSection', Sort.desc);
    });
  }
}

extension StickerModelQuerySortThenBy
    on QueryBuilder<StickerModel, StickerModel, QSortThenBy> {
  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenByCanonicalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canonicalId', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      thenByCanonicalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canonicalId', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenByIsSpecial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSpecial', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenByIsSpecialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSpecial', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy> thenByStickerNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerNumber', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      thenByStickerNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerNumber', Sort.desc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      thenByStickerSection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerSection', Sort.asc);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QAfterSortBy>
      thenByStickerSectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stickerSection', Sort.desc);
    });
  }
}

extension StickerModelQueryWhereDistinct
    on QueryBuilder<StickerModel, StickerModel, QDistinct> {
  QueryBuilder<StickerModel, StickerModel, QDistinct> distinctByCanonicalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canonicalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StickerModel, StickerModel, QDistinct> distinctByIsSpecial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSpecial');
    });
  }

  QueryBuilder<StickerModel, StickerModel, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<StickerModel, StickerModel, QDistinct>
      distinctByStickerNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stickerNumber');
    });
  }

  QueryBuilder<StickerModel, StickerModel, QDistinct> distinctByStickerSection(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stickerSection',
          caseSensitive: caseSensitive);
    });
  }
}

extension StickerModelQueryProperty
    on QueryBuilder<StickerModel, StickerModel, QQueryProperty> {
  QueryBuilder<StickerModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StickerModel, String, QQueryOperations> canonicalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canonicalId');
    });
  }

  QueryBuilder<StickerModel, bool, QQueryOperations> isSpecialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSpecial');
    });
  }

  QueryBuilder<StickerModel, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<StickerModel, int, QQueryOperations> stickerNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stickerNumber');
    });
  }

  QueryBuilder<StickerModel, String, QQueryOperations>
      stickerSectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stickerSection');
    });
  }
}
