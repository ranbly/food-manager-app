import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Checkbox(value: false, onChanged: null),
      Expanded(
        child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextField(
                controller: inputController,
                decoration: InputDecoration(hintText: '추가하기...'),
                onEditingComplete: () {
                  CollectionReference users =
                      FirebaseFirestore.instance.collection('users');

                  users
                      .add({
                        'full_name': inputController.text, // John Doe
                      })
                      .then((value) => print("User Added"))
                      .catchError(
                          (error) => print("Failed to add user: $error"));
                },
              )
            ])),
      ),
    ]));
  }
}
