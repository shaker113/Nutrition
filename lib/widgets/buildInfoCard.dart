import 'package:flutter/material.dart';

var selectedCard = '';

Widget buildInfoCard(String cardTiltle, String info, String unit) {
  return InkWell(
    onTap: () {
      selectedCard;
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTiltle == selectedCard ? Color(0xFFA9BEE) : Colors.white,
          border: Border.all(
              color: cardTiltle == selectedCard
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
              width: 0.75)),
      height: 100,
      width: 100,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, left: 15),
              child: Text(
                cardTiltle,
                style: TextStyle(
                    fontSize: 12,
                    color: cardTiltle == selectedCard
                        ? Colors.white
                        : Colors.grey.withOpacity(0.7)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ]),
            )
          ]),
    ),
  );
}
