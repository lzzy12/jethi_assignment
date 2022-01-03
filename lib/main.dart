import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jethi_tech/app/data/user.dart';

import 'app/routes/app_pages.dart';

void main() {
  Hive.registerAdapter(UserAdapter());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
