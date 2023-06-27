import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarComponent {
  static showSnackbarComponent({
    String? title,
    String? data,
    int duration = 3,
    Color? cor,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: data,
        backgroundColor: cor ?? Colors.redAccent,
        duration: duration.seconds,
      ),
    );
  }
}
