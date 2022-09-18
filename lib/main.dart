import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lover_challenge/data/service/services.dart';

import 'app_modules.dart';

Future<void> main() async {
  await Services.initServices();
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
