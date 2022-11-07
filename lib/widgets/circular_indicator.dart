import 'package:fina/data/data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Circularindicator extends StatelessWidget {
  final String textInside;
  final Color progressColors;
  final Color backGroundColor;
  final bool isUsed;

  Circularindicator(
      {required this.progressColors,
      required this.textInside,
      required this.backGroundColor,
      required this.isUsed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularPercentIndicator(
        animation: true,
        animationDuration: 500,
        radius: 60,
        lineWidth: 10,
        percent: isUsed ? 1 : 1 / 2,
        progressColor: progressColors,
        backgroundColor: backGroundColor,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          textInside,
          style: customTextStyle.displaySmall,
        ),
      ),
    );
  }
}
