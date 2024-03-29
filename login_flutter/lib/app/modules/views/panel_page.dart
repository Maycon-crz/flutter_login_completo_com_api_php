import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/views/components/app_bar_component.dart';
import 'package:login_flutter/app/modules/views/components/user_options_components/edition/post_edition_component.dart';
import 'package:login_flutter/app/modules/views/components/user_options_components/registration/post_registration_component.dart';

class PanelPage extends GetView<PanelController> {
  const PanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(
          title: "Painel",
          showLogout: true,
          logoutFunction: () {
            controller.logout();
          }),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          postRegistrationComponent(context, controller),
          postEditionComponent(controller, context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
