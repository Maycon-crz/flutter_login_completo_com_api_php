import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/controllers/logado_controller.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/repository/logado_repository.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/shared/rest_client.dart';
import 'package:get/get.dart';

class LogadoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => LogadoRepository(Get.find()));
    Get.lazyPut(() => LogadoController(Get.find()));
  }
}
