// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Food _$_$_FoodFromJson(Map<String, dynamic> json) {
  return _$_Food(
    id: json['id'] as String,
    name: json['name'] as String,
    author: json['author'] as String,
    refrigerator: json['refrigerator'] as String,
    count: json['count'] as int,
    storageMethod: _$enumDecode(_$StorageMethodEnumMap, json['storageMethod']),
    expirationAt: dateTimeFromJson(json['expirationAt'] as Timestamp?),
  );
}

Map<String, dynamic> _$_$_FoodToJson(_$_Food instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'refrigerator': instance.refrigerator,
      'count': instance.count,
      'storageMethod': _$StorageMethodEnumMap[instance.storageMethod],
      'expirationAt': dateTimeToJson(instance.expirationAt),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$StorageMethodEnumMap = {
  StorageMethod.roomTemperature: 'roomTemperature',
  StorageMethod.refrigerate: 'refrigerate',
  StorageMethod.freeze: 'freeze',
};
