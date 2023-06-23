import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/views/components/app_bar_component.dart';
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';
import 'package:login_flutter/app/modules/views/components/text_form_field_component.dart';

class PanelPage extends GetView<PanelController> {
  const PanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(title: "Painel"),
      body: Column(
        children: [
          const SizedBox(height: 30),
          elevatedButtomComponent(
            title: "Sair",
            function: () {
              controller.logout();
            },
          ),
          const SizedBox(height: 30),
          Card(
            elevation: 30,
            margin: const EdgeInsets.all(10),
            shadowColor: Colors.black,
            child: Form(
              child: Column(
                children: [
                  const Text(
                    "Cadastrar postagem",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  textFormFieldComponent(
                    controller: controller.titlePost,
                    context: context,
                    label: "Título",
                    labelColor: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  textFormFieldComponent(
                    controller: controller.descriptionPost,
                    context: context,
                    maxLines: 5,
                    label: "Descrição",
                    labelColor: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  elevatedButtomComponent(title: "Cadastrar", function: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
