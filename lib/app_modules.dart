import 'package:get/get.dart';
import 'package:lover_challenge/presentation/main/main_page.dart';
import 'package:lover_challenge/presentation/main/main_page_binding.dart';

abstract class MainModule {
  static List<GetPage> routes = [
    GetPage(
      name: '/main',
      page: () => MainPage(),
      binding: MainPageBinding()
    ),
  ];
}