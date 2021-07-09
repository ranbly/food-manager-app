import 'package:food_manager_app/services/auth.dart';
import 'package:food_manager_app/services/me.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(MeService());
  }
}
