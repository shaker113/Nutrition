import 'dart:async';

import 'package:fina/screens/Daily_results.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../data/data.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DailyNeedsCalc extends StatefulWidget {
  const DailyNeedsCalc({super.key});

  @override
  State<DailyNeedsCalc> createState() => DailyNeedsCalcState();
}

class DailyNeedsCalcState extends State<DailyNeedsCalc> {
  @override
  late double height, weight;

  void initState() {
    selectedIndex = userGoalIndex;
    weight = userWeight ?? 20;
    height = userHeight ?? 110;
    plussMethod(weight, height, false, userGoalIndex);

    super.initState();
  }

  bool animationtrue = false;

  double calorieCal = 0,
      calHeight = 0,
      proteinCalcul = 0,
      calUsingRadio = 0,
      calFat = 0,
      fat = 0,
      calProtienplusscalFat = 0,
      calProtien = 0,
      calCarb = 0,
      carbCalcul = 0;

  int groupValue = 1;
  List<String> lst = ['To lose weight', 'Maintain my weight', 'To gain weight'];
  int selectedIndex = 0;
  void plussMethod(double thisweight, double thisheight, bool isInProfile,
      int theSelectedIndex) {
    double weight = thisweight;
    double height = thisheight;
    calorieCal = (weight * 24 * 1.5);
    proteinCalcul = weight * 2.2;

    if (150 <= height && 154 >= height) {
      calHeight = calorieCal - 350;
    }
    if (154 < height && 159 >= height) {
      calHeight = calorieCal - 300;
    }
    if (159 < height && 164 >= height) {
      calHeight = calorieCal - 250;
    }
    if (164 < height && 169 >= height) {
      calHeight = calorieCal - 200;
    }
    if (169 < height && 174 >= height) {
      calHeight = calorieCal - 150;
    }
    if (174 < height && 179 >= height) {
      calHeight = calorieCal - 100;
    }
    if (179 < height && 184 >= height) {
      calHeight = calorieCal - 50;
    }
    if (184 < height && 189 >= height) {
      calHeight = calorieCal;
    }
    if (theSelectedIndex == 0) {
      calUsingRadio = calHeight - 737;
    }
    if (theSelectedIndex == 1) {
      calUsingRadio = calHeight - 314;
    }
    if (theSelectedIndex == 2) {
      calUsingRadio = calHeight + 274;
    }

    calFat = 0.25 * calUsingRadio;
    fat = calFat / 9;

    calProtien = proteinCalcul * 4;

    calProtienplusscalFat = calProtien + calFat;

    calCarb = calUsingRadio - calProtienplusscalFat;

    carbCalcul = calCarb / 4;
    if (!isInProfile) {
      setState(() {
        calUsingRadio;
        proteinCalcul;
        fat;
        carbCalcul;
        animationtrue;
        // userFat = fat;
        // userProtein = proteinCalcul;
        // userCal = calUsingRadio;
      });
    } else {
      userFat = fat;
      userProtein = proteinCalcul;
      userCal = calUsingRadio;
    }
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return F_M_Button(
      isSelected: selectedIndex == index,
      theText: txt,
      theFunction: () => changeIndex(index),
    );
  }

  Timer? theTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [backgrounColor, backgrounColor2],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(top: 10, left: 10, child: backButton(context)),
              Positioned(
                  top: 20,
                  left: screenWidth! / 2 - 105,
                  child: Text(
                    "Daily Need Calculator",
                    style: customTextStyle.headlineLarge,
                  )),
              goalButtons(),
              HeightSlider(),
              WightBox(),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: LongButton(
                    theFunction: () {
                      plussMethod(weight, height, false, selectedIndex);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DailyResults(
                              calUsingRadio: calUsingRadio,
                              carbCalcul: carbCalcul,
                              fat: fat,
                              proteinCalcul: proteinCalcul),
                        ),
                      );
                    },
                    theText: "Calculate"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned goalButtons() {
    return Positioned(
      bottom: screenHeigth! * .47,
      right: 0,
      child: SizedBox(
        height: screenHeigth! * 0.3,
        width: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: customRadio(lst[0], 0),
                  ),
                ),
              ],
            ),
            addVerticalSpace(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: customRadio(lst[1], 1),
                  ),
                ),
              ],
            ),
            addVerticalSpace(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: customRadio(lst[2], 2),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned WightBox() {
    return Positioned(
      right: 20,
      bottom: screenHeigth! * .12,
      child: shadowBox(
          height: screenHeigth! * 0.3,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "WEIGHT",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              RichText(
                text: TextSpan(
                  text: weight.toStringAsFixed(1),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: " Kg",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShadowButoon(
                      theText: "-",
                      onlongpress: (p) {
                        theTimer = Timer.periodic(
                            const Duration(milliseconds: 120), (timer) {
                          if (weight > 20) {
                            setState(() {
                              weight -= 1;
                            });
                          }
                        });
                      },
                      onlongpressends: (p) {
                        theTimer?.cancel();
                      },
                      theFunction: () {
                        setState(() {
                          if (weight > 20) {
                            weight -= .5;
                          }
                        });
                      }),
                  ShadowButoon(
                      theText: "+",
                      onlongpress: (p) {
                        theTimer = Timer.periodic(
                            const Duration(milliseconds: 120), (timer) {
                          if (weight < 180) {
                            setState(() {
                              weight += 1;
                            });
                          }
                        });
                      },
                      onlongpressends: (p) {
                        theTimer?.cancel();
                      },
                      theFunction: () {
                        if (weight < 180) {
                          setState(() {
                            weight += .5;
                          });
                        }
                      }),
                ],
              )
            ],
          )),
    );
  }

  Positioned HeightSlider() {
    return Positioned(
      left: 20,
      bottom: screenHeigth! * .12,
      child: shadowBox(
          height: screenHeigth! * 0.65,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(5),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "HEIGHT\n${height.round()}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: " cm",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeigth! * 0.65 - 43,
                width: 130,
                child: SfLinearGauge(
                  orientation: LinearGaugeOrientation.vertical,
                  markerPointers: <LinearShapePointer>[
                    LinearShapePointer(
                        value: height,
                        onChanged: (double value) {
                          setState(() {
                            height = value.roundToDouble();
                          });
                        },
                        borderColor: backgrounColor2,
                        width: 20,
                        height: 20,
                        borderWidth: 1.5,
                        color: Colors.white.withOpacity(0.9),
                        position: LinearElementPosition.cross,
                        enableAnimation: true,
                        shapeType: LinearShapePointerType.circle),
                  ],
                  //values
                  maximum: 230,
                  minimum: 110,
                  minorTicksPerInterval: 6,
                  interval: 20,
                  //tick
                  tickOffset: 10,
                  useRangeColorForAxis: true,
                  majorTickStyle:
                      LinearTickStyle(length: 20, color: Colors.grey.shade700),
                  minorTickStyle:
                      LinearTickStyle(length: 10, color: Colors.grey.shade500),
                  //label
                  axisLabelStyle:
                      TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  labelOffset: 15,
                  //bar
                  barPointers: <LinearBarPointer>[
                    LinearBarPointer(
                      value: height,
                      thickness: 8,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: <Color>[backgrounColor2, backgrounColor],
                        ).createShader(bounds);
                      },
                      edgeStyle: LinearEdgeStyle.bothCurve,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
