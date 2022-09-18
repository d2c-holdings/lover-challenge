import 'package:get/get.dart';

class HomePageController extends GetxController {
  HomePageController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
