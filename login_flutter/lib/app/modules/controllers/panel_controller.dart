import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class PanelController extends GetxController with StateMixin {
  TextEditingController titlePost = TextEditingController();
  TextEditingController descriptionPost = TextEditingController();
  FilePickerCross? imagePost;
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
