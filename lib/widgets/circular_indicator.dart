import 'package:fina/data/data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Circularindicator extends StatelessWidget {
  final String textInside;
  final Color progressColors;
  final Color backGroundColor;
  final bool isUsed;
  bool? isInCart;

  double? theGoal, theFood;

  Circularindicator(
      {super.key,
      required this.progressColors,
      required this.textInside,
      required this.backGroundColor,
      required this.isUsed,
      this.theFood,
      this.theGoal,
      this.isInCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularPercentIndicator(
        animation: true,
        animationDuration: 500,
        radius: 60,
        lineWidth: 10,
        percent: isInCart ?? false
            ? (theFood! > theGoal! ? 1 : theFood! / theGoal!)
            : isUsed
                ? 1
                : 0.00000001,
        progressColor: progressColors,
        backgroundColor: backGroundColor,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          textInside,
          textAlign: TextAlign.center,
          style: isInCart ?? false
              ? customTextStyle.labelSmall
              : customTextStyle.displaySmall,
        ),
      ),
    );
  }
}
