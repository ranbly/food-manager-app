import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/common/app_colors.dart';
import 'package:food_manager_app/controllers/foods.dart';
import 'package:food_manager_app/enum/storage_method.dart';
import 'package:get/get.dart';

class CreateFoodPage extends StatefulWidget {
  static final routePath = '/food/new';

  @override
  _CreateFoodPageState createState() => _CreateFoodPageState();
}

class _CreateFoodPageState extends State<CreateFoodPage> {
  final _formKey = GlobalKey<FormState>();

  // Food Form Item
  DateTime? _expiredAt;
  final nameController = TextEditingController();
  final countController = TextEditingController();
  final memoController = TextEditingController();
  StorageMethod storageMethod = StorageMethod.refrigerate;

  // Foods Controller
  FoodsController get foodsController => Get.find();

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
                          InkWell(
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(Duration(days: 365 * 10)),
                                lastDate: DateTime.now()
                                    .add(Duration(days: 365 * 10)),
                              );
                              if (date == null) return;
                              setState(() {
                                this._expiredAt = date;
                              });
                            },
                            child: Text(
                              this._expiredAt?.toIso8601String() ?? '날짜 없음',
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: countController,
                            decoration: InputDecoration(hintText: '수량'),
                            onEditingComplete: () {},
                          ),
                          TextField(
                            keyboardType: TextInputType.text,
                            controller: memoController,
                            decoration: InputDecoration(hintText: '메모'),
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
                    onPressed: () {
                      _addFoodItem();
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

  // Storage Method Form
  Widget _buildCategoryGroup(BuildContext context) {
    return DropdownButtonFormField<StorageMethod>(
      value: storageMethod,
      items: StorageMethod.values
          .map((e) => DropdownMenuItem(value: e, child: Text(e.label)))
          .toList(),
      onChanged: (method) {
        if (method == null) return;
        setState(() {
          this.storageMethod = method;
        });
      },
    );
  }

  Future<void> _addFoodItem() async {
    final expiredAt = _expiredAt;
    if (nameController.value.text == '' ||
        countController.value.text == '' ||
        expiredAt == null) {
      return;
    }

    try {
      EasyLoading.show();
      await foodsController.addFood(
        name: nameController.text,
        storageMethod: storageMethod,
        expirationAt: expiredAt,
        count: int.parse(countController.text),
        memo: memoController.value.text,
      );

      Get.back();
    } finally {
      EasyLoading.dismiss();
    }
  }
}
