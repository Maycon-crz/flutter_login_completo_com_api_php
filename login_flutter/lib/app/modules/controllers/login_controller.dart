import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/modules/models/login_dto.dart';
import 'package:login_flutter/app/modules/repository/login_repository.dart';
import 'package:login_flutter/app/modules/utils/token_verify.dart';
import 'package:login_flutter/app/routes/route_name.dart';

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
      String? status = LoginDTO.fromJson(res).status;
      String? data = LoginDTO.fromJson(res).data;
      if (status == "success") {
        Map<String, dynamic> verificandoToken = parseJwt(data!);
        if (verificandoToken['email'] != null &&
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(verificandoToken['email'])) {
          box.write("token", "Bearer $data");
          box.write("login", "chave_de_login");
          Get.offNamed(RouteName.panel);
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
