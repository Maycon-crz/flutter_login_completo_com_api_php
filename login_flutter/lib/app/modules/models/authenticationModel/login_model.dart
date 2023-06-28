import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/login_dto.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/login_repository.dart';
import 'package:login_flutter/app/modules/utils/email_verify.dart';
import 'package:login_flutter/app/modules/views/components/show_snackbar_component.dart';

class LoginModel {
  Future<bool> loginValidation({
    required LoginRepository loginRepository,
    required LoginDTO dataLogin,
  }) async {
    final box = GetStorage();
    return await loginRepository.loginRequest(dataLogin).then(
      (LoginDTO? response) {
        if (response != null) {
          if (response.status == "success") {
            if (EmailVerify.verification(response.email)) {
              box.write("token", "Bearer ${response.token}");
              box.write("login", "chave_de_login");
              box.write("email", response.email);
              return true;
            } else {
              SnackbarComponent.showSnackbarComponent(
                title: "Erro de autenticação",
                data: "Erro no E-mail de autenticação",
                duration: 3,
              );
              return false;
            }
          } else {
            SnackbarComponent.showSnackbarComponent(
                title: "Erro de autenticação", data: response.msg, duration: 3);
            return false;
          }
        } else {
          SnackbarComponent.showSnackbarComponent(
              title: "Erro", data: "Erro no servidor", duration: 3);
          return false;
        }
      },
    );
  }
}
