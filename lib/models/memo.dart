import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';

part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  @JsonSerializable(explicitToJson: true)
  factory Memo({
    required String id,
    required String content,
    required String author,
    required bool checked,
    required String refrigerator,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
