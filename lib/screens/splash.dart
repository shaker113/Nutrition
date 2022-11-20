import 'dart:async';
import 'dart:math';

import 'package:fina/data/data.dart';
import 'package:fina/screens/screens.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/models.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  List<String> quoutes = [
    "Go from nothing fits to feeling fit.",
    "Whenever I feel sad, I just go to my happy place. The fridge.",
    "Today I will live in the moment.Unless it's unpleasant. In which case I will eat a cupcake.",
    "The groundwork of all happiness is health.",
    "It took more than a day to put it on. It will take more than a day to take it off.",
    "If you keep good food in your fridge, you will eat good food.",
    "It takes five minutes to consume 500 calories. It takes two hours to burn them off.",
    "One must eat to live, not live to eat.",
    "Don’t dig your grave with your own knife and fork.",
    "Your goals, minus your doubts, equal your reality.",
    "An optimist is a person who starts a new diet on Thanksgiving Day.",
    "You don’t drown by falling in water. You drown by staying there."
  ];
  @override
  void initState() {
    super.initState();
    userId = authInstance.currentUser?.uid;
    isLogin == true ? checkRole() : null;
    isLogin == true ? getAccountInfo() : null;
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return isLogin == true ? const HomePage() : const Welcome();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [backgrounColor, backgrounColor2],
                center: Alignment.bottomLeft,
                radius: 2,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/11.png"),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Text(
              quoutes[Random().nextInt(quoutes.length)],
              textAlign: TextAlign.center,
              style: customTextStyle.headlineLarge,
            ),
          )
        ],
      ),
    );
  }
}
