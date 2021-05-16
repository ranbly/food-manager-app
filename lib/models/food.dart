import 'package:food_manager_app/enum/food_category.dart';

class Food {
  String name;
  int expirationDate;
  int count;
  FoodCategory category;

  Food(
      {required this.name,
      required this.expirationDate,
      required this.count,
      required this.category});

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'expirationDate': this.expirationDate,
      'count': this.count,
      'category': this.category.value,
    };
  }
}
