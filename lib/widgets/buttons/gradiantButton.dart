import 'package:flutter/material.dart';
import 'package:fina/data/data.dart';

class GradientButton extends StatelessWidget {
  final String theText;
  final Function() theFunction;
  const GradientButton(
      {super.key, required this.theFunction, required this.theText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: screenWidth * 0.8,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        // border: Border.all(
        //   color: backgrounColor2.withOpacity(0.1),
        // ),
        gradient: RadialGradient(
          radius: 4,
          center: Alignment.center,
          colors: [buttonsColor, backgrounColor],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(screenWidth * 0.8, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        ),
        onPressed: theFunction,
        child: Text(
          theText,
          style: customTextStyle.labelMedium,
        ),
      ),
    );
  }
}
