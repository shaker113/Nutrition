import 'package:fina/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:circular_indicator/circular_indicator.dart';
import 'package:fina/widgets/text_field.dart';
import 'package:fina/widgets/text.dart';
import 'package:fina/widgets/circular_indicator.dart';
import 'package:fina/widgets/buttons/rounded_button.dart';

class DailyNeedCalculator extends StatefulWidget {
  @override
  State<DailyNeedCalculator> createState() => _DailyNeedCalculator();
}

class _DailyNeedCalculator extends State<DailyNeedCalculator> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  double calorieCal = 0;
  double calHeight = 0;
  double proteinCalcul = 0;
  String putYourRealHeight = 'Put your Real Height Please';
  int groupValue = 1;
  double calUsingRadio = 0;
  double calFat = 0;
  double fat = 0;
  double calProtienplusscalFat = 0;
  double calProtien = 0;
  double calCarb = 0;
  double carbCalcul = 0;
  List<String> lst = [
    'wanna lose some weight',
    'keep your weight',
    'tryin to put on some weight'
  ];
  int selectedIndex = 0;
  bool animationtrue = false;

  void plussMethod() {
    double weight = double.parse(controller1.text);
    double height = double.parse(controller2.text);
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

    if (selectedIndex == 0) {
      calUsingRadio = calHeight - 737;
    }
    if (selectedIndex == 1) {
      calUsingRadio = calHeight - 314;
    }
    if (selectedIndex == 2) {
      calUsingRadio = calHeight + 274;
    }

    calFat = 0.25 * calUsingRadio;
    fat = calFat / 9;

    calProtien = proteinCalcul * 4;

    calProtienplusscalFat = calProtien + calFat;

    calCarb = calUsingRadio - calProtienplusscalFat;

    carbCalcul = calCarb / 4;
    animationtrue = true;
    setState(() {
      calUsingRadio;
      proteinCalcul;
      fat;
      carbCalcul;
      animationtrue;
    });
  }

  void clearEverything() {
    controller1.clear();
    controller2.clear();

    setState(() {
      calUsingRadio = 0;
      proteinCalcul = 0;
      carbCalcul = 0;
      fat = 0;
    });
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex(index),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      // borderSide: BorderSide(
      //     color: selectedIndex == index ? Colors.amber : Colors.grey),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          txt,
          style: TextStyle(
              color: selectedIndex == index ? customRed : Colors.grey),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: backgrounColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: 22,
                  right: 0,
                ),
                child: Text(
                  'Calculator',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: 'Weight',
                                fontsize: 18,
                                fontWieght: FontWeight.w300,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFieldWidget(controller: controller1),
                              ),
                              TextWidget(
                                  text: 'KG',
                                  fontsize: 15,
                                  fontWieght: FontWeight.w400),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 15),
                                child: TextWidget(
                                    text: 'Height',
                                    fontsize: 18,
                                    fontWieght: FontWeight.w300),
                              ),
                              TextFieldWidget(controller: controller2),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextWidget(
                                    text: 'CM',
                                    fontsize: 15,
                                    fontWieght: FontWeight.w400),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                customRadio(lst[0], 0),
                                customRadio(lst[1], 1),
                                customRadio(lst[2], 2)
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButtonWidget(
                                  title: 'Calculate',
                                  onPress: plussMethod,
                                  color: Colors.amber,
                                  left: 50,
                                  right: 50),
                              SizedBox(
                                width: 10,
                              ),
                              // RoundedButtonWidget(
                              //     title: 'Clear',
                              //     onPress: clearEverything,
                              //     color: Colors.yellow.shade300,
                              //     left: 25,
                              //     right: 25),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  TextWidget(
                                      text: 'Protein',
                                      fontsize: 15,
                                      fontWieght: FontWeight.bold),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor:
                                          Colors.deepPurple.shade200,
                                      progressColors: Colors.deepPurple,
                                      textInside:
                                          proteinCalcul.toStringAsFixed(1)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  TextWidget(
                                      text: 'Calories',
                                      fontsize: 15,
                                      fontWieght: FontWeight.bold),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor: Colors.yellow.shade200,
                                      progressColors: Colors.yellow.shade900,
                                      textInside:
                                          calUsingRadio.toStringAsFixed(1)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  TextWidget(
                                      text: 'Grams of Carbs',
                                      fontsize: 15,
                                      fontWieght: FontWeight.bold),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor: Colors.green.shade200,
                                      progressColors: Colors.green,
                                      textInside:
                                          carbCalcul.toStringAsFixed(1)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  TextWidget(
                                      text: 'Fat',
                                      fontsize: 15,
                                      fontWieght: FontWeight.bold),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor: Colors.red.shade200,
                                      progressColors: Colors.red.shade800,
                                      textInside: fat.toStringAsFixed(1)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
