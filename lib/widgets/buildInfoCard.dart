import 'package:fina/data/data.dart';
import 'package:flutter/material.dart';

class buildInfoCard extends StatelessWidget {
  String cardTiltle, info, unit, imagePath;

  buildInfoCard(
      {super.key,
      required this.cardTiltle,
      required this.imagePath,
      required this.info,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.9), width: 0.75),
      ),
      height: 100,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cardTiltle,
              style: customTextStyle.bodyMedium,
            ),
            Image(
              image: AssetImage(imagePath),
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info,
                  style: customTextStyle.bodyLarge,
                ),
                Text(
                  unit,
                  style: customTextStyle.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
