import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/bindings/logado_binding.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/bindings/login_binding.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/middlewares/auth_middleware.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/views/home_page.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/views/logado_page.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/modules/views/login_page.dart';
import 'package:exemplo_completo_login_getx_api_jwt_middleware/app/routes/route_name.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      middlewares: [AuthMiddleware()],
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteName.login,      
      //middlewares: [AuthMiddleware()],
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteName.logado,
      middlewares: [AuthMiddleware()],
      binding: LogadoBinding(),
      page: () => const LogadoPage(),
    ),
  ];
}
