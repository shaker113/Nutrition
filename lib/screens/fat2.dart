import 'dart:async';

import 'package:fina/models/get_user_info.dart';
import 'package:fina/screens/fat_results.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class BodyFatCalc extends StatefulWidget {
  const BodyFatCalc({super.key});

  @override
  State<BodyFatCalc> createState() => BodyFatCalcState();
}

class BodyFatCalcState extends State<BodyFatCalc> {
  late double height, weight;
  late int age;
  String? gender, womanstatus, manstatus, finalstatus;
  double? fatWemon, BMI, fatWemonRounded, fatMen, fatMenRounded, finalFat;

  void testmethod(double thisweight, double thisheight, String thisGender,
      int thisAge, bool isInProfile) {
    int age = thisAge;
    double doubleHeight = thisheight;
    double doubleWeight = thisweight;
    double weghtInGram = doubleWeight * 1000;

    if (thisGender == "Male") {
      BMI = (weghtInGram / doubleHeight / doubleHeight) * 10.000;
      if (!isInProfile) {
        setState(() {
          BMI = num.parse(BMI!.toStringAsFixed(1)) as double?;
        });
      } else {
        userBmi = num.parse(BMI!.toStringAsFixed(1)) as double?;
      }
      fatMen = (1.20 * BMI!) + (0.23 * age) - 16.2;
      fatMenRounded = num.parse(fatMen!.toStringAsFixed(1)) as double?;
      if (!isInProfile) {
        setState(() {
          finalFat = fatMenRounded;
        });
      } else {
        userFatPercentage = fatMenRounded;
      }

      if (age >= 20 && age <= 40) {
        if (fatMenRounded! <= 8) {
          manstatus = "Underfat";
        } else if (fatMenRounded! >= 9 && fatMenRounded! <= 19) {
          manstatus = "Healthy";
        } else if (fatMenRounded! >= 20 && fatMenRounded! <= 25) {
          manstatus = "Overweight";
        } else if (fatMenRounded! >= 26) {
          manstatus = "Obese";
        }
      } else if (age >= 41 && age <= 60) {
        if (fatMenRounded! <= 11) {
          manstatus = "Underfat";
        } else if (fatMenRounded! >= 12 && fatMenRounded! <= 22) {
          manstatus = "Healthy";
        } else if (fatMenRounded! >= 23 && fatMenRounded! <= 27) {
          manstatus = "Overweight";
        } else if (fatMenRounded! >= 28) {
          manstatus = "Obese";
        }
      } else if (age >= 61 && age <= 79) {
        if (fatMenRounded! <= 13) {
          manstatus = "Underfat";
        } else if (fatMenRounded! >= 14 && fatMenRounded! <= 25) {
          manstatus = "Healthy";
        } else if (fatMenRounded! >= 26 && fatMenRounded! <= 30) {
          manstatus = "Overweight";
        } else if (fatMenRounded! >= 31) {
          manstatus = "Obese";
        }
      }
      if (!isInProfile) {
        setState(() {
          finalstatus = manstatus;
        });
      } else {
        userStatus = manstatus;
      }
    } else if (thisGender == "Female") {
      BMI = (weghtInGram / doubleHeight / doubleHeight) * 10.000;
      if (!isInProfile) {
        setState(() {
          BMI = num.parse(BMI!.toStringAsFixed(1)) as double?;
        });
      } else {
        userBmi = num.parse(BMI!.toStringAsFixed(1)) as double?;
      }
      fatWemon = (1.20 * BMI!) + (0.23 * age) - 5.4;
      fatWemonRounded = num.parse(fatWemon!.toStringAsFixed(1)) as double?;
      if (!isInProfile) {
        setState(() {
          finalFat = fatWemonRounded;
        });
      } else {
        userFatPercentage = fatWemonRounded;
      }
      if (age >= 20 && age <= 40) {
        if (fatWemonRounded! <= 21) {
          womanstatus = "Underfat";
        } else if (fatWemonRounded! >= 22 && fatWemonRounded! <= 33) {
          womanstatus = "Healthy";
        } else if (fatWemonRounded! >= 34 && fatWemonRounded! <= 39) {
          womanstatus = "Overweight";
        } else if (fatWemonRounded! >= 40) {
          womanstatus = "Obese";
        }
      } else if (age >= 41 && age <= 60) {
        if (fatWemonRounded! <= 23) {
          womanstatus = "Underfat";
        } else if (fatWemonRounded! >= 24 && fatWemonRounded! <= 35) {
          womanstatus = "Healthy";
        } else if (fatWemonRounded! >= 36 && fatWemonRounded! <= 42) {
          womanstatus = "Overweight";
        } else if (fatWemonRounded! >= 43) {
          womanstatus = "Obese";
        }
      } else if (age >= 61 && age <= 79) {
        if (fatWemonRounded! <= 24) {
          womanstatus = "Underfat";
        } else if (fatWemonRounded! >= 25 && fatWemonRounded! <= 36) {
          womanstatus = "Healthy";
        } else if (fatWemonRounded! >= 37 && fatWemonRounded! <= 42) {
          womanstatus = "Overweight";
        } else if (fatWemonRounded! >= 43) {
          womanstatus = "Obese";
        }
      }
      if (!isInProfile) {
        setState(() {
          finalstatus = womanstatus;
        });
      } else {
        userStatus = womanstatus;
      }
    }
  }

  @override
  void initState() {
    weight = userWeight ?? 20;
    height = userHeight ?? 110;
    age = userAge ?? 20;
    gender = userGender ?? "Male";
    testmethod(
      weight,
      height,
      gender ?? 'Male',
      age,
      false,
    );
    super.initState();
  }

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
                  left: screenWidth! / 2 - 80,
                  child: Text(
                    "BMI Calculator",
                    style: customTextStyle.headlineLarge,
                  )),
              Positioned(
                top: 80,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: F_M_Button(
                            theFunction: () {
                              setState(() {
                                gender = "Female";
                              });
                            },
                            isSelected: gender == "Female",
                            theText: "Female",
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: F_M_Button(
                            theFunction: () {
                              setState(() {
                                gender = "Male";
                              });
                            },
                            isSelected: gender == "Male",
                            theText: "Male",
                          )),
                    )
                  ],
                ),
              ),
              HeightSlider(),
              WightBox(),
              AgeBox(),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: LongButton(
                    theFunction: () {
                      testmethod(
                        weight,
                        height,
                        gender ?? 'Male',
                        age,
                        false,
                      );
                      print(BMI);
                      print(finalFat);
                      print(finalstatus);
                      print(gender);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FatResults(
                              age: age,
                              gender: gender ?? "Male",
                              bmi: BMI!,
                              fat: finalFat!,
                              status: finalstatus!),
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

  Positioned AgeBox() {
    Timer? theTimer;

    return Positioned(
      right: 20,
      bottom: screenHeigth! * .45,
      child: shadowBox(
        height: screenHeigth! * 0.3,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "AGE",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              age.toStringAsFixed(0),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShadowButoon(
                    theText: "-",
                    theFunction: () {
                      setState(() {
                        if (age > 14) {
                          age--;
                        }
                      });
                    }),
                ShadowButoon(
                    theText: "+",
                    onlongpress: (p) {
                      theTimer = Timer.periodic(
                          const Duration(milliseconds: 150), (c) {
                        setState(() {
                          age += 1;
                        });

                        print(theTimer);
                      });
                    },
                    onlongpressends: (p) {
                      theTimer!.cancel();
                    },
                    theFunction: () {
                      setState(() {
                        age++;
                      });
                    }),
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
      bottom: screenHeigth! * .1,
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
              Text(
                weight.toStringAsFixed(1),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShadowButoon(
                      theText: "-",
                      theFunction: () {
                        setState(() {
                          if (weight > 20) {
                            weight = weight - .5;
                          }
                        });
                      }),
                  ShadowButoon(
                      theText: "+",
                      theFunction: () {
                        setState(() {
                          weight = weight + .5;
                        });
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
      bottom: screenHeigth! * .1,
      child: shadowBox(
          height: screenHeigth! * 0.65,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(5),
              Center(
                child: Text(
                  "HEIGHT\n${height.round()} cm",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
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
