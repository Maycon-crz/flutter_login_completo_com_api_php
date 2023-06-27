import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class GenericController extends GetxController with StateMixin {
  void logout() {
    // final box = GetStorage();
    // box.erase();
    // Get.offNamed(RouteName.home);
    final box = GetStorage();
    box.remove("token");
    box.remove("login");
    Get.offNamed(RouteName.login);
  }
}
