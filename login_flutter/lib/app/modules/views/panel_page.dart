import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/views/components/app_bar_component.dart';
<<<<<<< HEAD
import 'package:login_flutter/app/modules/views/components/user_options_components/edition/post_edition_component.dart';
import 'package:login_flutter/app/modules/views/components/user_options_components/registration/post_registration_component.dart';
=======
<<<<<<< HEAD
import 'package:login_flutter/app/modules/views/components/user_options_components/edition/post_edition_component.dart';
import 'package:login_flutter/app/modules/views/components/user_options_components/registration/post_registration_component.dart';
=======
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';
import 'package:login_flutter/app/modules/views/components/text_form_field_component.dart';
>>>>>>> parent of f698b62 (Editar e deletar postagem)
>>>>>>> b2a0e45f8a9e63e77182a7aa07c5101e0f318d3e

class PanelPage extends GetView<PanelController> {
  const PanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> b2a0e45f8a9e63e77182a7aa07c5101e0f318d3e
      appBar: appBarComponent(
          title: "Painel",
          showLogout: true,
          logoutFunction: () {
            controller.logout();
          }),
      body: ListView(
<<<<<<< HEAD
=======
        children: [
          const SizedBox(height: 30),
          postRegistrationComponent(context, controller),
          postEditionComponent(controller, context),
          const SizedBox(height: 30),
=======
      appBar: appBarComponent(title: "Painel"),
      body: Column(
>>>>>>> b2a0e45f8a9e63e77182a7aa07c5101e0f318d3e
        children: [
          const SizedBox(height: 30),
          postRegistrationComponent(context, controller),
          postEditionComponent(controller, context),
          const SizedBox(height: 30),
<<<<<<< HEAD
=======
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
>>>>>>> parent of f698b62 (Editar e deletar postagem)
>>>>>>> b2a0e45f8a9e63e77182a7aa07c5101e0f318d3e
        ],
      ),
    );
  }
}
