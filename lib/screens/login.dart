import 'dart:ui';

import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> myFormKey = GlobalKey();

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
                  height: 407,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.13)),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.15),
                                Colors.black.withOpacity(0.05),
                              ]),
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
                              Text(
                                "LOGIN",
                                style: customTextStyle.labelMedium,
                              ),
                              addVerticalSpace(5),
                              CustomTextfield(
                                theController: email,
                                validator: (p0) {},
                                label: "Email",
                                inputType: TextInputType.emailAddress,
                              ),
                              addVerticalSpace(10),
                              CustomTextfield(
                                theController: password,
                                validator: (p0) {},
                                label: "Password",
                                visbleText: true,
                              ),
                              addVerticalSpace(10),
                              GradientButton(
                                  theFunction: () {}, theText: "Login"),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget password?",
                                  textAlign: TextAlign.end,
                                  style: customTextStyle.labelSmall,
                                ),
                              ),
                              addVerticalSpace(15),
                              const OrRow(),
                              addVerticalSpace(15),
                              const sginInWithGoogle(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "dont have an account?",
                                    style: customTextStyle.labelSmall,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                        color: Colors.white,
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
}

class sginInWithGoogle extends StatelessWidget {
  const sginInWithGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: customBlue, width: 2),
      ),
      child: const Image(
        image: AssetImage(
          googleImage,
        ),
        height: 35,
      ),
    );
  }
}

class OrRow extends StatelessWidget {
  const OrRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1.5,
          width: screenWidth! * 0.33,
          color: Colors.grey,
        ),
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.4))),
          child: const Text(
            "OR",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        Container(
          height: 1.5,
          width: screenWidth! * 0.33,
          color: Colors.grey,
        ),
      ],
    );
  }
}
