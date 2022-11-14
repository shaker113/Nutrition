import 'package:fina/data/data.dart';
import 'package:fina/models/get_user_info.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/tableFatCalc.dart';
import '../widgets/textFieldCalc.dart';
import 'dart:ui';

class bodyFatCal extends StatefulWidget {
  const bodyFatCal({super.key});
  @override
  State<bodyFatCal> createState() => TheStatOfbodyFatCalState();
}

class TheStatOfbodyFatCalState extends State<bodyFatCal> {
  final _formKey = GlobalKey<FormState>();
  double? fatWemon;
  double? weight;
  TextEditingController ageCont = TextEditingController();
  TextEditingController heightCont = TextEditingController();
  TextEditingController weightCont = TextEditingController();

  double? BMI;
  double? fatWemonRounded;
  String? gender;
  double? fatMen;
  double? fatMenRounded;
  double? finalFat;
  String? womanstatus;
  String? manstatus;
  String? finalstatus;
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
    setState(() {
      heightCont.text = (userHeight ?? 0).toString();
      weightCont.text = (userWeight ?? 0).toString();
      ageCont.text = (userAge ?? 0).toString();
      gender = userGender;
    });
    testmethod(
      double.parse(weightCont.text),
      double.parse(heightCont.text),
      gender ?? 'Male',
      int.parse(ageCont.text),
      false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Container(
                alignment: Alignment.bottomCenter,
                height: screenHeigth,
                width: screenWidth,
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  colors: [backgrounColor, backgrounColor2],
                  center: Alignment.bottomRight,
                  radius: 4,
                ))),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenWidth! * 0.1,
                  horizontal: screenHeigth! * 0.01),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.15),
                          Colors.black.withOpacity(0.05),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(children: [
                        Text(
                          "Calculate your body fat",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: buttonsColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Gender :",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Radio(
                                activeColor: Colors.black,
                                value: "Male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                }),
                            const Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Radio(
                                activeColor: Colors.black,
                                value: "Female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                }),
                            const Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text("Height :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                width: 70,
                                height: 50,
                                child: textField(
                                  hint: "cm",
                                  mycont: heightCont,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text("Weight :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                width: 60,
                                height: 50,
                                child: textField(
                                  hint: "kg",
                                  mycont: weightCont,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            addVerticalSpace(100),
                            const Text("Age :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              width: 32,
                            ),
                            Container(
                                width: 60,
                                height: 50,
                                child: textField(
                                  hint: "",
                                  mycont: ageCont,
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                backgroundColor: Colors.black),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                testmethod(
                                  double.parse(weightCont.text),
                                  double.parse(heightCont.text),
                                  gender ?? 'Male',
                                  int.parse(ageCont.text),
                                  false,
                                );
                              }
                              if (gender == null || gender!.isEmpty) {
                                print("select gender");
                              }
                            },
                            child: const Text("Calculate",
                                style: TextStyle(
                                  fontSize: 20,
                                ))),
                        const SizedBox(
                          height: 30,
                        ),
                        tableWidget(
                          BMI: "${BMI ?? ' '}",
                          bodyfat: "${finalFat ?? ' '} %",
                          status: "${finalstatus ?? ' '}",
                        ),
                        LottieBuilder.asset(
                          lottieImage,
                          fit: BoxFit.fill,
                          height: 190,
                          width: 190,
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

//
//                             ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     padding: const EdgeInsets.all(15),
//                                     backgroundColor: Colors.black),
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     testmethod();
//                                     // heightCont.text = "";
//                                     // weightCont.text = "";
//                                     // ageCont.text = "";
//                                   }
//                                   if (gender == null || gender!.isEmpty) {
//                                     print("select gender");
//                                   }
//                                 },
//                                 child: const Text("Calculate",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                     ))),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             tableWidget(
//                               BMI: "${BMI ?? ' '}",
//                               bodyfat: "${finalFat ?? ' '} %",
//                               status: "${finalstatus ?? ' '}",
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
}
