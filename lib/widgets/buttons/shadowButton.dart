import 'package:flutter/material.dart';

import '../../data/data.dart';

class ShadowButoon extends StatelessWidget {
  Function()? theFunction;
  Function(LongPressStartDetails)? onlongpress;
  Function(LongPressEndDetails)? onlongpressends;
  // void Function()? onCancel;
  String theText;
  ShadowButoon(
      {super.key,
      required this.theFunction,
      required this.theText,
      // this.onCancel,
      this.onlongpress,
      this.onlongpressends});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: onlongpress,
      onLongPressEnd: onlongpressends,
      child: ElevatedButton(
        onPressed: theFunction,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(18, 18),
          backgroundColor: backgrounColor2,
          elevation: 5,
          shape: const CircleBorder(),
        ),
        child: Text(
          theText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
