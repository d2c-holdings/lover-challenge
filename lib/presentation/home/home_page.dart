import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lover_challenge/assets/lover_colors.dart';
import 'package:lover_challenge/presentation/home/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: LoverColors.desire2,
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Lover coding challenge"),
        ),
      ),
    );
  }
}
