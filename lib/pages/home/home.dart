import 'package:flutter/material.dart';
import 'package:food_manager_app/controllers/home.dart';
import 'package:food_manager_app/screens/refrigerator/screen.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final _bottomBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener())
    ..load();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () {
            return !controller.isInitialized
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: RefrigeratorScreen(
                          refrigerator: controller.currentRefrigerator.value!,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 50,
                        child: AdWidget(ad: _bottomBanner),
                      )
                    ],
                  );
          },
        ),
      ],
    );
  }
}
