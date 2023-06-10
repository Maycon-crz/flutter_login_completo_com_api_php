import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class LoggedRedirect extends GetMiddleware {
  @override
  int? get priority => 2;

  bool isAuthenticated = false;

  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    isAuthenticated = box.read('login') == "chave_de_login" ? true : false;
    if (isAuthenticated == true) {
      return const RouteSettings(name: RouteName.panel);
    }

    return null;
  }
}
