import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/login_controller.dart';
import 'package:login_flutter/app/modules/utils/default_colors.dart';
import 'package:login_flutter/app/modules/views/components/app_bar_component.dart';
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';
import 'package:login_flutter/app/modules/views/components/text_form_field_component.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: appBarComponent(title: "Iniciar sessão"),
      backgroundColor: DefaultColors.backgroundColor,
      body: Card(
        margin: const EdgeInsets.all(30),
        shadowColor: DefaultColors.appBarColor,
        color: DefaultColors.backgroundColor,
        elevation: 130,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle, size: 230),
                const SizedBox(height: 30),
                textFormFieldComponent(
                  context: context,
                  controller: controller.emailController.value,
                  label: "E-mail",
                  type: "email",
                ),
                const SizedBox(height: 10),
                textFormFieldComponent(
                  context: context,
                  controller: controller.passwordController.value,
                  label: "Senha",
                  pass: true,
                ),
                const SizedBox(height: 30),
                elevatedButtomComponent(
                  title: !controller.isLoadingLogin.value
                      ? "Entrar"
                      : "Carregando...",
                  function: () {
                    if (formKey.currentState!.validate() &&
                        !controller.isLoadingLogin.value) {
                      controller.login();
                    }
                  },
                ),
                const SizedBox(height: 10),
                elevatedButtomComponent(
                  title: "Cadastre-se",
                  function: () {
                    Get.toNamed(RouteName.userRegistration);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
