import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/panel_controller.dart';
import 'package:login_flutter/app/modules/models/usersOptionsModel/dataTransferObjects/post_dto.dart';
import 'package:login_flutter/app/modules/views/components/animated_arrow.dart';
import 'package:login_flutter/app/modules/views/components/big_text.dart';
import 'package:login_flutter/app/modules/views/components/cached_image.dart';
import 'package:login_flutter/app/modules/views/components/elevated_buttom_component.dart';
import 'package:login_flutter/app/modules/views/components/image_capture_component.dart';
import 'package:login_flutter/app/modules/views/components/text_form_field_component.dart';
import 'package:login_flutter/app/routes/api/api_path.dart';

Widget postEditionComponent(PanelController controller, context) {
  final formPostEditionKey = GlobalKey<FormState>();
  Color standardColor = Colors.black;
  return Obx(
    () => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bigText(text: "Edição de Postagens"),
        const SizedBox(height: 13),
        textFormFieldComponent(
          controller: controller.postsEditionTitleController.value,
          context: context,
          label: "Título da postegem",
          labelColor: standardColor,
          fontColor: standardColor,
        ),
        const SizedBox(height: 13),
        elevatedButtomComponent(
          title: "Buscar",
          function: () {
            controller.getPostsForEdition();
          },
        ),
        Column(
          children: controller.isLoadingPostShowEdition.value
              ? [const CircularProgressIndicator()]
              : controller.getDataPostEditionSearch
                  .map(
                    (PostDTO dataSearchPostsModel) => Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              controller.postsEditionDbTitleController.value
                                  .text = dataSearchPostsModel.titlePost!;
                              controller
                                  .postsEditionDbDescriptionsController
                                  .value
                                  .text = dataSearchPostsModel.descriptionPost!;
                              controller.update();
                              showDialog(
                                context: context,
                                builder: (context) => postEditingWindow(
                                  context,
                                  formPostEditionKey,
                                  controller,
                                  standardColor,
                                  dataSearchPostsModel,
                                ),
                              );
                            },
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            icon: FontAwesomeIcons.pencil,
                            label: "Editar",
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              controller.postDelete(
                                  dataSearchPostsModel, context);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: FontAwesomeIcons.trash,
                            label: "Excluir",
                          ),
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 12,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    bigText(
                                      text: dataSearchPostsModel.titlePost!,
                                    ),
                                    const AnimatedArrow(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    ),
  );
}

Dialog postEditingWindow(
  BuildContext context,
  GlobalKey<FormState> formPostEditionKey,
  PanelController controller,
  Color standardColor,
  PostDTO dataSearchPostsModel,
) {
  return Dialog(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: formPostEditionKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: bigText(text: "Edição")),
            textFormFieldComponent(
              context: context,
              controller: controller.postsEditionDbTitleController.value,
              label: "Título:",
              labelColor: standardColor,
              fontColor: standardColor,
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width:
                    double.infinity * 0.4 < 500 ? double.infinity * 0.4 : 500,
                height: 230,
                child: cachedImage(
                  url:
                      "${ApiPath.basePostsImage}/${dataSearchPostsModel.imageNamePost}",
                  boxFit: false,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ImageCaptureComponent(
              onImageSelected: (FilePickerCross? image) {
                if (image != null) {
                  controller.postsEditionImageController = image;
                }
              },
            ),
            const SizedBox(height: 10),
            textFormFieldComponent(
              context: context,
              controller: controller.postsEditionDbDescriptionsController.value,
              label: "Descrição:",
              labelColor: standardColor,
              fontColor: standardColor,
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            bigText(
              text: "E-mail do autor do cadastro:",
            ),
            bigText(
              text: dataSearchPostsModel.author!,
            ),
            const SizedBox(height: 10),
            bigText(
              text: "Data do cadastro:",
            ),
            bigText(
              text: dataSearchPostsModel.registrationDate!,
            ),
            const SizedBox(height: 10),
            bigText(
              text:
                  "Aviso: A cada edição de postagem a data de cadastro é atualizada para o dia e hora da edição, o author do cadastro também é alterado para o E-mail de quem está editando!",
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            Obx(
              () => elevatedButtomComponent(
                title: !controller.isLoadingPostRequestForEditionControl.value
                    ? "Editar"
                    : "Carregando...",
                function: () {
                  if (formPostEditionKey.currentState!.validate() &&
                      !controller.isLoadingPostRequestForEditionControl.value) {
                    controller.postEdition(
                      dataSearchPostsModel,
                      context,
                    );
                  }
                },
                buttonColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
