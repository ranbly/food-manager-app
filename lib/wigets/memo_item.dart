import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/controllers/memos.dart';
import 'package:food_manager_app/models/memo.dart';
import 'package:get/get.dart';

class MemoItem extends StatelessWidget {
  final Memo memo;

  const MemoItem({required this.memo});

  MemosController get memosController => Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: memo.checked,
            onChanged: (v) async {
              // TODO 딜레이 추가
              try {
                EasyLoading.show();
                await memosController.checkMemo(memo.id);
              } finally {
                EasyLoading.dismiss();
              }
            },
          ),
          Expanded(
            child: Text(
              memo.content,
              style: TextStyle(color: Color(0xFF3B4655), fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
