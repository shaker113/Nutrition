import 'package:fina/data/colors.dart';
import 'package:fina/data/data.dart';
import 'package:flutter/material.dart';

class buildInfoCard extends StatefulWidget {
  String cardTiltle, info, unit, imagePath;

  buildInfoCard(
      {super.key,
      required this.cardTiltle,
      required this.imagePath,
      required this.info,
      required this.unit});

  @override
  State<buildInfoCard> createState() => _buildInfoCardState();
}

class _buildInfoCardState extends State<buildInfoCard> {
  bool selectedCard = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedCard = !selectedCard;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedCard ? backgrounColor.withOpacity(0.4) : Colors.white,
          border: Border.all(
              color: selectedCard
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.9),
              width: 0.75),
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
                widget.cardTiltle,
                style: customTextStyle.bodyMedium,
              ),
              Image(
                image: AssetImage(widget.imagePath),
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.info,
                    style: customTextStyle.bodyLarge,
                  ),
                  Text(
                    widget.unit,
                    style: customTextStyle.bodyMedium,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
