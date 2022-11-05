import 'package:fina/data/data.dart';
import 'package:fina/screens/details_Page.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

Widget buildFoodItem(
    String imgPath, String foodName, String foodCalories, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Details_Page(
            heroTag: imgPath,
            foodName: foodName,
            foodCalories: foodCalories,
          ),
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
              tag: imgPath,
              child: CircleAvatar(
                foregroundImage: NetworkImage(imgPath),
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,
                radius: 40,
              )),
          addHorizantalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style: customTextStyle.bodySmall,
              ),
              Text(
                foodCalories,
                style: customTextStyle.displaySmall,
              )
            ],
          ),
          addHorizantalSpace(
              isAdmin ?? false ? screenWidth! * 0.1 : screenWidth! * 0.2),
          isAdmin ?? false
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                )
              : const SizedBox(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
