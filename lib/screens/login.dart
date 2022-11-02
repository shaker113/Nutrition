import 'dart:ui';

import 'package:fina/models/models.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

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
            Image(
              image: const AssetImage(backGroundImage),
              alignment: Alignment.center,
              width: screenWidth,
              height: screenHeigth,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.07),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 4.0,
                          sigmaY: 4.0,
                        ),
                        child: Container(),
                      ),
                      FittedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.13)),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.black.withOpacity(0.15),
                                  Colors.black.withOpacity(0.05),
                                ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOGIN",
                              style: customTextStyle.labelMedium,
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
                            GradientButton(
                                theFunction: () {
                                  sginInWithEmail();
                                },
                                theText: "Login"),
                            TextButton(
                              onPressed: () {},
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
                            GoogleButton(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "dont have an account?",
                                  style: customTextStyle.labelSmall,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.popAndPushNamed(
                                        context, "sgin up");
                                  },
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      color: customBlue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
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

      Navigator.pushNamed(context, "homepage");

      CustomSnakBar("signed in successfully", context);
    } catch (e) {
      CustomSnakBar("email or password is incorrect", context);
    }
  }
}
