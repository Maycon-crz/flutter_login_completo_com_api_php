import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/user_registration_dto.dart';
import 'package:login_flutter/app/modules/models/sharedDTO/generic_response_dto.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/auth.dart';
import 'package:login_flutter/app/routes/api/api_path.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class UserRepository extends Auth {
  final RestClient restClient;
  UserRepository(this.restClient);
  Future<GenericResponseDTO?> registrationRequest({
    required UserRegistrationDTO userRegistrationDTO,
  }) async {
    String url = "${ApiPath.base}api/user_registration";
    final form = FormData({
      'full_name': userRegistrationDTO.fullName,
      'email': userRegistrationDTO.email,
      'email_conf': userRegistrationDTO.emailConf,
      'password': userRegistrationDTO.password,
      'password_conf': userRegistrationDTO.passwordConf,
      'terms': userRegistrationDTO.terms,
      'front_end': 'external',
      'app_key': super.getAppKey,
    });
    Response? response = await restClient.post(
      url,
      form,
      headers: {'Charset': 'utf-8'},
    );
    print(response);
    print(response.body);
    if (response.isOk && response.statusCode == 200) {
      Map<String, dynamic> map = response.body;
      if (map["data"].runtimeType == String) {
        return GenericResponseDTO(data: map["data"], status: map["status"]);
      } else {
        if (map["status"] == "success") {
          final box = GetStorage();
          box.write("token", "Bearer ${map["data"]["token"]}");
          box.write("login", "chave_de_login");
          box.write("email", userRegistrationDTO.email);
          return GenericResponseDTO(
            data: "Cadastrado com sucesso!",
            status: map["status"],
          );
        }
      }
    }
    return null;
  }
}
