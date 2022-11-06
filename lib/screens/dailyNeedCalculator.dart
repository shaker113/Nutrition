import 'package:fina/data/data.dart';
import 'package:fina/widgets/BluetextField.dart';
import 'package:fina/widgets/buttons/back_button.dart';
import 'package:fina/widgets/buttons/gradiantButton.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:fina/widgets/circular_indicator.dart';

class DailyNeedCalculator extends StatefulWidget {
  @override
  State<DailyNeedCalculator> createState() => _DailyNeedCalculator();
}

class _DailyNeedCalculator extends State<DailyNeedCalculator> {
  TextEditingController weightController = TextEditingController();

  TextEditingController heightController = TextEditingController();

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

  List<String> lst = [
    'wanna lose some weight',
    'keep your weight',
    'tryin to put on some weight'
  ];
  int selectedIndex = 0;
  bool animationtrue = false;

  void plussMethod() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
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
    weightController.clear();
    heightController.clear();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: screenHeigth!),
        child: Container(
          height: screenHeigth,
          width: screenWidth,
          color: backgrounColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(20),
              backButton(context),
              addVerticalSpace(20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 0,
                ),
                child: Text(
                  'Calculator',
                  style: customTextStyle.headlineLarge,
                ),
              ),
              addVerticalSpace(20),
              Expanded(
                child: Container(
                  height: screenHeigth! / 1.5,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          addVerticalSpace(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: customTextStyle.headlineSmall,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: CustomTextfieldBlue(
                                      theController: weightController,
                                      label: ""),
                                ),
                              ),
                              Text(
                                'Kg',
                                style: customTextStyle.titleSmall,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Height',
                                  style: customTextStyle.headlineSmall,
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 40,
                                child: CustomTextfieldBlue(
                                    theController: heightController, label: ""),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'cm',
                                  style: customTextStyle.titleSmall,
                                ),
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
                          GradientButton(
                            theText: 'Calculate',
                            theFunction: plussMethod,
                          ),
                          addVerticalSpace(10),
                          GradientButton(
                              theFunction: clearEverything, theText: "Clear"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Protein',
                                    style: customTextStyle.headlineSmall,
                                  ),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor:
                                          Colors.deepPurple.shade200,
                                      progressColors: Colors.deepPurple,
                                      textInside:
                                          proteinCalcul.toStringAsFixed(1)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Calories',
                                    style: customTextStyle.headlineSmall,
                                  ),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor: Colors.yellow.shade200,
                                      progressColors: Colors.yellow.shade900,
                                      textInside:
                                          calUsingRadio.toStringAsFixed(1)),
                                  const SizedBox(
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
                                  Text(
                                    style: customTextStyle.headlineSmall,
                                    'Grams of Carbs',
                                  ),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor: Colors.green.shade200,
                                      progressColors: Colors.green,
                                      textInside:
                                          carbCalcul.toStringAsFixed(1)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Fat',
                                    style: customTextStyle.headlineSmall,
                                  ),
                                  Circularindicator(
                                      animationTrue: animationtrue,
                                      backGroundColor: Colors.red.shade200,
                                      progressColors: Colors.red.shade800,
                                      textInside: fat.toStringAsFixed(1)),
                                  const SizedBox(
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
