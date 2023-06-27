import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/user_registration_controller.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/user_model.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/user_repository.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class UserRegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => UserRepository(Get.find<RestClient>()));
    Get.lazyPut(() => UserModel(Get.find<UserRepository>()));
    Get.lazyPut(
      () => UserRegistrationController(
        Get.find<UserModel>(),
      ),
    );
  }
}
