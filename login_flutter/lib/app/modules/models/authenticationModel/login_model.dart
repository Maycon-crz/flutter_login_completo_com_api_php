import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/login_dto.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/login_repository.dart';
import 'package:login_flutter/app/modules/utils/email_verify.dart';

class LoginModel {
  Future<bool> loginValidation({
    required LoginRepository loginRepository,
    required LoginDTO dataLogin,
  }) async {
    final box = GetStorage();
    return await loginRepository
        .loginRequest(dataLogin)
        .then((LoginDTO? response) {
      if (response != null) {
        if (response.status == "success") {
          if (EmailVerify.verification(response.email)) {
            box.write("token", "Bearer ${response.token}");
            box.write("login", "chave_de_login");
            return true;
          } else {
            showSnackbarComponent(
              "Erro de autenticação",
              "Erro no E-mail de autenticação",
              3,
            );
            return false;
          }
        } else {
          showSnackbarComponent("Erro de autenticação", response.msg, 3);
          return false;
        }
      } else {
        showSnackbarComponent("Erro", "Erro no servidor", 3);
        return false;
      }
    });
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
