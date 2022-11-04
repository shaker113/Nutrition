import 'package:fina/data/data.dart';
import 'package:fina/widgets/ListView.dart';
import 'package:fina/widgets/buildFoodItem.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../widgets/buildInfoCard.dart';

class Details_Page extends StatefulWidget {
  // const Details_Page({super.key});
  final heroTag;
  final foodName;
  final foodCalories;
  Details_Page({
    required this.heroTag,
    required this.foodName,
    required this.foodCalories,
  });

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  var selectedCard = 'WEIGHT';
  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Details",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ))
          ],
        ),
        body: List_View(
          heroTag: widget.heroTag,
          foodName: widget.foodName,
          foodCalories: widget.foodCalories,
        ));
  }
}

void selectCard(String cardTiltle) {}
