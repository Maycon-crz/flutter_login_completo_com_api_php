import 'dart:convert';

import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/models/login_dto.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/repository/login_repository.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/utils/token_verify.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with StateMixin {
  final LoginRepository _loginRepository;
  LoginController(this._loginRepository);
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  Future login() async {
    final box = GetStorage();    
    Response? response = await _loginRepository.loginRequest(
      emailController.value.text,
      passwordController.value.text,
    );
    if (response != null) {
      var res = await jsonDecode(jsonEncode(response.body));
      String? status = LoginDto.fromJson(res).status;
      String? data = LoginDto.fromJson(res).data;
      if (status == "success") {
        Map<String, dynamic> verificandoToken = parseJwt(data!);
        if (verificandoToken['email'] != null &&
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(verificandoToken['email'])) {
          box.write("token", "Bearer $data");
          box.write("login", "Usuario_logado-com_token*Válido");
          Get.offNamed(RouteName.logado);
        }
      } else {
        showSnackbarComponent("Erro de autenticação", data, 3);
      }
    } else {
      showSnackbarComponent("Erro", "Erro no servidor", 3);
    }
  }

  showSnackbarComponent(String? titulo, String? data, int duration) {
    Get.showSnackbar(
      GetSnackBar(
        title: titulo,
        message: data,
        backgroundColor: Colors.redAccent,
        duration: duration.seconds,
      ),
    );
  }
}
