import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';
import 'package:login_flutter/app/modules/views/components/image_capture_component.dart';
import 'package:login_flutter/app/modules/views/components/text_form_field_component.dart';

Card postRegistrationComponent(
  BuildContext context,
  PanelController controller,
) {
  return Card(
    elevation: 30,
    margin: const EdgeInsets.all(10),
    shadowColor: Colors.black,
    child: Obx(
      () => Form(
        key: controller.formKey,
        child: Column(
          children: [
            const Text(
              "Cadastrar postagem",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            textFormFieldComponent(
              controller: controller.titlePostRegistrationController.value,
              context: context,
              label: "Título",
              labelColor: Colors.black,
              fontColor: Colors.black,
            ),
            const SizedBox(height: 10),
            textFormFieldComponent(
              controller:
                  controller.descriptionPostRegistrationController.value,
              context: context,
              maxLines: 5,
              label: "Descrição",
              labelColor: Colors.black,
              fontColor: Colors.black,
            ),
            const SizedBox(height: 10),
            ImageCaptureComponent(
              onImageSelected: (FilePickerCross? image) {
                if (image != null) {
                  controller.imagePostRegistrationController = image;
                }
              },
            ),
            const SizedBox(height: 10),
            elevatedButtomComponent(
              title: !controller.isLoadingPostRegistration.value
                  ? "Cadastrar"
                  : "Carregando...",
              function: () {
                if (controller.formKey.currentState!.validate() &&
                    !controller.isLoadingPostRegistration.value) {
                  controller.postRegistration();
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
