import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_flutter/app/routes/app_pages.dart';
import 'package:login_flutter/app/routes/route_name.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.login,
      getPages: AppPages.pages,
    ),
  );
}
