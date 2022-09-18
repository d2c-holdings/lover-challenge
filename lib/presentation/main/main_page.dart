import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lover_challenge/assets/lover_colors.dart';
import 'package:lover_challenge/common/custom_icon.dart';
import 'package:lover_challenge/data/enums/custom_icons.dart';
import 'package:lover_challenge/presentation/cats/cats_page.dart';
import 'package:lover_challenge/presentation/home/home_page.dart';
import 'package:lover_challenge/presentation/main/main_page_controller.dart';
import 'package:lover_challenge/presentation/main/widgets/main_bar_items.dart';
import 'package:lover_challenge/presentation/settings/settings_page.dart';

class MainPage extends GetView<MainPageController> {
  MainPage({Key? key}) : super(key: key);

  final TextStyle unselectedLabelStyle = TextStyle(
      color: LoverColors.offWhite.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: LoverColors.offWhite, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            backgroundColor: LoverColors.desire2,
            unselectedItemColor: LoverColors.offWhite.withOpacity(0.5),
            selectedItemColor: LoverColors.offWhite,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: controller.navBarItems,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context),
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: controller.tabs,
          )),
    ));
  }
}
