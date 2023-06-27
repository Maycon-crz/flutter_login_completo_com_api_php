import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class Auth extends GetConnect {
  static const String _appKey = "chave_externa_de_api";
  get getAppKey => _appKey;

  String get getToken {
    final box = GetStorage();
    final String token = box.read("token") ?? "";
    return token;
  }
}
