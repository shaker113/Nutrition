import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../data/data.dart';

class FatResults extends StatelessWidget {
  double bmi, fat;
  String status, gender;
  int age;

  FatResults({
    super.key,
    required this.age,
    required this.gender,
    required this.bmi,
    required this.fat,
    required this.status,
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
                "BMI Results",
                style: customTextStyle.headlineLarge,
              ),
              addVerticalSpace(screenHeigth! * 0.05),
              Container(
                alignment: Alignment.center,
                height: 280,
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
                child: bmiRanges(),
              ),
              addVerticalSpace(screenHeigth! * 0.04),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                ),
                child: Column(
                  children: [
                    const Text(
                      "Body fat percentage",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    addVerticalSpace(10),
                    fatRanges(gender, age),
                    Text(
                      '${fat.toStringAsFixed(1)} %',
                      style: TextStyle(
                          fontSize: 26,
                          color: status == "Underfat"
                              ? Colors.blue
                              : status == "Healthy"
                                  ? Colors.green
                                  : status == "Overweight"
                                      ? Colors.orangeAccent
                                      : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: status,
                            style: TextStyle(
                                fontSize: 26,
                                color: status == "Underfat"
                                    ? Colors.blue
                                    : status == "Healthy"
                                        ? Colors.green
                                        : status == "Overweight"
                                            ? Colors.orangeAccent
                                            : Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: " body weight",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                        text: "You have ",
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(screenHeigth! * 0.1),
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

  SfRadialGauge bmiRanges() {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            // showLabels: false,
            showTicks: false,
            radiusFactor: 0.85,
            maximum: 40,
            axisLineStyle: const AxisLineStyle(
                cornerStyle: CornerStyle.startCurve, thickness: 5),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 90,
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Text(
                        'BMI\n$status',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: status == "Underfat"
                              ? Colors.blue
                              : status == "Healthy"
                                  ? Colors.green
                                  : status == "Overweight"
                                      ? Colors.orangeAccent
                                      : Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const GaugeAnnotation(
                angle: 54,
                positionFactor: .85,
                widget: Text('40', style: TextStyle(fontSize: 14)),
              ),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                value: bmi,
                width: 18,
                pointerOffset: -6,
                cornerStyle: CornerStyle.bothCurve,
                color: Colors.white,
                gradient: SweepGradient(
                  colors: <Color>[
                    Colors.blue,
                    status == "Healthy" ||
                            status == "Obese" ||
                            status == "Overweight"
                        ? Colors.green
                        : Colors.blue,
                    status == "Overweight" || status == "Obese"
                        ? Colors.orange
                        : status == "Healthy"
                            ? Colors.green
                            : Colors.blue,
                    status == "Obese"
                        ? Colors.red
                        : status == "Overweight"
                            ? Colors.orange
                            : status == "Healthy"
                                ? Colors.green
                                : Colors.blue
                  ],
                  stops: status == "Obese"
                      ? <double>[0.38, 0.65, 0.75, 1]
                      : status == "Overweight"
                          ? <double>[0.4, 0.9, 1, 1]
                          : status == "Healthy"
                              ? <double>[0.6, 1, 1, 1]
                              : null,
                ),
              ),
              MarkerPointer(
                value: bmi - 0.7,
                markerOffset: 0,
                color: Colors.white,
                markerHeight: 13,
                markerWidth: 13,
                markerType: MarkerType.circle,
              ),
            ]),
      ],
    );
  }

  SfLinearGauge fatRanges(String gender, int age) {
    return SfLinearGauge(
      markerPointers: [
        LinearShapePointer(
          shapeType: LinearShapePointerType.triangle,
          height: 12,
          position: LinearElementPosition.inside,
          enableAnimation: true,
          value: fat,
          animationType: LinearAnimationType.ease,
          color: status == "Underfat"
              ? Colors.blue
              : status == "Healthy"
                  ? Colors.green
                  : status == "Overweight"
                      ? Colors.orangeAccent
                      : Colors.red,
        )
      ],
      animateAxis: true,
      animateRange: true,
      maximum: 50,
      minorTicksPerInterval: 10,
      interval: 10,
      tickOffset: 2,
      useRangeColorForAxis: true,
      axisLabelStyle: TextStyle(fontSize: 12, color: Colors.grey.shade700),
      labelOffset: 5,
      ranges: <LinearGaugeRange>[
        LinearGaugeRange(
          endValue: gender == "Male"
              ? (age >= 20 && age <= 40)
                  ? 8
                  : (age >= 41 && age <= 60)
                      ? 11
                      : (age >= 61 && age <= 79)
                          ? 13
                          : 10
              : (gender == "Female")
                  ? (age >= 20 && age <= 40)
                      ? 21
                      : (age >= 41 && age <= 60)
                          ? 23
                          : (age >= 61 && age <= 79)
                              ? 24
                              : 23
                  : 12,
          startWidth: 0,
          midWidth: 40,
          endWidth: 40,
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: const Text(
              "Underfat",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ),
        LinearGaugeRange(
          startValue: gender == "Male"
              ? (age >= 20 && age <= 40)
                  ? 8
                  : (age >= 41 && age <= 60)
                      ? 11
                      : (age >= 61 && age <= 79)
                          ? 13
                          : 10
              : (gender == "Female")
                  ? (age >= 20 && age <= 40)
                      ? 21
                      : (age >= 41 && age <= 60)
                          ? 23
                          : (age >= 61 && age <= 79)
                              ? 24
                              : 23
                  : 12,
          endValue: gender == "Male"
              ? (age >= 20 && age <= 40)
                  ? 19
                  : (age >= 41 && age <= 60)
                      ? 22
                      : (age >= 61 && age <= 79)
                          ? 25
                          : 10
              : (gender == "Female")
                  ? (age >= 20 && age <= 40)
                      ? 33
                      : (age >= 41 && age <= 60)
                          ? 35
                          : (age >= 61 && age <= 79)
                              ? 36
                              : 23
                  : 12,
          startWidth: 40,
          endWidth: 40,
          child: Container(
            alignment: Alignment.center,
            color: Colors.green,
            child: const Text(
              "Healthy",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ),
        LinearGaugeRange(
          startValue: gender == "Male"
              ? (age >= 20 && age <= 40)
                  ? 19
                  : (age >= 41 && age <= 60)
                      ? 22
                      : (age >= 61 && age <= 79)
                          ? 25
                          : 10
              : (gender == "Female")
                  ? (age >= 20 && age <= 40)
                      ? 33
                      : (age >= 41 && age <= 60)
                          ? 35
                          : (age >= 61 && age <= 79)
                              ? 36
                              : 23
                  : 12,
          endValue: gender == "Male"
              ? (age >= 20 && age <= 40)
                  ? 25
                  : (age >= 41 && age <= 60)
                      ? 27
                      : (age >= 61 && age <= 79)
                          ? 30
                          : 10
              : (gender == "Female")
                  ? (age >= 20 && age <= 40)
                      ? 39
                      : (age >= 41 && age <= 60)
                          ? 42
                          : (age >= 61 && age <= 79)
                              ? 36
                              : 23
                  : 12,
          midWidth: 40,
          endWidth: 40,
          child: Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: const Text(
              "OverWeight",
              overflow: TextOverflow.fade,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ),
        ),
        LinearGaugeRange(
          startValue: gender == "Male"
              ? (age >= 20 && age <= 40)
                  ? 25
                  : (age >= 41 && age <= 60)
                      ? 27
                      : (age >= 61 && age <= 79)
                          ? 30
                          : 10
              : (gender == "Female")
                  ? (age >= 20 && age <= 40)
                      ? 39
                      : (age >= 41 && age <= 60)
                          ? 42
                          : (age >= 61 && age <= 79)
                              ? 36
                              : 23
                  : 12,
          endValue: 50,
          midWidth: 40,
          endWidth: 40,
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: const Text(
              "Obese",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
