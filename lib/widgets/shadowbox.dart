import 'package:flutter/material.dart';

class shadowBox extends StatelessWidget {
  double height, width;
  Widget child;
  shadowBox(
      {super.key,
      required this.child,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: const Offset(-5, -5),
                blurRadius: 12),
            BoxShadow(
                color: Colors.grey.shade700,
                offset: const Offset(5, 5),
                blurRadius: 12)
          ],
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child);
  }
}
