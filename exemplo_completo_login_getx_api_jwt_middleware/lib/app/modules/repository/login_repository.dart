import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/api_path/api_path.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/shared/rest_client.dart';
import 'package:get/get.dart';

class LoginRepository extends GetConnect {
  final RestClient restClient;
  LoginRepository(this.restClient);
  loginRequest(String email, String password) async {
    String url = '${ApiPath.base}login';
    final form = FormData({
      'email': email,
      'password': password,
    });
    Response? response =
        await restClient.post(url, form, headers: {'Charset': 'utf-8'});
    if (response.isOk && response.statusCode == 200) {
      return response;
    }
    return null;
  }
}
