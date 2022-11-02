import 'dart:ui';
import 'package:fina/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                        child: Form(
                          key: myFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SGIN UP",
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
                              GradientButton(
                                  theFunction: () {
                                    if (myFormKey.currentState!.validate()) {
                                      sginUpWithEmail();
                                    }
                                  },
                                  theText: "Sgin up"),
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
                                  TextButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, "sgin in");
                                    },
                                    child: Text(
                                      "SIGN IN",
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

  Future sginUpWithEmail() async {
    try {
      UserCredential myUser = await authInstance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      AuthService().saveAcount(name: name.text, id: userId, email: email.text);

      if (myUser.user?.emailVerified == false) {
        await authInstance.currentUser!.sendEmailVerification();
      }

      CustomSnakBar(
          "a verification email has been sent to ${email.text}", context);
      Navigator.pushNamed(context, "homepage");
    } on FirebaseAuthException catch (e) {
      CustomSnakBar(e.message, context);
    }
  }
}
