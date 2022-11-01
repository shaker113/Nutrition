import 'package:flutter/material.dart';
import 'package:fina/data/data.dart';

class GradientButton extends StatelessWidget {
  final String theText;
  final Function() theFunction;
  const GradientButton(
      {super.key, required this.theFunction, required this.theText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: theFunction,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          gradient: RadialGradient(
            radius: 6,
            center: Alignment.center,
            colors: [buttonsColor, backgrounColor2.withOpacity(0.4)],
          ),
        ),
        child: Text(
          theText,
          style: customTextStyle.labelMedium,
        ),
      ),
    );
  }
}
