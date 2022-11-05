import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Circularindicator extends StatelessWidget {
  final String textInside;
  final Color progressColors;
  final Color backGroundColor;
  final bool animationTrue;

  Circularindicator(
      {required this.progressColors,
      required this.textInside,
      required this.backGroundColor,
      required this.animationTrue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularPercentIndicator(
        animation: animationTrue,
        animationDuration: 500,
        radius: 70,
        lineWidth: 15,
        percent: .99,
        progressColor: progressColors,
        backgroundColor: backGroundColor,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(textInside),
      ),
    );
  }
}
