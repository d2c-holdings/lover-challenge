import 'package:flutter/material.dart';
import 'package:lover_challenge/assets/lover_colors.dart';
import 'package:lover_challenge/common/custom_icon.dart';
import 'package:lover_challenge/data/enums/custom_icons.dart';

class CustomIconButton extends StatefulWidget {
  final CustomIcons icon;
  final Color color;
  double opacity = 1.0;

  final Function onPressed;

  CustomIconButton({
    Key? key,
    required this.icon,
    this.color = LoverColors.black,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: ((details) => setState(
            () {
              widget.opacity = 0.9;
            },
          )),
      onTapUp: ((details) => setState(
            () {
              widget.opacity = 1.0;
            },
          )),
      onTap: () => widget.onPressed(),
      child: CustomIcon(
        widget.icon,
        color: widget.color.withOpacity(widget.opacity),
      ),
    );
  }
}
