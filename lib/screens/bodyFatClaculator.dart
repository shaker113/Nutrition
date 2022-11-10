
import 'package:flutter/material.dart';

import '../widgets/tableFatCalc.dart';
import '../widgets/textFieldCalc.dart';

class bodyFatCal extends StatefulWidget {
  const bodyFatCal({super.key});
  @override
  State<bodyFatCal> createState() => _bodyFatCalState();
}

class _bodyFatCalState extends State<bodyFatCal> {
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
  void testmethod() {
    int age = int.parse(ageCont.text);
    double doubleHeight = double.parse(heightCont.text);
    double doubleWeight = double.parse(weightCont.text);
    double weghtInGram = doubleWeight * 1000;

    setState(() {
      if (gender == "Male") {
        BMI = (weghtInGram / doubleHeight / doubleHeight) * 10.000;
        BMI = num.parse(BMI!.toStringAsFixed(1)) as double?;
        fatMen = (1.20 * BMI!) + (0.23 * age) - 16.2;
        fatMenRounded = num.parse(fatMen!.toStringAsFixed(1)) as double?;

        finalFat = fatMenRounded;
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
        finalstatus = manstatus;
      } else if (gender == "Female") {
        BMI = (weghtInGram / doubleHeight / doubleHeight) * 10.000;
        BMI = num.parse(BMI!.toStringAsFixed(1)) as double?;
        fatWemon = (1.20 * BMI!) + (0.23 * age) - 5.4;
        fatWemonRounded = num.parse(fatWemon!.toStringAsFixed(1)) as double?;
        finalFat = fatWemonRounded;
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
        finalstatus = womanstatus;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      gender = "Male";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: const Color(0xFF21BFBD)),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF21BFBD),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
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
                          Container(
                              width: 90,
                              height: 60,
                              child: textField(
                                hint: "cm",
                                mycont: heightCont,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Weight :",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 90,
                              height: 60,
                              child: textField(
                                hint: "kg",
                                mycont: weightCont,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text("Age :",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            width: 32,
                          ),
                          Container(
                              width: 90,
                              height: 60,
                              child: textField(
                                hint: "",
                                mycont: ageCont,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(15),
                              backgroundColor: Colors.black),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              testmethod();
                              // heightCont.text = "";
                              // weightCont.text = "";
                              // ageCont.text = "";
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
                        bodyfat: "${finalFat ?? ' '}",
                        status: "${finalstatus ?? ' '}",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
