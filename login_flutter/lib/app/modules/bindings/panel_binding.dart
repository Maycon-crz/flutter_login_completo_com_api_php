import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/repository/logado_repository.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class PanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => LogadoRepository(Get.find()));
    Get.lazyPut(() => PanelController());
  }
}
