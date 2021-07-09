// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refrigerator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Refrigerator _$_$_RefrigeratorFromJson(Map<String, dynamic> json) {
  return _$_Refrigerator(
    id: json['id'] as String,
    name: json['name'] as String,
    users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
    author: json['author'] as String,
  );
}

Map<String, dynamic> _$_$_RefrigeratorToJson(_$_Refrigerator instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users,
      'author': instance.author,
    };
