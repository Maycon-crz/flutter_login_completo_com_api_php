import 'package:flutter/material.dart';

Widget textFormField({
  required TextEditingController controller,
  String? label,
  obscureText = false,
  String? type = "normal",
}) {
  return TextFormField(
    controller: controller,
    validator: type == "email"
        ? (value) {
            if (value!.isEmpty ||
                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
              return 'Digite um E-mail válido';
            }
            return null;
          }
        : (value) {
            if (value!.isEmpty) {
              return "Campo Vazio!";
            }
            return null;
          },
    decoration: InputDecoration(
      label: Text(label ?? ""),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    obscureText: obscureText,
  );
}
