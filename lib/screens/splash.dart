import 'dart:async';

import 'package:fina/data/data.dart';
import 'package:fina/screens/homepage.dart';
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
  @override
  void initState() {
    super.initState();
    userId = authInstance.currentUser?.uid;
    isLogin == true ? checkRole() : null;
    isLogin == true ? getAccountInfo() : null;
    Timer(Duration(seconds: 3), () {
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
      body: Container(
        height: double.infinity,
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
    );
  }
}