import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/login_controller.dart';
import 'package:login_flutter/app/modules/repository/login_repository.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => LoginRepository(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}
