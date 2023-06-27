import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/models/usersOptionsModel/post_model.dart';
import 'package:login_flutter/app/modules/repository/usersOptionsRepository/post_repository.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class PanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut(() => PostRepository(Get.find<RestClient>()));
    Get.lazyPut(() => PostModel(Get.find<PostRepository>()));
    Get.lazyPut(() => PanelController(Get.find<PostModel>()));
  }
}
