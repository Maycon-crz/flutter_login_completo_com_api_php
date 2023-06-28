import 'dart:convert';

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/modules/models/sharedDTO/generic_response_dto.dart';
import 'package:login_flutter/app/modules/models/usersOptionsModel/dataTransferObjects/post_dto.dart';
import 'package:login_flutter/app/modules/repository/authenticationRepository/auth.dart';
import 'package:login_flutter/app/routes/api/api_path.dart';
import 'package:login_flutter/app/shared/rest_client.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class PostRepository extends Auth {
  final RestClient _restClient;
  PostRepository(this._restClient);

  Future<GenericResponseDTO?> registrationPostsRepo({PostDTO? postDTO}) async {
    String url = '${ApiPath.base}api/post/post_registration';
    final form = http.MultipartRequest('POST', Uri.parse(url));
    final box = GetStorage();
    String email = "";
    email = (box.read('email') ?? "") as String;
    form.fields['front_end'] = 'external';
    form.fields['app_key'] = super.getAppKey;
    form.fields['title'] = postDTO!.titlePost!;
    form.fields['descriptions'] = postDTO.descriptionPost!;
    form.fields['email'] = email;
    if (postDTO.imagePost!.fileName != null) {
      String extension = path.extension(postDTO.imagePost!.path!);
      FilePickerCross? postRegistrationImage = postDTO.imagePost!;
      final fileBytes = postRegistrationImage.toUint8List();
      final multipartFile = http.MultipartFile.fromBytes(
        'image',
        fileBytes,
        filename: postRegistrationImage.fileName!,
        contentType: MediaType(
          'image',
          extension,
        ),
      );
      form.files.add(multipartFile);
    }

    form.headers['Charset'] = 'utf-8';
    form.headers['Authorization'] = super.getToken;

    final streamedResponse = await form.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return GenericResponseDTO(data: map["data"], status: map["status"]);
    } else {
      return null;
    }
  }

  Future<List<PostDTO>?> getPosts(String title) async {
    String url = '${ApiPath.base}api/post/get_posts';
    final form = FormData({
      "front_end": "external",
      "app_key": super.getAppKey,
      "page": "1",
      "title": title,
    });
    Response? response = await _restClient.post(url, form, headers: {
      "Charset": "utf-8",
      "Authorization": super.getToken,
    });
    if (response.isOk && response.statusCode == 200) {
      Map<String, dynamic> map = response.body;
      return map["data"]
          .map<PostDTO>((p) => PostDTO.fromMap(p))
          .toList()
          .cast<PostDTO>();
    } else {
      return null;
    }
  }

  Future<GenericResponseDTO?> editPostRepo(PostDTO postDTO) async {
    String url = '${ApiPath.base}api/post/post_edition';
    final form = http.MultipartRequest('POST', Uri.parse(url));
    final box = GetStorage();
    String email = "";
    email = (box.read('email') ?? "") as String;
    form.fields['front_end'] = 'external';
    form.fields['app_key'] = super.getAppKey;
    form.fields['email'] = email;
    form.fields['id'] = postDTO.id!.toString();
    form.fields['title'] = postDTO.titlePost!;
    form.fields['descriptions'] = postDTO.descriptionPost!;
    form.fields['image_name_db'] = postDTO.imageNamePost!;
    if (postDTO.imagePost != null) {
      String extension = path.extension(postDTO.imagePost!.path!);
      FilePickerCross? postRegistrationImage = postDTO.imagePost!;
      final fileBytes = postRegistrationImage.toUint8List();
      final multipartFile = http.MultipartFile.fromBytes(
        'image',
        fileBytes,
        filename: postRegistrationImage.fileName!,
        contentType: MediaType(
          'image',
          extension,
        ),
      );

      form.files.add(multipartFile);
    }

    form.headers['Charset'] = 'utf-8';
    form.headers['Authorization'] = super.getToken;
    final streamedResponse = await form.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return GenericResponseDTO(data: map["data"], status: map["status"]);
    } else {
      return null;
    }
  }

  Future<GenericResponseDTO?> deletePostRepo(PostDTO postDTO) async {
    String url = '${ApiPath.base}api/post/post_delete';
    final box = GetStorage();
    String email = "";
    email = (box.read('email') ?? "") as String;
    final form = FormData({
      'front_end': 'external',
      'app_key': super.getAppKey,
      'email': email,
      'id': postDTO.id,
      'image_name_db': postDTO.imageNamePost,
    });

    Response? response = await _restClient.post(url, form, headers: {
      'Charset': 'utf-8',
      'Authorization': super.getToken,
    });
    if (response.isOk && response.statusCode == 200) {
      Map<String, dynamic> map = response.body;
      return GenericResponseDTO(
        data: map["data"],
        status: map["status"],
      );
    } else {
      return null;
    }
  }
}
