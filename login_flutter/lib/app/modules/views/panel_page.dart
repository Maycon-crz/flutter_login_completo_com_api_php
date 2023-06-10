import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/views/components/app_bar_component.dart';
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';

class PanelPage extends GetView<PanelController> {
  const PanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(title: "Painel"),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          elevatedButtomComponent(
            title: "Sair",
            function: () {
              controller.logout();
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
