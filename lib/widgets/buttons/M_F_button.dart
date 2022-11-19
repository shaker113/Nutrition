import 'dart:async';

import 'package:fina/data/colors.dart';
import 'package:flutter/material.dart';

class F_M_Button extends StatefulWidget {
  bool isSelected;
  String theText;
  Function()? theFunction;
  F_M_Button(
      {super.key,
      required this.isSelected,
      required this.theText,
      required this.theFunction});

  @override
  State<F_M_Button> createState() => _F_M_ButtonState();
}

class _F_M_ButtonState extends State<F_M_Button> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 70,
      width: 100,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.5),
              offset: const Offset(-5, -5),
              blurRadius: 12),
          BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(5, 5),
              blurRadius: 12)
        ],
        color: widget.isSelected ? buttonsColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 0),
        onPressed: widget.theFunction,
        child: Text(
          widget.theText,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: widget.isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
