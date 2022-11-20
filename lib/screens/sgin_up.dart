import 'dart:ui';
import 'package:fina/models/models.dart';
import 'package:fina/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class SginUp extends StatefulWidget {
  const SginUp({super.key});

  @override
  State<SginUp> createState() => _SginUpState();
}

class _SginUpState extends State<SginUp> {
  GlobalKey<FormState> myFormKey = GlobalKey();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

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
                  center: Alignment.bottomLeft,
                  radius: 2,
                ),
              ),
              // child: Lottie.asset(cleanVegetable, width: screenWidth),
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
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Form(
                        key: myFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SIGN UP",
                                  style: customTextStyle.labelMedium,
                                ),
                                backButton(context),
                              ],
                            ),
                            addVerticalSpace(10),
                            CustomTextfield(
                              inputType: TextInputType.name,
                              theController: name,
                              label: "Name",
                              validator: (p0) => nameValidator(p0),
                            ),
                            addVerticalSpace(5),
                            CustomTextfield(
                              theController: email,
                              label: "Email",
                              inputType: TextInputType.emailAddress,
                              validator: (p0) => emailValidator(p0),
                            ),
                            addVerticalSpace(10),
                            CustomTextfield(
                              theController: password,
                              label: "Password",
                              visbleText: true,
                              validator: (p0) => passwordValidator(p0),
                            ),
                            addVerticalSpace(10),
                            CustomTextfield(
                              theController: confirmPassword,
                              label: "Confirm password",
                              visbleText: true,
                              validator: (p0) =>
                                  confirmPasswordValidator(p0, password.text),
                            ),
                            addVerticalSpace(10),
                            LongButton(
                                theFunction: () {
                                  if (myFormKey.currentState!.validate()) {
                                    sginUpWithEmail();
                                  }
                                },
                                theText: "Sign up"),
                            addVerticalSpace(15),
                            const OrRow(),
                            addVerticalSpace(15),
                            const GoogleButton(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "already have an account?",
                                  style: customTextStyle.labelSmall,
                                ),
                                CustomTextButton(
                                  theText: "SIGN IN",
                                  theFunction: () => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      child: const LogIn(),
                                      type: PageTransitionType.bottomToTop,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

  Future sginUpWithEmail() async {
    try {
      UserCredential myUser = await authInstance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      userId = authInstance.currentUser?.uid;
      userInfo = userCollection.doc(userId);
      AuthService().saveAcount(name: name.text, id: userId, email: email.text);
      checkRole();

      if (myUser.user?.emailVerified == false) {
        await authInstance.currentUser!.sendEmailVerification();
      }

      CustomSnakBar(
          "a verification email has been sent to ${email.text}", context);
      Navigator.pushNamed(context, "infoscreen");
    } on FirebaseAuthException catch (e) {
      CustomSnakBar(e.message, context);
    }
  }
}
