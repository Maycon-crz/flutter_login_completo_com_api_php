import 'dart:convert';

import 'package:file_picker_cross/file_picker_cross.dart';

class PostDTO {
  String? id;
  String? author;
  String? titlePost;
  String? descriptionPost;
  FilePickerCross? imagePost;
  String? imageNamePost;
  String? registrationDate;
  String? error;
  PostDTO({
    this.id,
    this.author,
    this.titlePost,
    this.descriptionPost,
    this.imagePost,
    this.imageNamePost,
    this.registrationDate,
    this.error,
  });

  factory PostDTO.fromMap(Map<String, dynamic> map) {
    return PostDTO(
      id: map['id'].toString(),
      author: map['author'],
      titlePost: map['title'],
      descriptionPost: map['descriptions'],
      imagePost: map['image'].runtimeType == String ? null : map['image'],
      imageNamePost: map['image'].runtimeType == String ? map['image'] : "",
      registrationDate: map['registration_date'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostDTO.fromJson(String source) =>
      PostDTO.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': titlePost,
      'descriptions': descriptionPost,
      'image': imagePost,
      'registration_date': registrationDate,
      'error': error,
    };
  }
}
