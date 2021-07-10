import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/common/app_colors.dart';
import 'package:food_manager_app/controllers/foods.dart';
import 'package:food_manager_app/enum/storage_method.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateFoodPage extends StatefulWidget {
  static final routePath = '/food/new';

  @override
  _CreateFoodPageState createState() => _CreateFoodPageState();
}

class _CreateFoodPageState extends State<CreateFoodPage> {
  // Date Format
  final _dateFormat = DateFormat('yy-MM-dd');

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
          title: Text('음식추가'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFormItem(
                              title: '식품명',
                              required: true,
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: '음식 이름을 입력하세요',
                                ),
                              ),
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_rounded),
                            ),
                            SizedBox(height: 8),
                            _buildFormItem(
                              title: '유통기한',
                              required: true,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
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
                                child: IgnorePointer(
                                  child: TextFormField(
                                    key: ValueKey(_expiredAt),
                                    initialValue: _expiredAt != null
                                        ? _dateFormat.format(_expiredAt!)
                                        : '날짜 없음',
                                    decoration: InputDecoration(
                                      hintText: '날짜를 선택하세요',
                                    ),
                                  ),
                                ),
                              ),
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_rounded),
                            ),
                            SizedBox(height: 8),
                            _buildFormItem(
                              title: '보관',
                              required: true,
                              child: _buildCategoryGroup(context),
                            ),
                            SizedBox(height: 8),
                            _buildFormItem(
                              title: '수량',
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: countController,
                                decoration: InputDecoration(
                                  hintText: '수량을 선택하세요',
                                ),
                              ),
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_rounded),
                            ),
                            SizedBox(height: 8),
                            _buildBox(
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: memoController,
                                decoration: InputDecoration(
                                  hintText: '메모',
                                  border: InputBorder.none,
                                ),
                                maxLines: 8,
                              ),
                            ),
                          ])),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 24 + MediaQuery.of(context).padding.bottom,
                top: 24,
              ),
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
            )
          ],
        ));
  }

  // Storage Method Form
  Widget _buildCategoryGroup(BuildContext context) {
    return DropdownButtonFormField<StorageMethod>(
      value: storageMethod,
      icon: Icon(Icons.keyboard_arrow_right_rounded),
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

  Widget _buildBox({required Widget child}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
        ),
        child: child);
  }

  Widget _buildFormItem({
    required String title,
    bool required = false,
    required Widget child,
    Widget? trailing,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
        ),
      ),
      child: _buildBox(
        child: Row(
          children: [
            Container(
              width: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  if (required)
                    Container(color: Colors.red, width: 4, height: 4),
                ],
              ),
            ),
            Expanded(child: child),
            if (trailing != null) trailing,
          ],
        ),
      ),
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
