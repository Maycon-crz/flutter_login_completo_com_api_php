import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter/app/modules/models/sharedDTO/generic_response_dto.dart';
import 'package:login_flutter/app/modules/models/usersOptionsModel/dataTransferObjects/post_dto.dart';
import 'package:login_flutter/app/modules/repository/usersOptionsRepository/post_repository.dart';
import 'package:login_flutter/app/modules/utils/default_colors.dart';
import 'package:login_flutter/app/modules/views/components/confirmation_window_component.dart';
import 'package:login_flutter/app/modules/views/components/show_snackbar_component.dart';
import 'package:login_flutter/app/routes/route_name.dart';

class PostModel {
  final PostRepository _postRepository;
  PostModel(this._postRepository);

  /*------------------------------------*/
  /*--------Cadastrar postagens---------*/
  Future<bool> postRegistrationValidation({PostDTO? postDTO}) async {
    if (postDTO!.imagePost != null) {
      return await _postRepository.registrationPostsRepo(postDTO: postDTO).then(
        (GenericResponseDTO? response) async {
          if (response != null) {
            SnackbarComponent.showSnackbarComponent(
              title: "Atenção!",
              data: response.data,
              duration: 3,
              cor: response.status == "error" ? Colors.redAccent : Colors.green,
            );
            if (response.status == "success") {
              return true;
            }
          } else {
            SnackbarComponent.showSnackbarComponent(
              title: "Atenção!",
              data: "Ocorreu um problema na função de cadastro de postagens!",
              duration: 3,
              cor: Colors.redAccent,
            );
          }
          return false;
        },
      );
    } else {
      SnackbarComponent.showSnackbarComponent(
        title: "Atenção!",
        data: "Selecione uma imagem",
        duration: 3,
        cor: Colors.redAccent,
      );
    }
    return false;
  }

  // /*------------------------------------*/
  // /*----------Editar Postagens----------*/
  Future<List<PostDTO>?> getPostsForEdition(String title) async {
    return await _postRepository.getPosts(title).then(
      (List<PostDTO>? response) {
        if (response != null) {
          return response;
        } else {
          SnackbarComponent.showSnackbarComponent(
            title: "Atenção!",
            data: "Nada encontrado!",
            duration: 3,
            cor: DefaultColors.appBarColor,
          );
        }
        return null;
      },
    );
  }

  Future<bool> postEditionValidation(PostDTO postDTO) async {
    // isLoadingPostRequestForEditionControl.value = true;
    return await _postRepository
        .editPostRepo(postDTO)
        .then((GenericResponseDTO? response) async {
      if (response != null) {
        SnackbarComponent.showSnackbarComponent(
          title: "Atenção!",
          data: response.data,
          duration: 3,
          cor: response.status == "error" ? Colors.redAccent : Colors.green,
        );
        if (response.status == "success") {
          return true;
        }
      } else {
        SnackbarComponent.showSnackbarComponent(
          title: "Atenção!",
          data: "Ocorreu um problema na função de edição de postagem!",
          duration: 3,
          cor: Colors.redAccent,
        );
      }
      return false;
    });
    // isLoadingPostRequestForEditionControl.value = false;
  }

  /*-------------------------------------*/
  /*---------Excluir postagens-----------*/
  Future<void> deletePostValidation(
    PostDTO postDTO,
    BuildContext context,
  ) async {
    ConfirmationWindowComponent.showConfirmationDialog(
      context: context,
      title: "Atenção!",
      content: const Text("Tem certeza que deseja excluir a postagem?"),
      function: (value) async {
        if (value) {
          await _postRepository
              .deletePostRepo(postDTO)
              .then((GenericResponseDTO? response) {
            if (response != null) {
              SnackbarComponent.showSnackbarComponent(
                title: "Atenção!",
                data: response.data,
                duration: 3,
                cor: response.status == "error"
                    ? Colors.redAccent
                    : Colors.green,
              );
              if (response.status == "success") {
                Get.offAllNamed(RouteName.panel);
              }
            } else {
              SnackbarComponent.showSnackbarComponent(
                title: "Atenção!",
                data: "Ocorreu um problema na função de exclusão!",
                duration: 3,
                cor: Colors.redAccent,
              );
            }
          });
        }
      },
    );
  }
}
