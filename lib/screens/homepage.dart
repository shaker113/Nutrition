import 'package:fina/data/data.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../widgets/buildFoodItem.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21BFBD),
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
                ),
              ),
              SizedBox(
                width: 125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              const Text(
                "Healthy",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              addHorizantalSpace(10),
              const Text(
                "Food",
                style: TextStyle(fontSize: 25, color: Colors.white),
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
            padding: const EdgeInsets.only(left: 25, right: 20),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: SizedBox(
                  height: screenHeigth! - 300,
                  child: ListView(children: [
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
                        context),
                  ]),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
