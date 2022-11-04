import 'package:flutter/material.dart';

bool selectedCard = true;

Widget buildInfoCard(
    String cardTiltle, String info, String unit, IconData iconData) {
  return InkWell(
    onTap: () {
      selectedCard;
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedCard ? Color(0xFFA9BEE) : Colors.white,
          border: Border.all(
              color: selectedCard
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.9),
              width: 0.75)),
      height: 100,
      width: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cardTiltle,
                style: TextStyle(
                    fontSize: 12,
                    color: selectedCard ? Colors.white : Colors.black),
              ),
              Icon(iconData),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  info,
                  style: TextStyle(
                      fontSize: 14,
                      color: cardTiltle == selectedCard
                          ? Colors.white
                          : Colors.black),
                ),
                Text(
                  unit,
                  style: TextStyle(
                      fontSize: 12,
                      color: cardTiltle == selectedCard
                          ? Colors.white
                          : Colors.black),
                )
              ])
            ]),
      ),
    ),
  );
}
