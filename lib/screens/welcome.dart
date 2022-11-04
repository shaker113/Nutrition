import 'package:fina/screens/homepage.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeigth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backGroundImage), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to this app",
              style: customTextStyle.labelMedium,
            ),
            Text("Sign in to continue", style: customTextStyle.labelMedium),
            GradientButton(
                theFunction: () {
                  Navigator.popAndPushNamed(
                    context,
                    "log in",
                  );
                },
                theText: "log in"),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Home_Page();
                    },
                  ));
                },
                icon: Icon(Icons.skip_next))
          ],
        ),
      ),
    );
  }
}
