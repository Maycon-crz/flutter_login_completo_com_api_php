import 'package:flutter/material.dart';

class ConfirmationWindowComponent {
  static void showConfirmationDialog({
    BuildContext? context,
    String? title,
    Widget? content,
    Function(bool value)? function,
    int maxLines = 5,
  }) {
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: content,
          actions: <Widget>[
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                function!(true);
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
