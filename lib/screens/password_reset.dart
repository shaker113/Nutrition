import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../data/data.dart';
import '../widgets/widgets.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: screenHeigth,
              width: screenWidth,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [backgrounColor, backgrounColor2],
                  center: Alignment.bottomRight,
                  radius: 2,
                ),
              ),
              child: Lottie.asset(lottieImage, width: screenWidth),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.07),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reset you password",
                                style: customTextStyle.labelMedium,
                              ),
                              backButton(context),
                            ],
                          ),
                          addVerticalSpace(5),
                          CustomTextfield(
                            theController: email,
                            label: "Email",
                            inputType: TextInputType.emailAddress,
                          ),
                          addVerticalSpace(10),
                          LongButton(
                              theFunction: () {
                                passwordReset();
                              },
                              theText: "Password reset"),
                          addVerticalSpace(15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      CustomSnakBar(
          "a password reset email has been sent to ${email.text}", context);
      Navigator.pushNamed(context, "sgin in");
    } catch (e) {
      CustomSnakBar(
          "Something went wrong! please make sure you entered the correct email",
          context);
      print(e);
    }
  }
}
