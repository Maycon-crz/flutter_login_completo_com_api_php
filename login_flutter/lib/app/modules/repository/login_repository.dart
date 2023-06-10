import 'package:get/get.dart';
import 'package:login_flutter/app/routes/api/api_path.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class LoginRepository extends GetConnect {
  final RestClient restClient;
  LoginRepository(this.restClient);
  loginRequest(String email, String password) async {
    String url = ApiPath.base;
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
