import 'package:flutter/material.dart';

import '../../data/data.dart';

class CustomTextButton extends StatelessWidget {
  String theText;
  final Function() theFunction;

  CustomTextButton({Key? key, required this.theFunction, required this.theText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: theFunction,
      child: Text(
        theText,
        style: TextStyle(
            color: buttonsColor, fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}
