import 'dart:async';

import 'package:food_manager_app/controllers/refrigerators.dart';
import 'package:food_manager_app/models/refrigerator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Refrigerator?> currentRefrigerator = Rx(null);

  bool get isInitialized => currentRefrigerator.value != null;

  StreamSubscription? _refrigeratorSubscription;

  @override
  void onInit() {
    super.onInit();

    // 현재 냉장고 상태 업데이트
    _refrigeratorSubscription = Get.find<RefrigeratorsController>()
        .refrigerators
        .subject
        .listen((event) {
      if (currentRefrigerator.value == null && event.isNotEmpty) {
        currentRefrigerator.value = event.first;
        _refrigeratorSubscription?.cancel();
      }
    });
  }

  changeCurrentRefrigerator(Refrigerator refrigerator) async {
    this.currentRefrigerator.value = null;
    await 0.1.delay();
    this.currentRefrigerator.value = refrigerator;
  }
}
