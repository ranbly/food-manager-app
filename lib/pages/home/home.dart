import 'package:flutter/material.dart';
import 'package:food_manager_app/controllers/home.dart';
import 'package:food_manager_app/screens/refrigerator/screen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Stack(
      children: [
        Obx(
          () => !homeController.isInitialized
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: RefrigeratorScreen(
                        refrigerator: homeController.currentRefrigerator.value!,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 50,
                      child: Container(
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
