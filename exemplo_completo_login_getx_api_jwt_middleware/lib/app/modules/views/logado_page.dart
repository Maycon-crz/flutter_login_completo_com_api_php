import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/controllers/logado_controller.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogadoPage extends GetView<LogadoController> {
  const LogadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogadoPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.getAllUsers();
            },
            child: const Text("GetAllUsers"),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.offNamed(RouteName.home);
            },
            child: const Text("Home"),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              controller.logout();
            },
            child: const Text("Sair"),
          ),
        ],
      ),
    );
  }
}
