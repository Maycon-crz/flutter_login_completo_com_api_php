import 'package:flutter/material.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/user_registration_dto.dart';
import 'package:login_flutter/app/modules/models/sharedDTO/generic_response_dto.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/user_repository.dart';
import 'package:login_flutter/app/modules/views/components/show_snackbar_component.dart';

class UserModel {
  final UserRepository _userRepository;
  UserModel(this._userRepository);
  Future<bool> userRegistrationValidation(
    UserRegistrationDTO userRegistrationDTO,
  ) async {
    if (userRegistrationDTO.email == userRegistrationDTO.emailConf) {
      if (userRegistrationDTO.password == userRegistrationDTO.passwordConf) {
        if (userRegistrationDTO.terms == true) {
          return await _userRepository
              .registrationRequest(
            userRegistrationDTO: userRegistrationDTO,
          )
              .then((GenericResponseDTO? response) async {
            if (response != null) {
              SnackbarComponent.showSnackbarComponent(
                title: "Atenção!",
                data: response.data,
                duration: 3,
                cor: response.status == "error"
                    ? Colors.redAccent
                    : Colors.green,
              );
              if (response.status == "success") {
                return true;
              }
            } else {
              SnackbarComponent.showSnackbarComponent(
                title: "Atenção!",
                data: "Ocorreu um problema na função de cadastro de usuários!",
                duration: 3,
                cor: Colors.redAccent,
              );
            }
            return false;
          });
        } else {
          SnackbarComponent.showSnackbarComponent(
            title: "Atenção!",
            data:
                "É necessário aceitar os termos de uso e política de privacidade!",
            duration: 3,
            cor: Colors.redAccent,
          );
        }
      } else {
        SnackbarComponent.showSnackbarComponent(
          title: "Atenção!",
          data: "As senhas não estão iguais!",
          duration: 3,
          cor: Colors.redAccent,
        );
      }
    } else {
      SnackbarComponent.showSnackbarComponent(
        title: "Atenção!",
        data: "Os E-mails não estão iguais!",
        duration: 3,
        cor: Colors.redAccent,
      );
    }
    return false;
  }
}
