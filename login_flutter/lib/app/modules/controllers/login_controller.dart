import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/login_dto.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/login_model.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/login_repository.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class LoginController extends GetxController with StateMixin {
  Rx<bool> isLoadingLogin = false.obs;
  final LoginRepository _loginRepository;
  final LoginModel _loginModel;
  LoginDTO dataLogin = LoginDTO();
  LoginController(this._loginRepository, this._loginModel);
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  Future<void> login() async {
    isLoadingLogin.value = true;
    dataLogin = LoginDTO(
      email: emailController.value.text,
      pass: passwordController.value.text,
    );
    await _loginModel
        .loginValidation(
      loginRepository: _loginRepository,
      dataLogin: dataLogin,
    )
        .then((bool response) {
      if (response) {
        Get.offNamed(RouteName.panel);
      }
    });
    isLoadingLogin.value = false;
  }
}
