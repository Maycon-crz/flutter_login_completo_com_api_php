import 'package:flutter/material.dart';
import 'package:login_flutter/app/modules/utils/default_colors.dart';

AppBar appBarComponent({
  String? title,
  bool showLogout = false,
  Function? logoutFunction,
}) {
  return AppBar(
    title: Text(title ?? ""),
    centerTitle: true,
    backgroundColor: DefaultColors.appBarColor,
    actions: [
      showLogout ? btnLogout(logoutFunction) : const SizedBox(),
    ],
  );
}

ElevatedButton btnLogout(logout) {
  return ElevatedButton.icon(
    onPressed: () {
      if (logout != null) {
        logout();
      }
    },
    icon: const Icon(Icons.exit_to_app, color: Colors.red),
    label: const Text(""),
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 11, 1, 58),
    ),
  );
}
