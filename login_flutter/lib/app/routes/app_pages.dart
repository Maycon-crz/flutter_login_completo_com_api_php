import 'package:get/get.dart';
import 'package:login_flutter/app/modules/bindings/panel_binding.dart';
import 'package:login_flutter/app/modules/bindings/login_binding.dart';
import 'package:login_flutter/app/modules/bindings/user_registration_binding.dart';
import 'package:login_flutter/app/modules/middlewares/auth_middleware.dart';
import 'package:login_flutter/app/modules/middlewares/logged_redirect.dart';
import 'package:login_flutter/app/modules/views/login_page.dart';
import 'package:login_flutter/app/modules/views/panel_page.dart';
import 'package:login_flutter/app/modules/views/user_registration_page.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.login,
      middlewares: [LoggedRedirect()],
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteName.panel,
      middlewares: [AuthMiddleware()],
      binding: PanelBinding(),
      page: () => const PanelPage(),
    ),
    GetPage(
      name: RouteName.userRegistration,
      binding: UserRegistrationBinding(),
      page: () => const UserRegistrationPage(),
    ),
  ];
}
