import 'package:flutter/material.dart';
import 'package:login_flutter/app/modules/utils/dimensions.dart';

Widget bigText({
  Color color = const Color(0xFF332d2b),
  required String text,
  double size = 0,
  TextOverflow overflow = TextOverflow.ellipsis,
  int maxLines = 1,
}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: overflow,
    style: TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: size == 0 ? Dimensions.font20 : size,
      fontWeight: FontWeight.w400,
    ),
  );
}
