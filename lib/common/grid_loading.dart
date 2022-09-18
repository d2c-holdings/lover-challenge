import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lover_challenge/assets/lover_colors.dart';

class GridLoading extends StatelessWidget {
  const GridLoading({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballGridPulse,
          colors: [
            LoverColors.pleasureMain,
            LoverColors.desire1,
            LoverColors.arousalMain,
            LoverColors.goalLover,
          ],

          /// Optional, The color collections
          strokeWidth: 2,
        ),
      ),
    );
  }
}
