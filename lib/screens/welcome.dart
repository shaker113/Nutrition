import 'package:fina/screens/dailyNeedCalculator.dart';
import 'package:fina/screens/sgin_up.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../data/data.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'package:lottie/lottie.dart';
import 'screens.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: screenWidth,
        height: screenHeigth,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [backgrounColor, backgrounColor2],
            center: Alignment.bottomLeft,
            radius: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome \n To Nutrition Application",
                textAlign: TextAlign.center,
                style: customTextStyle.headlineLarge),
            addVerticalSpace(10),
            Lottie.asset(dietImage, fit: BoxFit.cover, width: screenWidth),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  "The Application   hiii  will help you to make best diet that you want",
                  textAlign: TextAlign.center,
                  style: customTextStyle.headlineMedium),
            ),
            addVerticalSpace(40),
            LongButton(
                theFunction: () => Navigator.push(
                      context,
                      PageTransition(
                        child: const LogIn(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    ),
                theText: "LOG IN"),
            addVerticalSpace(10),
            CustomTextButton(
              theText: "CREATE ACCOUNT",
              theFunction: () => Navigator.push(
                context,
                PageTransition(
                  child: const SginUp(),
                  type: PageTransitionType.rightToLeft,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DailyNeedCalculator();
                    },
                  ));
                },
                icon: Icon(Icons.skip_next)),
            // IconButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(
            //         builder: (context) {
            //           return Home_Page();
            //         },
            //       ));
            //     },
            //     icon: Icon(Icons.skip_next)),
            GlassButton(
              // isSelected: true,
              theText: "Git started",
              height: 50,
              width: 222,
              theFunction: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InfoScreen(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
