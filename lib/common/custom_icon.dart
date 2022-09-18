import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lover_challenge/data/enums/custom_icons.dart';

class CustomIcon extends StatelessWidget {
  final double? size;
  final Color? color;
  final String? semanticLabel;

  final CustomIcons icon;

  const CustomIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      Svg(icon.value),
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );

    // return SvgPicture.asset(
    //   icon.value,
    //   width: size,
    //   height: size,
    //   color: color,
    //   semanticsLabel: semanticLabel,
    // );
  }
}
