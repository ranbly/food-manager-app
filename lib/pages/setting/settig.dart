import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/services/auth.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('로그아웃'),
            onTap: () async {
              try {
                EasyLoading.show();
                await AuthService.to.signOut();
              } finally {
                EasyLoading.dismiss();
              }
            },
          ),
        ],
      ),
    );
  }
}
