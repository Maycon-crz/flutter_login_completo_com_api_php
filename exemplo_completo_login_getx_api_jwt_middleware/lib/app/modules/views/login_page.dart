import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/controllers/login_controller.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/views/components/textFormField.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormField(
                controller: controller.emailController.value,
                label: "E-mail",
                type: "email"),
            const SizedBox(height: 10),
            textFormField(
              controller: controller.passwordController.value,
              label: "Senha",
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.login();
                }
              },
              child: const Text("Iniciar"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.home);
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
