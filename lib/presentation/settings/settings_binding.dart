import 'package:get/get.dart';
import 'package:lover_challenge/presentation/settings/settings_controller.dart';

class SettingsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<SettingsController>(() => SettingsController());
  }
}