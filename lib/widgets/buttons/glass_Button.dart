import 'dart:ui';

import 'package:fina/data/data.dart';
import 'package:flutter/material.dart';

class GlassButton extends StatefulWidget {
  final String theText;
  final double height, width;
  final Function() theFunction;
  bool? isSelected;
  GlassButton(
      {super.key,
      required this.theText,
      required this.height,
      required this.width,
      required this.theFunction,
      this.isSelected});

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) => setState(() => isPressed = true),
      onTapDown: (details) => setState(() => isPressed = false),
      onTap: widget.theFunction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            alignment: Alignment.center,
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: -5,
                    blurRadius: 25),
              ],
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(isPressed ? 0.15 : 0.4),
                  Colors.white.withOpacity(isPressed ? 0.05 : 0.1),
                  backgrounColor.withOpacity(isPressed ? 0 : 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: widget.isSelected ?? false ? 2 : 1.5,
                color: widget.isSelected ?? false
                    ? backgrounColor
                    : backgrounColor.withOpacity(isPressed ? 0.5 : 0.7),
              ),
            ),
            child: Text(
              widget.theText,
              style: customTextStyle.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
