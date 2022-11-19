import 'dart:async';
import 'dart:math';

import 'package:fina/data/data.dart';
import 'package:fina/widgets/buttons/back_button.dart';
import 'package:flutter/material.dart';

class Water_Reminder extends StatefulWidget {
  const Water_Reminder({super.key});

  @override
  State<Water_Reminder> createState() => _Water_ReminderState();
}

class _Water_ReminderState extends State<Water_Reminder>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation firstAnimation;
  late AnimationController secondController;
  late Animation secondAnimation;
  late AnimationController thirdController;
  late Animation thirdAnimation;
  late AnimationController fourController;
  late Animation fourAnimation;
  late double waterValue;
  double userWater = 0;
  double? userWaterTemp;
  @override
  void initState() {
    super.initState();
    userWater = userWaterTemp ?? 0;
    waterValue = .55;
    firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    firstAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    secondAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    thirdAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fourAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: fourController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourController.forward();
        }
      });
    Timer(const Duration(seconds: 2), (() {
      firstController.forward();
    }));

    Timer(const Duration(milliseconds: 1600), (() {
      secondController.forward();
    }));
    Timer(const Duration(milliseconds: 800), (() {
      thirdController.forward();
    }));
    fourController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 191, 189),
      body: Stack(children: [
        Center(
          child: Text(
            '$userWater Liter',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                wordSpacing: 3,
                color: Colors.white.withOpacity(0.8)),
            textScaleFactor: 6,
          ),
        ),
        CustomPaint(
          painter: MyPainter(
              firstAnimation.value * waterValue,
              secondAnimation.value * waterValue,
              thirdAnimation.value * waterValue,
              fourAnimation.value * waterValue),
          child: SizedBox(
            height: screenHeigth,
            width: screenWidth,
          ),
        ),
        Positioned(
          top: 100,
          right: 100,
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 75, width: 75),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      elevation: 25,
                      shadowColor: Colors.white,
                      side: BorderSide(color: Colors.black, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    setState(
                      () {
                        userWater > 0 ? userWater = userWater - 0.25 : null;

                        // double calc2 = (userWater / 3.75) * 2 + 0.5;
                        double calc = pow((userWater / 3.75), 2) + 0.55;
                        // print(calc2);
                        print(userWater);
                        waterValue = calc;
                      },
                    );
                  },
                  child: Text("-"),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              // Text(
              //   '$userWater Liter',
              //   style: TextStyle(
              //       fontWeight: FontWeight.w600,
              //       wordSpacing: 2,
              //       color: Colors.white.withOpacity(0.9)),
              // ),

              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 75, width: 75),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      elevation: 25,
                      shadowColor: Colors.white,
                      side: BorderSide(color: Colors.black, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    setState(
                      () {
                        userWater = userWater + 0.25;

                        // double calc2 = pow((userWater / 3.75), 2) + 0.5;
                        double calc = pow((userWater / 3.75), 2) + 0.55;
                        print(calc);
                        waterValue = calc;
                        print(waterValue);
                      },
                    );
                  },
                  child: Text("+"),
                ),
              ),
            ],
          ),
        ),
        SafeArea(child: backButton(context)),
      ]),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourValue;

  MyPainter(this.firstValue, this.secondValue, this.thirdValue, this.fourValue);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xff3B6ABA).withOpacity(0.8)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(size.width * .4, size.height / secondValue, size.width * .7,
          size.height / thirdValue, size.width, size.height / fourValue)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
