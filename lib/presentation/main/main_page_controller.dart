import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lover_challenge/data/model/analytics/events/tab_opened_event.dart';
import 'package:lover_challenge/data/service/analytics/analytics_service_contract.dart';
import 'package:lover_challenge/presentation/cats/cats_page.dart';
import 'package:lover_challenge/presentation/cats/cats_page_controller.dart';
import 'package:lover_challenge/presentation/home/home_page.dart';
import 'package:lover_challenge/presentation/main/widgets/main_bar_items.dart';
import 'package:lover_challenge/presentation/settings/settings_page.dart';
import 'package:tuple/tuple.dart';

class MainPageController extends GetxController {
  final AnalyticsServiceContract analyticsService = Get.find();

  var tabsInfo = [
    Tuple2(const HomePage(), MainNavigationBarItems.HOME_BAR_ITEM),
    Tuple2(const CatsPage(), MainNavigationBarItems.CATS_BAR_ITEM),
    Tuple2(const SettingsPage(), MainNavigationBarItems.SETTINGS_BAR_ITEM)
  ];

  List<Widget> get tabs => tabsInfo.map((e) => e.item1).toList();
  List<BottomNavigationBarItem> get navBarItems =>
      tabsInfo.map((e) => e.item2).toList();

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    switch (tabsInfo[index].item1.runtimeType) {
      case CatsPage:
        Get.find<CatsPageController>().fetchBreeds();
        break;
      default:
        break;
    }

    var event = TabOpenedEvent(tabName: tabsInfo[index].item2.itemLabel);
    analyticsService.trackEvent(event);
  }
}
