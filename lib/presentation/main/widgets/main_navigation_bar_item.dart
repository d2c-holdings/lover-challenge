import 'package:flutter/material.dart';

class MainNavigationBarItem extends BottomNavigationBarItem {
  final Widget iconWidget;
  final String itemLabel;

  MainNavigationBarItem({
    required this.iconWidget,
    required this.itemLabel,
  }) : super(
            icon: _IconWrapper(icon: iconWidget),
            label: itemLabel,
            backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0));
}

class _IconWrapper extends StatelessWidget {
  final Widget icon;

  const _IconWrapper({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(bottom: 7), child: icon);
  }
}
