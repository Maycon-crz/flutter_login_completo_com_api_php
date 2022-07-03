import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/controllers/login_controller.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/repository/login_repository.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/shared/rest_client.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => LoginRepository(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}
