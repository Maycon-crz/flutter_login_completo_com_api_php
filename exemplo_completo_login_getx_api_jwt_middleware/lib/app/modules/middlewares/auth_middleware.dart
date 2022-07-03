import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  bool isAuthenticated = false;

  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    isAuthenticated =
        box.read('login') == "Usuario_logado-com_token*Válido" ? true : false;
    if (isAuthenticated == false) {
      return const RouteSettings(name: RouteName.login);
    }
    return null;
  }
}
