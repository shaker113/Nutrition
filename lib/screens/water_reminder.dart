import 'dart:async';

import 'package:fina/data/data.dart';
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

  @override
  void initState() {
    super.initState();
    firstController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

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
        vsync: this, duration: Duration(milliseconds: 1500));
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
        vsync: this, duration: Duration(milliseconds: 1500));
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
        vsync: this, duration: Duration(milliseconds: 1500));
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
    Timer(Duration(seconds: 2), (() {
      firstController.forward();
    }));

    Timer(Duration(milliseconds: 1600), (() {
      secondController.forward();
    }));
    Timer(Duration(milliseconds: 800), (() {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 191, 189),
      body: Stack(children: [
        Center(
          child: Text(
            '3.7 Liter',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                wordSpacing: 3,
                color: Colors.white.withOpacity(0.7)),
            textScaleFactor: 7,
          ),
        ),
        CustomPaint(
          painter: MyPainter(firstAnimation.value, secondAnimation.value,
              thirdAnimation.value, fourAnimation.value),
          child: SizedBox(
            height: size.height,
            width: size.width,
          ),
        )
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
      ..color = Color(0xff3B6ABA).withOpacity(0.8)
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