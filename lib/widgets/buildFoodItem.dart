import 'package:fina/data/data.dart';
import 'package:fina/screens/details_Page.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget buildFoodItem(
    String imgPath, String foodName, String foodCalories, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Details_Page(
              heroTag: imgPath, foodName: foodName, foodCalories: foodCalories),
        ));
      },
      child: Row(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                    tag: imgPath,
                    child: Image(
                      image: NetworkImage(imgPath),
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
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
                      style: customTextStyle.bodySmall,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    ),
  );
}
