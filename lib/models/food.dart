import 'package:food_manager_app/enum/food_category.dart';
import 'package:food_manager_app/models/converter/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'food.freezed.dart';

part 'food.g.dart';

@freezed
class Food with _$Food {
  @JsonSerializable(explicitToJson: true)
  factory Food({
    required String id,
    required String name,
    required String author,
    required String refrigerator,
    required int count,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
        required DateTime expirationDate,
    required FoodCategory category,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}
