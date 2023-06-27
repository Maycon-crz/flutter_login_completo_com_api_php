import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/user_registration_controller.dart';
import 'package:login_flutter/app/modules/utils/default_colors.dart';
import 'package:login_flutter/app/modules/views/components/app_bar_component.dart';
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';
import 'package:login_flutter/app/modules/views/components/text_form_field_component.dart';

class UserRegistrationPage extends GetView<UserRegistrationController> {
  const UserRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: appBarComponent(title: "Cadastre-se"),
      backgroundColor: DefaultColors.backgroundColor,
      body: Card(
        margin: const EdgeInsets.all(30),
        shadowColor: DefaultColors.appBarColor,
        color: DefaultColors.backgroundColor,
        elevation: 130,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 100),
                  const SizedBox(height: 30),
                  textFormFieldComponent(
                    controller: controller.fullNameController.value,
                    context: context,
                    label: "Nome Completo:",
                    labelColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  textFormFieldComponent(
                    controller: controller.emailController.value,
                    context: context,
                    label: "E-mail:",
                    labelColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  textFormFieldComponent(
                    controller: controller.emailConfController.value,
                    context: context,
                    label: "Confirmar E-mail:",
                    labelColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  textFormFieldComponent(
                    controller: controller.passwordController.value,
                    context: context,
                    label: "Senha:",
                    labelColor: Colors.white,
                    pass: true,
                  ),
                  const SizedBox(height: 10),
                  textFormFieldComponent(
                    controller: controller.passwordConfController.value,
                    context: context,
                    label: "Confirmar Senha:",
                    labelColor: Colors.white,
                    pass: true,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.termsController.value,
                          onChanged: (value) {
                            controller.termsController.value = value!;
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120,
                        child: const Text(
                          "Aceito os Termos de uso e Política de Privacidade",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  elevatedButtomComponent(
                    title: "Cadastrar",
                    function: () {
                      if (formKey.currentState!.validate() &&
                          !controller.isLoadingRegisterUser.value) {
                        controller.userRegistration();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
