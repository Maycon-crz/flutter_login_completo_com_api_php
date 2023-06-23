import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/login_controller.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/login_model.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/login_repository.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => LoginRepository(Get.find()));
    Get.lazyPut(() => LoginModel());
    Get.lazyPut(
      () => LoginController(
        Get.find<LoginRepository>(),
        Get.find<LoginModel>(),
      ),
    );
  }
}
