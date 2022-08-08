import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lover_challenge/assets/lover_colors.dart';
import 'package:lover_challenge/presentation/settings/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: LoverColors.desire2,
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Settings Page"),
        ),
      ),
    );
  }
}
