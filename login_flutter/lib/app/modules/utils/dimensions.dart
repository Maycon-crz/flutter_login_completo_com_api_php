import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //font size
  static double font20 = screenHeight / 39.0;

  //radius
  static double radius20 = screenHeight / 42.2;

  //Standard margin
  static double margin = screenWidth > 390 ? 30 : 0;
}
