import 'package:get/get.dart';
import 'package:lover_challenge/presentation/cats/cats_page_controller.dart';

class CatsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatsPageController>(() => CatsPageController());
  }
}
