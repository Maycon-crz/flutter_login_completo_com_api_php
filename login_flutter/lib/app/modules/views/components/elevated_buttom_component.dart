import 'package:flutter/material.dart';
import 'package:login_flutter/app/modules/utils/default_colors.dart';

Widget elevatedButtomComponent({
  required String title,
  required Function function,
  IconData? icon,
  Color? iconColor,
  Color? buttonColor,
  Color? textColor,
  double minimumSizeWidth = double.infinity,
  double minimumSizeHeight = 50,
  double maximumSizeWidth = 50,
  double maximumSizeHeight = 50,
}) {
  textColor ?? Colors.white;
  return icon != null
      ? ElevatedButton.icon(
          onPressed: () {
            function();
          },
          icon: Icon(icon, color: iconColor ?? DefaultColors.backgroundColor),
          label: Text(
            title,
            style: TextStyle(color: textColor),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(minimumSizeWidth, minimumSizeHeight),
            maximumSize: Size(maximumSizeWidth, maximumSizeHeight),
            backgroundColor: buttonColor ?? DefaultColors.appBarColor,
            side: BorderSide(width: 3, color: DefaultColors.appBarColor),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      : ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(minimumSizeWidth, minimumSizeHeight),
            backgroundColor: buttonColor ?? DefaultColors.appBarColor,
            side: BorderSide(width: 3, color: DefaultColors.appBarColor),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(color: textColor),
          ),
        );
}
