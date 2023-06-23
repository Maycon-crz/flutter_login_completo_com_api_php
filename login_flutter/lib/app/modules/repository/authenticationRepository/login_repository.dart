import 'package:get/get.dart';
import 'package:login_flutter/app/modules/models/authenticationModel/dataTransferObjects/login_dto.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/auth.dart';
import 'package:login_flutter/app/routes/api/api_path.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class LoginRepository extends Auth {
  final RestClient restClient;
  LoginRepository(this.restClient);
  LoginDTO loginResponseDTO = LoginDTO();
  Future<LoginDTO?> loginRequest(LoginDTO data) async {
    String url = "${ApiPath.base}api/login";
    final form = FormData({
      'email': data.email,
      'password': data.pass,
      'front_end': 'external',
      'app_key': super.getAppKey,
    });
    Response? response = await restClient.post(
      url,
      form,
      headers: {'Charset': 'utf-8'},
    );
    if (response.isOk && response.statusCode == 200) {
      Map<String, dynamic> map = response.body;
      if (map["data"].runtimeType != String) {
        Map<String, dynamic> data = map["data"];
        loginResponseDTO = LoginDTO.fromMap(data);
        loginResponseDTO.status = map["status"];
      } else {
        loginResponseDTO.status = map["status"];
        loginResponseDTO.msg = map["data"];
      }
      return loginResponseDTO;
    }
    return null;
  }
}
