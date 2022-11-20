import 'package:fina/data/data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Circularindicator extends StatelessWidget {
  final Color progressColors;
  final Color backGroundColor;
  final bool isUsed;

  double? theGoal, theFood;

  Circularindicator({
    super.key,
    required this.progressColors,
    required this.backGroundColor,
    required this.isUsed,
    this.theFood,
    this.theGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularPercentIndicator(
          animation: true,
          animationDuration: 500,
          radius: 60,
          lineWidth: 10,
          percent: (theFood! > theGoal! ? 1 : theFood! / theGoal!),
          progressColor: progressColors,
          backgroundColor: backGroundColor,
          circularStrokeCap: CircularStrokeCap.round,
          center: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: theGoal! > theFood!
                  ? (theGoal! - theFood!).toStringAsFixed(0)
                  : (theFood! - theGoal!).toStringAsFixed(0),
              style: TextStyle(
                color: theFood! > theGoal! ? customRed : Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: " cal",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.8)),
                ),
                TextSpan(
                  text: (theGoal! > theFood!) ? "\nRemaing" : "\nOver",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            ),
          )),
    );
  }
}
