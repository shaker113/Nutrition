import 'package:fina/data/data.dart';
import 'package:fina/screens/details_Page.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';

import 'buildInfoCard.dart';

class List_View extends StatefulWidget {
  // const List_View({super.key});
  final heroTag;
  final foodName;
  final foodCalories;
  List_View({
    required this.heroTag,
    required this.foodName,
    required this.foodCalories,
  });
  @override
  State<List_View> createState() => _List_ViewState();
}

class _List_ViewState extends State<List_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeigth! - 82,
                width: screenWidth!,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                      color: Colors.white),
                  height: screenHeigth! - 100,
                  width: screenWidth!,
                ),
              ),
              Positioned(
                top: 30,
                left: screenWidth! / 2 - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.heroTag),
                            fit: BoxFit.cover)),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                  top: 250,
                  left: 25,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.foodName,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.foodCalories,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 199, 68, 68)),
                          ),
                          Container(
                            height: 25,
                            color: Colors.grey,
                            width: 1,
                          ),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: Color(0xFF7A9BEE)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color(0xFF7A9BEE)),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.white),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFF7A9BEE),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      addVerticalSpace(20),
                      Container(
                        height: 175,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildInfoCard('WEIGHT', '300', 'G'),
                            addHorizantalSpace(15),
                            buildInfoCard('CALORIES', '344', "CAL"),
                            addHorizantalSpace(15),
                            buildInfoCard('VITAMINS', 'A, B6', "VIT"),
                            addHorizantalSpace(15),
                            buildInfoCard('AVAIL', 'NO', "AV"),
                          ],
                        ),
                      ),
                      addVerticalSpace(75),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                              color: Colors.black),
                          height: 50,
                          child: Center(
                            child: Text(
                              "data",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
