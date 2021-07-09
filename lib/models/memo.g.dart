// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memo _$_$_MemoFromJson(Map<String, dynamic> json) {
  return _$_Memo(
    id: json['id'] as String,
    content: json['content'] as String,
    author: json['author'] as String,
    checked: json['checked'] as bool,
    refrigerator: json['refrigerator'] as String,
  );
}

Map<String, dynamic> _$_$_MemoToJson(_$_Memo instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author': instance.author,
      'checked': instance.checked,
      'refrigerator': instance.refrigerator,
    };
