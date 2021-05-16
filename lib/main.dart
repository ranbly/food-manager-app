import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_manager_app/common/app_colors.dart';
import 'package:food_manager_app/pages/create_food.dart';
import 'package:food_manager_app/pages/main.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Manager App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
                headline6: TextStyle(
                    color: Color(0xFF3B4655),
                    fontSize: 18,
                    fontWeight: FontWeight.bold))),
        primarySwatch: Colors.blue,
        accentColor: AppColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(title: '나의 냉장고'),
      routes: <String, WidgetBuilder>{
        CreateFood.routePath: (BuildContext context) => CreateFood(),
      },
    );
  }
}
