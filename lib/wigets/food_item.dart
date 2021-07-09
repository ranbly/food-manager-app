import 'package:flutter/cupertino.dart';
import 'package:food_manager_app/models/food.dart';
import 'package:food_manager_app/wigets/day_chip.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem(this.food) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DayChip(date: food.expirationAt),
          Padding(
            padding: EdgeInsets.only(
              left: 12,
            ),
            child: Text(
              food.name,
              style: TextStyle(fontSize: 15),
            ),
          ),
          if ((food.count) > 1) Text('${food.count}')
        ],
      ),
    );
  }
}
