// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:fina/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';
import 'sgin_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();

class _LogInState extends State<LogIn> {
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
              child: Lottie.asset(cleanVegetable, width: screenWidth),
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
                                "LOGIN",
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
                          CustomTextfield(
                            theController: password,
                            label: "Password",
                            visbleText: true,
                          ),
                          addVerticalSpace(10),
                          LongButton(
                              theFunction: () {
                                sginInWithEmail();
                              },
                              theText: "Login"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "password reset");
                            },
                            child: Text(
                              "Forget password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: customRed,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          addVerticalSpace(15),
                          const OrRow(),
                          addVerticalSpace(15),
                          const GoogleButton(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "dont have an account?",
                                style: customTextStyle.labelSmall,
                              ),
                              CustomTextButton(
                                theText: "SIGN UP",
                                theFunction: () => Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: const SginUp(),
                                    type: PageTransitionType.bottomToTop,
                                  ),
                                ),
                              ),
                            ],
                          )
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

  Future sginInWithEmail() async {
    try {
      await authInstance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      userId = authInstance.currentUser?.uid;
      userInfo = userCollection.doc(userId);
      checkRole();
      Navigator.pushNamed(context, "homepage");

      CustomSnakBar("signed in successfully", context);
    } on FirebaseAuthException catch (e) {
      CustomSnakBar(e.message, context);
    }
  }
}
