import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/user_registration_dto.dart';

class UserRegistrationController extends GetxController {
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> emailConfController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> passwordConfController =
      TextEditingController().obs;
  Rx<bool> termsController = false.obs;

  Future<void> register() async {
    UserRegistrationDTO data = UserRegistrationDTO(
      
    );
  }
}
