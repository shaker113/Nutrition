import 'package:flutter/material.dart';

import '../data/data.dart';

class OrRow extends StatelessWidget {
  const OrRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1.5,
          width: screenWidth! * 0.3,
          color: customGrey,
        ),
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          child: const Text(
            "OR",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        Container(
          height: 1.5,
          width: screenWidth! * 0.3,
          color: customGrey,
        ),
      ],
    );
  }
}
