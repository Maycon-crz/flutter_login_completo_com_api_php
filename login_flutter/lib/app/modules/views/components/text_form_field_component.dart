import 'package:flutter/material.dart';
import 'package:login_flutter/app/modules/utils/default_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Widget textFormFieldComponent({
  required TextEditingController controller,
  required BuildContext context,
  Icon? icon,
  String? label,
  bool pass = false,
  String? type = "normal",
  Color borderColor = Colors.blue,
  Color labelColor = Colors.white,
  Color fontColor = Colors.white,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
  bool border = true,
  bool focusedBorder = true,
  Function? onFieldSubmittedFunction,
  Function? onChangedFunction,
  String? hintText,
  Color hintColor = Colors.white,
  bool optional = false,
  bool enabled = true,
}) {
  if (type == "phone") {
    var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return TextFormField(
      controller: controller,
      inputFormatters: [maskFormatter],
      obscureText: pass,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: (value) {
        onChangedFunction != null ? onChangedFunction(value) : null;
      },
      onFieldSubmitted: (String parameter) {
        onFieldSubmittedFunction != null ? onFieldSubmittedFunction() : null;
      },
      focusNode: FocusNode(),
      validator: (value) {
        return validator(type, value, label, optional);
      },
      style: TextStyle(color: fontColor),
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: DefaultColors.backgroundColor,
        hoverColor: DefaultColors.backgroundColor,
        prefixIcon: icon != null
            ? Icon(
                icon.icon,
                color: Colors.grey,
              )
            : null,
        border: border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
            : null,
        focusedBorder: focusedBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              )
            : null,
        fillColor: Colors.grey,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 16,
          fontFamily: "verdana_regular",
          fontWeight: FontWeight.w400,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: 16,
          fontFamily: "verdana_regular",
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: IconButton(
          onPressed: () => controller.clear(),
          icon: const Icon(Icons.close, size: 16),
        ),
      ),
      autofillHints: [((type == "email") ? AutofillHints.email : "")],
      enabled: enabled,
    );
  }

  return TextFormField(
    controller: controller,
    obscureText: pass,
    keyboardType: keyboardType,
    maxLines: maxLines,
    onChanged: (value) {
      onChangedFunction != null ? onChangedFunction(value) : null;
    },
    onFieldSubmitted: (String parameter) {
      onFieldSubmittedFunction != null ? onFieldSubmittedFunction() : null;
    },
    focusNode: FocusNode(),
    validator: (value) {
      return validator(type, value, label, optional);
    },
    style: TextStyle(color: fontColor),
    decoration: InputDecoration(
      hintText: hintText,
      focusColor: Colors.blueGrey,
      hoverColor: Colors.black,
      prefixIcon: icon != null
          ? Icon(
              icon.icon,
              color: Colors.grey,
            )
          : null,
      border: border
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          : null,
      focusedBorder: focusedBorder
          ? OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            )
          : null,
      fillColor: Colors.grey,
      hintStyle: TextStyle(
        color: hintColor,
        fontSize: 16,
        fontFamily: "verdana_regular",
        fontWeight: FontWeight.w400,
      ),
      labelText: label,
      labelStyle: TextStyle(
        color: labelColor,
        fontSize: 16,
        fontFamily: "verdana_regular",
        fontWeight: FontWeight.w400,
      ),
      suffixIcon: IconButton(
        onPressed: () => controller.clear(),
        icon: const Icon(Icons.close, size: 16),
      ),
    ),
    autofillHints: [((type == "email") ? AutofillHints.email : "")],
    enabled: enabled,
  );
}

String? validator(String? type, String? value, String? label, bool optional) {
  if (optional == false) {
    if (type == "email") {
      if (value!.isEmpty ||
          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
        return 'Digite um E-mail válido';
      }
      return null;
    } else {
      if (value!.isEmpty) {
        return "Informe: $label!";
      }
      return null;
    }
  }
  return null;
}



// import 'package:flutter/material.dart';

// Widget textFormField({
//   required TextEditingController controller,
//   String? label,
//   obscureText = false,
//   String? type = "normal",
// }) {
//   return TextFormField(
//     controller: controller,
//     validator: type == "email"
//         ? (value) {
//             if (value!.isEmpty ||
//                 !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                     .hasMatch(value)) {
//               return 'Digite um E-mail válido';
//             }
//             return null;
//           }
//         : (value) {
//             if (value!.isEmpty) {
//               return "Campo Vazio!";
//             }
//             return null;
//           },
//     decoration: InputDecoration(
//       label: Text(label ?? ""),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//     ),
//     obscureText: obscureText,
//   );
// }
