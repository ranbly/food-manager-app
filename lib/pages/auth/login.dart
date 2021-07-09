import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/services/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '나만의 냉장고 관리',
                      style: TextStyle(color: Color(0xFF4A5562)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text('마이냉장고',
                        style: TextStyle(
                            color: Color(0xFF1C1C1F),
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: FlutterLogo(
                        size: 142,
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(double.infinity, 48),
                        ),
                        onPressed: () async {
                          try {
                            EasyLoading.show();
                            await AuthService.to.signInWithGoogle();
                          } finally {
                            EasyLoading.dismiss();
                          }
                        },
                        child: Container(
                          child: Text('구글로 로그인',
                              style: TextStyle(
                                  color: Color(0xFF686876),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            backgroundColor: Color(0xFF141414),
                          ),
                          onPressed: () async {
                            try {
                              EasyLoading.show();
                              await AuthService.to.signInWithGoogle();
                            } finally {
                              EasyLoading.dismiss();
                            }
                          },
                          child: Container(
                            child: Text('Apple로 로그인',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
