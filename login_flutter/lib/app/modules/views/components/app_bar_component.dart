import 'package:flutter/material.dart';
import 'package:login_flutter/app/modules/utils/default_colors.dart';

AppBar appBarComponent({
  String? title,
}) {
  return AppBar(
    title: Text(title ?? ""),
    centerTitle: true,
    backgroundColor: DefaultColors.appBarColor,
  );
}
