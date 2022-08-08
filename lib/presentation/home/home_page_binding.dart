import 'package:get/get.dart';
import 'package:lover_challenge/presentation/home/home_page_controller.dart';

class HomePageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomePageController>(() => HomePageController());
  }
}