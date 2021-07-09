import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/controllers/foods.dart';
import 'package:food_manager_app/models/food.dart';
import 'package:food_manager_app/wigets/day_chip.dart';
import 'package:food_manager_app/wigets/sheets/food_detail.dart';
import 'package:food_manager_app/wigets/sheets/food_intake.dart';
import 'package:get/get.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem(this.food) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _showDetailSheet(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DayChip(date: food.expirationAt),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 4),
              child: Text(
                food.name,
                style: TextStyle(fontSize: 15),
              ),
            ),
            if (food.count > 1) Text('(${food.count})')
          ],
        ),
      ),
    );
  }

  _showDetailSheet(BuildContext context) async {
    final result = await showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: (context, controller, _) =>
          FoodDetailSheet(food: food, controller: controller),
      anchors: [0, 0.5, 1],
    );

    if (result == 'edit') {
      // TODO Edit Page
    } else if (result == 'intake') {
      _showIntakeSheet(context);
    }
  }

  _showIntakeSheet(BuildContext context) async {
    final result = await showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: (context, controller, _) =>
          FoodIntakeSheet(food: food, controller: controller),
      anchors: [0, 0.5, 1],
    );

    if (result is int && result > 0) {
      final foodsController = Get.find<FoodsController>();
      try {
        EasyLoading.show();
        await foodsController.intake(food: food, count: result);
      } finally {
        EasyLoading.dismiss();
      }
    }
  }
}
