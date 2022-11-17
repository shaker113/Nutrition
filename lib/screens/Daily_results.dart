import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../data/data.dart';

class DailyResults extends StatelessWidget {
  double proteinCalcul, calUsingRadio, carbCalcul, fat;

  DailyResults({
    super.key,
    required this.proteinCalcul,
    required this.calUsingRadio,
    required this.carbCalcul,
    required this.fat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeigth,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.bottomLeft,
            radius: 2.5,
            colors: [backgrounColor, backgrounColor2],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVerticalSpace(screenHeigth! * 0.03),
              Text(
                "Daily Need Results",
                style: customTextStyle.headlineLarge,
              ),
              addVerticalSpace(screenHeigth! * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth! / 2 - 20,
                    height: screenWidth! / 2 - 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: const Offset(-5, -5),
                            blurRadius: 12),
                        BoxShadow(
                            color: Colors.grey.shade700,
                            offset: const Offset(5, 5),
                            blurRadius: 12)
                      ],
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: infoRanges(
                        calUsingRadio, Colors.orangeAccent, "Calories"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth! / 2 - 20,
                    height: screenWidth! / 2 - 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: const Offset(-5, -5),
                            blurRadius: 12),
                        BoxShadow(
                            color: Colors.grey.shade700,
                            offset: const Offset(5, 5),
                            blurRadius: 12)
                      ],
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: infoRanges(fat, backgrounColor, "Fat"),
                  ),
                ],
              ),
              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: screenWidth! / 2 - 20,
                    width: screenWidth! / 2 - 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: const Offset(-5, -5),
                            blurRadius: 12),
                        BoxShadow(
                            color: Colors.grey.shade700,
                            offset: const Offset(5, 5),
                            blurRadius: 12)
                      ],
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: infoRanges(carbCalcul, Colors.blueGrey, "Carbs"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth! / 2 - 20,
                    height: screenWidth! / 2 - 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: const Offset(-5, -5),
                            blurRadius: 12),
                        BoxShadow(
                            color: Colors.grey.shade700,
                            offset: const Offset(5, 5),
                            blurRadius: 12)
                      ],
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: infoRanges(proteinCalcul, customRed, "Protine"),
                  ),
                ],
              ),
              addVerticalSpace(screenHeigth! * 0.15),
              F_M_Button(
                theFunction: () {
                  Navigator.pop(context);
                },
                isSelected: true,
                theText: "Back",
              )
            ],
          ),
        ),
      ),
    );
  }

  SfRadialGauge infoRanges(double value, Color theColor, String theText) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            // showLabels: false,
            labelOffset: 20,
            showTicks: false,
            radiusFactor: 0.85,
            maximum: value,
            axisLineStyle: const AxisLineStyle(
                cornerStyle: CornerStyle.startCurve, thickness: 5),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 90,
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      value.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Text(
                        '$theText\n${value.toStringAsFixed(1)} ${theText == 'Calories' ? "" : "g"}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: theColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GaugeAnnotation(
                angle: 57,
                positionFactor: .75,
                widget: Text(value.toStringAsFixed(0),
                    style: const TextStyle(fontSize: 12)),
              ),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                value: value,
                width: 8,
                pointerOffset: 0,
                cornerStyle: CornerStyle.bothCurve,
                color: theColor,
              ),
              MarkerPointer(
                value: value - value * 0.015,
                markerOffset: 1.5,
                color: Colors.white,
                markerHeight: 7,
                markerWidth: 7,
                markerType: MarkerType.circle,
              ),
            ]),
      ],
    );
  }
}
