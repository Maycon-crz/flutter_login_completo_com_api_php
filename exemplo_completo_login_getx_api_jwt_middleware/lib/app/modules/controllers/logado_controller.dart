import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/repository/logado_repository.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogadoController extends GetxController with StateMixin {
  final LogadoRepository _homeRepository;
  LogadoController(this._homeRepository);
  
  getAllUsers() async {
    final box = GetStorage();    
    String? token = box.read("token");
    if (token != null) {
      Response? response = await _homeRepository.getAllUsers(token);
      if (response != null) {
        print(response.body);
      }
    }
  }

  logout() {
    final box = GetStorage();
    box.erase();
    Get.offNamed(RouteName.home);
  }
}
