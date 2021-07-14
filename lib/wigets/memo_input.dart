import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/controllers/home.dart';
import 'package:food_manager_app/controllers/memos.dart';
import 'package:food_manager_app/controllers/refrigerators.dart';
import 'package:get/get.dart';

class MemoInput extends StatelessWidget {
  final inputController = TextEditingController();

  MemosController get memosController =>
      Get.find(tag: HomeController.to.currentRefrigerator.value?.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(value: false, onChanged: null),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: inputController,
                  decoration: InputDecoration(hintText: '추가하기...'),
                  onEditingComplete: () async {
                    await _addMemo();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _addMemo() async {
    try {
      EasyLoading.show();
      await memosController.addMemo(inputController.text);

      // Input 초기화
      inputController.text = '';
    } finally {
      EasyLoading.dismiss();
    }
  }
}
