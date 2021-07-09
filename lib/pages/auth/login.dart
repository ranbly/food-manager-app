import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/services/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                try {
                  EasyLoading.show();
                  await AuthService.to.signInWithGoogle();
                } finally {
                  EasyLoading.dismiss();
                }
              },
              child: Text('구글 로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
