import 'package:flutter/material.dart';
import 'package:lover_challenge/common/custom_icon.dart';
import 'package:lover_challenge/data/enums/custom_icons.dart';
import 'package:lover_challenge/presentation/main/widgets/main_navigation_bar_item.dart';

abstract class MainNavigationBarItems {
  static final CATS_BAR_ITEM = MainNavigationBarItem(
    iconWidget: const CustomIcon(
      CustomIcons.cat,
      size: 20.0,
    ),
    itemLabel: 'Cats',
  );

  static final HOME_BAR_ITEM = MainNavigationBarItem(
    iconWidget: const Icon(
      Icons.home,
      size: 20.0,
    ),
    itemLabel: 'Home',
  );

  static final SETTINGS_BAR_ITEM = MainNavigationBarItem(
    iconWidget: const Icon(
      Icons.settings,
      size: 20.0,
    ),
    itemLabel: 'Settings',
  );
}
