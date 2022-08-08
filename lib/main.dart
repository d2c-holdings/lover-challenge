import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_modules.dart';

void main() {
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: MainModule.routes,
      initialRoute: "/main",
    );
  }
}