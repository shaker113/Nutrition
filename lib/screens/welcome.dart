import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';
import 'package:lottie/lottie.dart';

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
      color: backgrounColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome \n To Nutution Application ",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Lottie.asset(dietImage),

          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "The Application will help you to make \n best diet that you want",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Text(""),
          ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "log in");
              },
              child: const Text("signUP")) // GradientButton(
          //     theFunction: () {
          //       Navigator.popAndPushNamed(
          //         context,
          //         "log in",
          //       );
          //     },
          //     theText: "log in"),
        ],
      ),
    )

        // Column(

        );
  }
}
