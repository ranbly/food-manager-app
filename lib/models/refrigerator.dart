import 'package:freezed_annotation/freezed_annotation.dart';

part 'refrigerator.freezed.dart';

part 'refrigerator.g.dart';

@freezed
class Refrigerator with _$Refrigerator {
  @JsonSerializable(explicitToJson: true)
  factory Refrigerator({
    required String id,
    required String name,
    required List<String> users,
    required String author,
  }) = _Refrigerator;

  factory Refrigerator.fromJson(Map<String, dynamic> json) =>
      _$RefrigeratorFromJson(json);
}
