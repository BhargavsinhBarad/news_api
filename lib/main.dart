import 'package:api/modules/views/detail/views/detail.dart';
import 'package:api/modules/views/home/views/home%20page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
        name: '/',
        page: () => home(),
      ),
      GetPage(
        name: "/detail",
        page: () => detail(),
      ),
    ],
  ));
}
