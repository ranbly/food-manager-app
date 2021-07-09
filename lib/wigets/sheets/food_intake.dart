import 'package:flutter/material.dart';
import 'package:food_manager_app/models/food.dart';

class FoodIntakeSheet extends StatefulWidget {
  final ScrollController? controller;
  final Food food;

  const FoodIntakeSheet({Key? key, required this.food, this.controller})
      : super(key: key);

  @override
  _FoodIntakeSheetState createState() => _FoodIntakeSheetState();
}

class _FoodIntakeSheetState extends State<FoodIntakeSheet> {
  int _intakeCount = 1;

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
          Text('몇 개를 섭취했나요?'),
          Text('$_intakeCount개'),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('취소'),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context, _intakeCount),
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
