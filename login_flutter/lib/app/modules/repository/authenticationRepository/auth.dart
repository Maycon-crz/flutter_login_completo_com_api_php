import 'package:get/get.dart';

abstract class Auth extends GetConnect {
  static const String _appKey = "chave_externa_de_api";
  get getAppKey => _appKey;
}
