import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/user_registration_dto.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/user_model.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class UserRegistrationController extends GetxController {
  final UserModel _userModel;
  UserRegistrationController(this._userModel);
  Rx<bool> isLoadingRegisterUser = false.obs;
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> emailConfController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> passwordConfController =
      TextEditingController().obs;
  Rx<bool> termsController = false.obs;

  Future<void> userRegistration() async {
    isLoadingRegisterUser.value = true;
    UserRegistrationDTO userRegistrationDTO = UserRegistrationDTO(
      fullName: fullNameController.value.text,
      email: emailConfController.value.text,
      emailConf: emailConfController.value.text,
      password: passwordController.value.text,
      passwordConf: passwordConfController.value.text,
      terms: termsController.value,
    );
    await _userModel.userRegistrationValidation(userRegistrationDTO).then(
      (bool response) {
        if (response) {
          Get.offAllNamed(RouteName.panel);
        }
      },
    );
    isLoadingRegisterUser.value = false;
  }
}
