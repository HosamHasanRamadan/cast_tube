// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_track_details.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetYoutubeTrackDetailsCollection on Isar {
  IsarCollection<YoutubeTrackDetails> get youtubeTrackDetailss =>
      getCollection();
}

const YoutubeTrackDetailsSchema = CollectionSchema(
  name: 'YoutubeTrackDetails',
  schema:
      '{"name":"YoutubeTrackDetails","idName":"id","properties":[{"name":"audioStreamUrl","type":"String"},{"name":"createdAt","type":"Long"},{"name":"duration","type":"String"},{"name":"lastModifiedAt","type":"Long"},{"name":"thumbnailUrl","type":"String"},{"name":"title","type":"String"},{"name":"trackId","type":"String"},{"name":"url","type":"String"}],"indexes":[{"name":"trackId","unique":true,"properties":[{"name":"trackId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'audioStreamUrl': 0,
    'createdAt': 1,
    'duration': 2,
    'lastModifiedAt': 3,
    'thumbnailUrl': 4,
    'title': 5,
    'trackId': 6,
    'url': 7
  },
  listProperties: {},
  indexIds: {'trackId': 0},
  indexValueTypes: {
    'trackId': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _youtubeTrackDetailsGetId,
  setId: _youtubeTrackDetailsSetId,
  getLinks: _youtubeTrackDetailsGetLinks,
  attachLinks: _youtubeTrackDetailsAttachLinks,
  serializeNative: _youtubeTrackDetailsSerializeNative,
  deserializeNative: _youtubeTrackDetailsDeserializeNative,
  deserializePropNative: _youtubeTrackDetailsDeserializePropNative,
  serializeWeb: _youtubeTrackDetailsSerializeWeb,
  deserializeWeb: _youtubeTrackDetailsDeserializeWeb,
  deserializePropWeb: _youtubeTrackDetailsDeserializePropWeb,
  version: 3,
);

int? _youtubeTrackDetailsGetId(YoutubeTrackDetails object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _youtubeTrackDetailsSetId(YoutubeTrackDetails object, int id) {
  object.id = id;
}

List<IsarLinkBase> _youtubeTrackDetailsGetLinks(YoutubeTrackDetails object) {
  return [];
}

const _youtubeTrackDetailsUriConverter = UriConverter();
const _youtubeTrackDetailsDurationConverter = DurationConverter();

void _youtubeTrackDetailsSerializeNative(
    IsarCollection<YoutubeTrackDetails> collection,
    IsarRawObject rawObj,
    YoutubeTrackDetails object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = _youtubeTrackDetailsUriConverter.toIsar(object.audioStreamUrl);
  final _audioStreamUrl = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_audioStreamUrl.length) as int;
  final value1 = object.createdAt;
  final _createdAt = value1;
  final value2 = _youtubeTrackDetailsDurationConverter.toIsar(object.duration);
  IsarUint8List? _duration;
  if (value2 != null) {
    _duration = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_duration?.length ?? 0) as int;
  final value3 = object.lastModifiedAt;
  final _lastModifiedAt = value3;
  final value4 = _youtubeTrackDetailsUriConverter.toIsar(object.thumbnailUrl);
  final _thumbnailUrl = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_thumbnailUrl.length) as int;
  final value5 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_title.length) as int;
  final value6 = object.trackId;
  final _trackId = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_trackId.length) as int;
  final value7 = _youtubeTrackDetailsUriConverter.toIsar(object.url);
  final _url = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_url.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _audioStreamUrl);
  writer.writeDateTime(offsets[1], _createdAt);
  writer.writeBytes(offsets[2], _duration);
  writer.writeDateTime(offsets[3], _lastModifiedAt);
  writer.writeBytes(offsets[4], _thumbnailUrl);
  writer.writeBytes(offsets[5], _title);
  writer.writeBytes(offsets[6], _trackId);
  writer.writeBytes(offsets[7], _url);
}

YoutubeTrackDetails _youtubeTrackDetailsDeserializeNative(
    IsarCollection<YoutubeTrackDetails> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = YoutubeTrackDetails();
  object.audioStreamUrl =
      _youtubeTrackDetailsUriConverter.fromIsar(reader.readString(offsets[0]));
  object.duration = _youtubeTrackDetailsDurationConverter
      .fromIsar(reader.readStringOrNull(offsets[2]));
  object.id = id;
  object.thumbnailUrl =
      _youtubeTrackDetailsUriConverter.fromIsar(reader.readString(offsets[4]));
  object.title = reader.readString(offsets[5]);
  object.trackId = reader.readString(offsets[6]);
  object.url =
      _youtubeTrackDetailsUriConverter.fromIsar(reader.readString(offsets[7]));
  return object;
}

P _youtubeTrackDetailsDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (_youtubeTrackDetailsUriConverter
          .fromIsar(reader.readString(offset))) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (_youtubeTrackDetailsDurationConverter
          .fromIsar(reader.readStringOrNull(offset))) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (_youtubeTrackDetailsUriConverter
          .fromIsar(reader.readString(offset))) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_youtubeTrackDetailsUriConverter
          .fromIsar(reader.readString(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _youtubeTrackDetailsSerializeWeb(
    IsarCollection<YoutubeTrackDetails> collection,
    YoutubeTrackDetails object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'audioStreamUrl',
      _youtubeTrackDetailsUriConverter.toIsar(object.audioStreamUrl));
  IsarNative.jsObjectSet(
      jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'duration',
      _youtubeTrackDetailsDurationConverter.toIsar(object.duration));
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'lastModifiedAt',
      object.lastModifiedAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'thumbnailUrl',
      _youtubeTrackDetailsUriConverter.toIsar(object.thumbnailUrl));
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  IsarNative.jsObjectSet(jsObj, 'trackId', object.trackId);
  IsarNative.jsObjectSet(
      jsObj, 'url', _youtubeTrackDetailsUriConverter.toIsar(object.url));
  return jsObj;
}

YoutubeTrackDetails _youtubeTrackDetailsDeserializeWeb(
    IsarCollection<YoutubeTrackDetails> collection, dynamic jsObj) {
  final object = YoutubeTrackDetails();
  object.audioStreamUrl = _youtubeTrackDetailsUriConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'audioStreamUrl') ?? '');
  object.duration = _youtubeTrackDetailsDurationConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'duration'));
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.thumbnailUrl = _youtubeTrackDetailsUriConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'thumbnailUrl') ?? '');
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  object.trackId = IsarNative.jsObjectGet(jsObj, 'trackId') ?? '';
  object.url = _youtubeTrackDetailsUriConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'url') ?? '');
  return object;
}

P _youtubeTrackDetailsDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'audioStreamUrl':
      return (_youtubeTrackDetailsUriConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'audioStreamUrl') ?? '')) as P;
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'duration':
      return (_youtubeTrackDetailsDurationConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'duration'))) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'lastModifiedAt':
      return (IsarNative.jsObjectGet(jsObj, 'lastModifiedAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'lastModifiedAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'thumbnailUrl':
      return (_youtubeTrackDetailsUriConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'thumbnailUrl') ?? '')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    case 'trackId':
      return (IsarNative.jsObjectGet(jsObj, 'trackId') ?? '') as P;
    case 'url':
      return (_youtubeTrackDetailsUriConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'url') ?? '')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _youtubeTrackDetailsAttachLinks(
    IsarCollection col, int id, YoutubeTrackDetails object) {}

extension YoutubeTrackDetailsByIndex on IsarCollection<YoutubeTrackDetails> {
  Future<YoutubeTrackDetails?> getByTrackId(String trackId) {
    return getByIndex('trackId', [trackId]);
  }

  YoutubeTrackDetails? getByTrackIdSync(String trackId) {
    return getByIndexSync('trackId', [trackId]);
  }

  Future<bool> deleteByTrackId(String trackId) {
    return deleteByIndex('trackId', [trackId]);
  }

  bool deleteByTrackIdSync(String trackId) {
    return deleteByIndexSync('trackId', [trackId]);
  }

  Future<List<YoutubeTrackDetails?>> getAllByTrackId(
      List<String> trackIdValues) {
    final values = trackIdValues.map((e) => [e]).toList();
    return getAllByIndex('trackId', values);
  }

  List<YoutubeTrackDetails?> getAllByTrackIdSync(List<String> trackIdValues) {
    final values = trackIdValues.map((e) => [e]).toList();
    return getAllByIndexSync('trackId', values);
  }

  Future<int> deleteAllByTrackId(List<String> trackIdValues) {
    final values = trackIdValues.map((e) => [e]).toList();
    return deleteAllByIndex('trackId', values);
  }

  int deleteAllByTrackIdSync(List<String> trackIdValues) {
    final values = trackIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('trackId', values);
  }
}

extension YoutubeTrackDetailsQueryWhereSort
    on QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QWhere> {
  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhere>
      anyTrackId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'trackId'));
  }
}

extension YoutubeTrackDetailsQueryWhere
    on QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QWhereClause> {
  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhereClause>
      idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhereClause>
      trackIdEqualTo(String trackId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'trackId',
      value: [trackId],
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterWhereClause>
      trackIdNotEqualTo(String trackId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'trackId',
        upper: [trackId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'trackId',
        lower: [trackId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'trackId',
        lower: [trackId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'trackId',
        upper: [trackId],
        includeUpper: false,
      ));
    }
  }
}

extension YoutubeTrackDetailsQueryFilter on QueryBuilder<YoutubeTrackDetails,
    YoutubeTrackDetails, QFilterCondition> {
  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlEqualTo(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'audioStreamUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlGreaterThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'audioStreamUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlLessThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'audioStreamUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlBetween(
    Uri lower,
    Uri upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'audioStreamUrl',
      lower: _youtubeTrackDetailsUriConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _youtubeTrackDetailsUriConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlStartsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'audioStreamUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlEndsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'audioStreamUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlContains(Uri value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'audioStreamUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      audioStreamUrlMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'audioStreamUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'duration',
      value: null,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationEqualTo(
    Duration? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'duration',
      value: _youtubeTrackDetailsDurationConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationGreaterThan(
    Duration? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'duration',
      value: _youtubeTrackDetailsDurationConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationLessThan(
    Duration? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'duration',
      value: _youtubeTrackDetailsDurationConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationBetween(
    Duration? lower,
    Duration? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'duration',
      lower: _youtubeTrackDetailsDurationConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _youtubeTrackDetailsDurationConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationStartsWith(
    Duration value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'duration',
      value: _youtubeTrackDetailsDurationConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationEndsWith(
    Duration value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'duration',
      value: _youtubeTrackDetailsDurationConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationContains(Duration value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'duration',
      value: _youtubeTrackDetailsDurationConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      durationMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'duration',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      lastModifiedAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastModifiedAt',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      lastModifiedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastModifiedAt',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      lastModifiedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastModifiedAt',
      value: value,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      lastModifiedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastModifiedAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlEqualTo(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'thumbnailUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlGreaterThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'thumbnailUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlLessThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'thumbnailUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlBetween(
    Uri lower,
    Uri upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'thumbnailUrl',
      lower: _youtubeTrackDetailsUriConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _youtubeTrackDetailsUriConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlStartsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'thumbnailUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlEndsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'thumbnailUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlContains(Uri value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'thumbnailUrl',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      thumbnailUrlMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'thumbnailUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'trackId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'trackId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'trackId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'trackId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'trackId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'trackId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'trackId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      trackIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'trackId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlEqualTo(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'url',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlGreaterThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'url',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlLessThan(
    Uri value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'url',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlBetween(
    Uri lower,
    Uri upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'url',
      lower: _youtubeTrackDetailsUriConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _youtubeTrackDetailsUriConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlStartsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'url',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlEndsWith(
    Uri value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'url',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlContains(Uri value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'url',
      value: _youtubeTrackDetailsUriConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'url',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension YoutubeTrackDetailsQueryLinks on QueryBuilder<YoutubeTrackDetails,
    YoutubeTrackDetails, QFilterCondition> {}

extension YoutubeTrackDetailsQueryWhereSortBy
    on QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QSortBy> {
  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByAudioStreamUrl() {
    return addSortByInternal('audioStreamUrl', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByAudioStreamUrlDesc() {
    return addSortByInternal('audioStreamUrl', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByLastModifiedAt() {
    return addSortByInternal('lastModifiedAt', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByLastModifiedAtDesc() {
    return addSortByInternal('lastModifiedAt', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByThumbnailUrl() {
    return addSortByInternal('thumbnailUrl', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByThumbnailUrlDesc() {
    return addSortByInternal('thumbnailUrl', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByTrackId() {
    return addSortByInternal('trackId', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByTrackIdDesc() {
    return addSortByInternal('trackId', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      sortByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension YoutubeTrackDetailsQueryWhereSortThenBy
    on QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QSortThenBy> {
  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByAudioStreamUrl() {
    return addSortByInternal('audioStreamUrl', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByAudioStreamUrlDesc() {
    return addSortByInternal('audioStreamUrl', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByDuration() {
    return addSortByInternal('duration', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByDurationDesc() {
    return addSortByInternal('duration', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByLastModifiedAt() {
    return addSortByInternal('lastModifiedAt', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByLastModifiedAtDesc() {
    return addSortByInternal('lastModifiedAt', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByThumbnailUrl() {
    return addSortByInternal('thumbnailUrl', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByThumbnailUrlDesc() {
    return addSortByInternal('thumbnailUrl', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByTrackId() {
    return addSortByInternal('trackId', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByTrackIdDesc() {
    return addSortByInternal('trackId', Sort.desc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QAfterSortBy>
      thenByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension YoutubeTrackDetailsQueryWhereDistinct
    on QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct> {
  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByAudioStreamUrl({bool caseSensitive = true}) {
    return addDistinctByInternal('audioStreamUrl',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByDuration({bool caseSensitive = true}) {
    return addDistinctByInternal('duration', caseSensitive: caseSensitive);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByLastModifiedAt() {
    return addDistinctByInternal('lastModifiedAt');
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByThumbnailUrl({bool caseSensitive = true}) {
    return addDistinctByInternal('thumbnailUrl', caseSensitive: caseSensitive);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByTrackId({bool caseSensitive = true}) {
    return addDistinctByInternal('trackId', caseSensitive: caseSensitive);
  }

  QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QDistinct>
      distinctByUrl({bool caseSensitive = true}) {
    return addDistinctByInternal('url', caseSensitive: caseSensitive);
  }
}

extension YoutubeTrackDetailsQueryProperty
    on QueryBuilder<YoutubeTrackDetails, YoutubeTrackDetails, QQueryProperty> {
  QueryBuilder<YoutubeTrackDetails, Uri, QQueryOperations>
      audioStreamUrlProperty() {
    return addPropertyNameInternal('audioStreamUrl');
  }

  QueryBuilder<YoutubeTrackDetails, DateTime, QQueryOperations>
      createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<YoutubeTrackDetails, Duration?, QQueryOperations>
      durationProperty() {
    return addPropertyNameInternal('duration');
  }

  QueryBuilder<YoutubeTrackDetails, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<YoutubeTrackDetails, DateTime, QQueryOperations>
      lastModifiedAtProperty() {
    return addPropertyNameInternal('lastModifiedAt');
  }

  QueryBuilder<YoutubeTrackDetails, Uri, QQueryOperations>
      thumbnailUrlProperty() {
    return addPropertyNameInternal('thumbnailUrl');
  }

  QueryBuilder<YoutubeTrackDetails, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<YoutubeTrackDetails, String, QQueryOperations>
      trackIdProperty() {
    return addPropertyNameInternal('trackId');
  }

  QueryBuilder<YoutubeTrackDetails, Uri, QQueryOperations> urlProperty() {
    return addPropertyNameInternal('url');
  }
}
