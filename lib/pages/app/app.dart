import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_manager_app/bindings/app.dart';
import 'package:food_manager_app/common/app_colors.dart';
import 'package:food_manager_app/controllers/home.dart';
import 'package:food_manager_app/controllers/refrigerators.dart';
import 'package:food_manager_app/pages/food/create.dart';
import 'package:food_manager_app/pages/home/home.dart';
import 'package:food_manager_app/pages/setting/settig.dart';
import 'package:food_manager_app/pages/splash/splash.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      initialRoute: '/',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: BindingsBuilder(() {
            Get.put<RefrigeratorsController>(RefrigeratorsController());
            Get.put<HomeController>(HomeController());
          }),
        ),
        GetPage(
          name: '/food/new',
          page: () => CreateFoodPage(),
        ),
        GetPage(name: '/setting', page: () => SettingPage()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
