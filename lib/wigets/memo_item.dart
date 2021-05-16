import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_manager_app/models/memo.dart';

class MemoItem extends StatelessWidget {
  final Memo memo;

  const MemoItem({required this.memo}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Checkbox(value: false, onChanged: null),
      Text(
        memo.text,
        style: TextStyle(color: Color(0xFF3B4655), fontSize: 17),
      )
    ]));
  }
}
