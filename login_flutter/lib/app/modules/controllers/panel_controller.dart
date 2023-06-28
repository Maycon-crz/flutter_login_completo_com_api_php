import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/controllers/generic_controller.dart';
import 'package:login_flutter/app/modules/models/usersOptionsModel/dataTransferObjects/post_dto.dart';
import 'package:login_flutter/app/modules/models/usersOptionsModel/post_model.dart';

class PanelController extends GenericController {
  final PostModel _postModel;
  PanelController(this._postModel);
  /*------------------------------------*/
  /*--------Cadastrar Postagens---------*/
  final formKey = GlobalKey<FormState>();
  Rx<bool> isLoadingPostRegistration = false.obs;
  Rx<TextEditingController> titlePostRegistrationController =
      TextEditingController().obs;
  Rx<TextEditingController> descriptionPostRegistrationController =
      TextEditingController().obs;
  FilePickerCross? imagePostRegistrationController;
  /*-------------------------------------*/
  /*----------Editar Postagens-----------*/
  Rx<bool> isLoadingPostShowEdition = false.obs;
  Rx<bool> isLoadingPostRequestForEditionControl = false.obs;
  Rx<TextEditingController> postsEditionTitleController =
      TextEditingController().obs;
  final List<PostDTO> _dataPostEditionSearch = <PostDTO>[].obs;
  List<PostDTO> get getDataPostEditionSearch => _dataPostEditionSearch;

  Rx<TextEditingController> postsEditionDbTitleController =
      TextEditingController().obs;
  Rx<TextEditingController> postsEditionDbDescriptionsController =
      TextEditingController().obs;
  FilePickerCross? postsEditionImageController;
  /*------------------------------------*/
  /*--------Cadastrar Postagens---------*/
  Future<void> postRegistration() async {
    isLoadingPostRegistration.value = true;
    PostDTO postDTO = PostDTO(
      titlePost: titlePostRegistrationController.value.text,
      descriptionPost: descriptionPostRegistrationController.value.text,
      imagePost: imagePostRegistrationController,
    );
    await _postModel.postRegistrationValidation(postDTO: postDTO).then(
      (bool response) {
        if (response) {
          /*Limpando controllers*/
          titlePostRegistrationController.value.clear();
          descriptionPostRegistrationController.value.clear();
          FilePickerCross? resetPostsRegistrationImageController;
          imagePostRegistrationController =
              resetPostsRegistrationImageController;
        }
      },
    );
    isLoadingPostRegistration.value = false;
  }

  /*-------------------------------------*/
  /*----------Editar Postagens-----------*/
  Future<void> getPostsForEdition() async {
    isLoadingPostShowEdition.value = true;
    await _postModel
        .getPostsForEdition(
      postsEditionTitleController.value.text,
    )
        .then(
      (List<PostDTO>? response) {
        if (response != null) {
          _dataPostEditionSearch.clear();
          _dataPostEditionSearch.addAll(response);
        } else {
          _dataPostEditionSearch.clear();
        }
      },
    );
    isLoadingPostShowEdition.value = false;
  }

  Future<void> postEdition(PostDTO postDTO, BuildContext context) async {
    postDTO.titlePost = postsEditionDbTitleController.value.text;
    postDTO.descriptionPost = postsEditionDbDescriptionsController.value.text;
    postDTO.imagePost = postsEditionImageController;
    await _postModel.postEditionValidation(postDTO).then((bool response) {
      if (response) {
        Navigator.of(context).pop();
        getPostsForEdition();
      }
    });
  }

  Future<void> postDelete(PostDTO postDTO, BuildContext context) async {
    isLoadingPostShowEdition.value = true;
    await _postModel.deletePostValidation(postDTO, context);
    //     .then((bool response) {
    //   if (response) {
    //     Get.offAllNamed(RouteName.panel);
    //   }
    // });
    isLoadingPostShowEdition.value = false;
  }
}
