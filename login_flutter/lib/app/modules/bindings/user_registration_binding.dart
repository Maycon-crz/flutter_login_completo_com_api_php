import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/user_registration_controller.dart';

class UserRegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRegistrationController());
  }
}