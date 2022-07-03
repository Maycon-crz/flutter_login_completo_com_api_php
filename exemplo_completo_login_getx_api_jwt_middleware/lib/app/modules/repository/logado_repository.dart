
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/api_path/api_path.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/shared/rest_client.dart';
import 'package:get/get.dart';

class LogadoRepository extends GetConnect{
    final RestClient restClient;
    LogadoRepository(this.restClient);
    getAllUsers(String token) async {
    String url = '${ApiPath.base}user';
    final form = FormData({});
    Response? response =
        await restClient.post(url, form, headers: {'Authorization': token});
    if (response.isOk && response.statusCode == 200) {
      return response;
    }
    return null;
  }
}