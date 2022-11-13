import 'package:flutter/material.dart';
import 'package:fina/data/data.dart';

class LongButton extends StatelessWidget {
  final String theText;
  final Function() theFunction;
  const LongButton(
      {super.key, required this.theFunction, required this.theText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(screenHeigth! * 0.8, 50),
        backgroundColor: buttonsColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: theFunction,
      child: Text(
        theText,
        style: customTextStyle.labelMedium,
      ),
    );
  }
}
