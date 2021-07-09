import 'package:flutter/material.dart';
import 'package:food_manager_app/models/food.dart';
import 'package:food_manager_app/wigets/day_chip.dart';

class FoodDetailSheet extends StatelessWidget {
  final ScrollController? controller;
  final Food food;

  const FoodDetailSheet({Key? key, required this.food, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 2,
            width: 120,
            margin: EdgeInsets.only(top: 8, bottom: 32),
            color: Colors.red,
          ),
          Expanded(
            child: ListView(
              controller: controller,
              children: [
                Text('냉장보관'),
                Row(
                  children: [
                    Text(food.name),
                    DayChip(date: food.expirationAt),
                  ],
                ),
                Row(
                  children: [
                    Container(width: 80, child: Text('수량')),
                    Text(food.count.toString())
                  ],
                ),
                Row(
                  children: [
                    Container(width: 80, child: Text('메모')),
                    Text(food.count.toString())
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context, 'edit'),
                  child: Text('편집'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context, 'intake'),
                  child: Text('섭취'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
