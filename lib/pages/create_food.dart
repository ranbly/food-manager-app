import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_manager_app/common/app_colors.dart';
import 'package:food_manager_app/enum/food_category.dart';
import 'package:food_manager_app/models/food.dart';

class CreateFood extends StatefulWidget {
  static final routePath = '/food/new';

  @override
  _CreateFoodState createState() => _CreateFoodState();
}

class _CreateFoodState extends State<CreateFood> {
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  final nameController = TextEditingController();
  final expirationDateController = TextEditingController();
  final countController = TextEditingController();
  FoodCategory category = FoodCategory.FRIDGE;

  Future<void> _addFoodItem() async {
    if (nameController.value.text == '' ||
        expirationDateController.value.text == '' ||
        countController.value.text == '') {
      return;
    }
    var foodItem = Food(
      name: nameController.value.text,
        expirationDate:  int.parse(expirationDateController.value.text),
      count: int.parse(countController.value.text),
      category: category,
    );

    CollectionReference foods = FirebaseFirestore.instance.collection('foods');
    try {
      await foods.add(foodItem.toJson());
      print('Add foods ${foodItem.toJson()}');
    } catch (e) {
      print("Failed to add foods: $e");
    }
  }

  Widget _buildCategoryGroup(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<FoodCategory>(
          title: const Text('냉장고'),
          value: FoodCategory.FRIDGE,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          groupValue: category,
          onChanged: (FoodCategory? value) {
            if (value == null) return;
            setState(() {
              category = value;
            });
          },
        ),
        RadioListTile<FoodCategory>(
          title: const Text('냉동고'),
          value: FoodCategory.FREEZER,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          groupValue: category,
          onChanged: (FoodCategory? value) {
            if (value == null) return;
            setState(() {
              category = value;
            });
          },
        ),
        RadioListTile<FoodCategory>(
          title: const Text('실온'),
          value: FoodCategory.ROOM_TEMPERATURE,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          groupValue: category,
          onChanged: (FoodCategory? value) {
            if (value == null) return;
            setState(() {
              category = value;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          shadowColor: Colors.transparent,
          brightness: Brightness.light,
          title: Text('음식 추가'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(hintText: '식품명'),
                            onEditingComplete: () {},
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: expirationDateController,
                            decoration: InputDecoration(hintText: '남은기간'),
                            onEditingComplete: () {},
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: countController,
                            decoration: InputDecoration(hintText: '수량'),
                            onEditingComplete: () {},
                          ),
                          _buildCategoryGroup(context),
                        ])),
              ),
            ),
            SafeArea(
                top: false,
                left: false,
                right: false,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: TextButton(
                    onPressed: () async {
                      await _addFoodItem();
                      Navigator.pop(context);
                    },
                    child: Text('추가하기'),
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 16),
                        backgroundColor: AppColors.primary,
                        primary: Colors.white,
                        minimumSize: Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                  ),
                ))
          ],
        ));
  }
}
