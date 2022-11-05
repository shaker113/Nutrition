import 'package:fina/data/colors.dart';
import 'package:fina/widgets/ListView.dart';

import 'package:flutter/material.dart';

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
        backgroundColor: backgrounColor2,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Details",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: List_View(
          heroTag: widget.heroTag,
          foodName: widget.foodName,
          foodCalories: widget.foodCalories,
        ));
  }
}
