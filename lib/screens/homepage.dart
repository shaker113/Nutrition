import 'package:fina/data/data.dart';
import 'package:fina/widgets/buttons/add_Item_button.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/buildFoodItem.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    checkRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              Container(
                width: 125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: "Healthy ", //should be a variable
                  style: customTextStyle.headlineLarge,
                  children: [
                    TextSpan(
                      text: "Food",
                      style: customTextStyle.titleLarge,
                    )
                  ],
                ),
              ), //healthyCategoryCollection shoull be a variable
              AddButton(
                theCollectionReference: healthyCategoryCollection,
              )
            ],
          ),
        ),
        addVerticalSpace(40),
        Container(
          height: screenHeigth! - 150,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
          child: ListView(
            primary: false,
            padding: const EdgeInsets.only(left: 25, top: 45, right: 0),
            children: [
              buildFoodItem(
                  "https://therecipecritic.com/wp-content/uploads/2022/06/sushibowls.jpg",
                  "Salmon bowl   ",
                  "208 calories",
                  context),
              buildFoodItem(
                  "https://cozypeachkitchen.com/wp-content/uploads/2021/05/tofu-spring-roll-bowls-21-e1649259055709.jpg",
                  "Spring bowl     ",
                  "440 calories",
                  context),
              buildFoodItem(
                  "https://cookieandkate.com/images/2017/10/best-buddha-bowl-recipe-4.jpg",
                  "Avocado bowl ",
                  "160 calories",
                  context),
              buildFoodItem(
                  "https://www.livingwellwithnic.com/wp-content/uploads/2017/04/Berry-Acai-Bowl.jpg",
                  "Berry bowl       ",
                  "347 calories",
                  context),
              buildFoodItem(
                  "https://izzycooking.com/wp-content/uploads/2022/05/Grilled-Beef-Steak-thumbnail.jpg",
                  "Beaf bowl         ",
                  "407 calories",
                  context),
              buildFoodItem(
                  "https://images.themodernproper.com/billowy-turkey/production/posts/2022/Round-UP-1.jpeg?w=1280&auto=compress%2Cformat&fit=crop&dm=1651184525&s=64d1eb50521f3482d57f6284eeab8043",
                  "Chicken Breast",
                  "344 calories",
                  context),
              buildFoodItem(
                  "https://w7.pngwing.com/pngs/166/140/png-transparent-greek-salad-caesar-salad-chicken-salad-greek-cuisine-spinach-salad-greek-salad-leaf-vegetable-food-recipe-thumbnail.png",
                  "Greek Salad     ",
                  "211 calories",
                  context)
            ],
          ),
        )
      ]),
    );
  }
}
