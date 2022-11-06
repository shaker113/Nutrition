import 'package:fina/data/colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWieght;

  TextWidget(
      {Key? key,
      required this.text,
      required this.fontsize,
      required this.fontWieght})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWieght,
        color: customRed,
        fontSize: fontsize,
      ),
    );
  }
}
