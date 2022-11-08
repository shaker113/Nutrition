import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/colors.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class Details_Page extends StatefulWidget {
  final String heroTag,
      name,
      calories,
      protein,
      carbs,
      fibers,
      weight,
      vitamins,
      suger,
      fat,
      description,
      id;
  int itemCount;

  Details_Page(
      {super.key,
      required this.heroTag,
      required this.name,
      required this.calories,
      required this.carbs,
      required this.fibers,
      required this.protein,
      required this.vitamins,
      required this.weight,
      required this.fat,
      required this.suger,
      required this.id,
      required this.itemCount,
      required this.description});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  bool isZero = false;

  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    widget.itemCount == 0 ? isZero = true : isZero = false;
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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: screenHeigth! - 82,
                width: screenWidth!,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75,
                child: Container(
                  decoration: const BoxDecoration(
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
                        shape: BoxShape.circle,
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
                      widget.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    addVerticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${double.parse(widget.calories) * itemCount} ",
                              style: TextStyle(fontSize: 20, color: customRed),
                            ),
                            const Text(
                              "Cal",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          height: 25,
                          color: Colors.grey,
                          width: 1,
                        ),
                        Container(
                          width: 105,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: backgrounColor2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  isZero
                                      ? deleteFromCart()
                                      : changeItemCount(false);
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: backgrounColor2),
                                  child: Center(
                                    child: Icon(
                                      isZero ? Icons.delete : Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "${widget.itemCount}",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  changeItemCount(true);
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: backgrounColor2,
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
                    SizedBox(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildInfoCard(
                              cardTiltle: 'WEIGHT',
                              info:
                                  "${double.parse(widget.weight) * itemCount}",
                              unit: "g",
                              imagePath: weightIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'VITAMINS',
                              info: widget.vitamins,
                              unit: "",
                              imagePath: vitaminsIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'PROTEIN',
                              info: (double.parse(widget.protein) * itemCount)
                                  .toStringAsFixed(1),
                              unit: "g",
                              imagePath: proteinIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'FIBERS',
                              info: (double.parse(widget.fibers) * itemCount)
                                  .toStringAsFixed(1),
                              unit: "g",
                              imagePath: fibersIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'CARBS',
                              info: (double.parse(widget.carbs) * itemCount)
                                  .toStringAsFixed(1),
                              unit: "g",
                              imagePath: carbsIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'FATS',
                              info: (double.parse(widget.fat) * itemCount)
                                  .toStringAsFixed(1),
                              unit: "g",
                              imagePath: fatsIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'SUGER',
                              info: (double.parse(widget.suger) * itemCount)
                                  .toStringAsFixed(1),
                              unit: "g",
                              imagePath: sugarIcon),
                        ],
                      ),
                    ),
                    addVerticalSpace(75),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          ShowDescription(context, widget.description);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                              color: Colors.black),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "DESCRIPTION",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> ShowDescription(BuildContext contextM, String description) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgrounColor2,
          content: SizedBox(
            height: screenHeigth! * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backButton(context),
                SizedBox(
                  height: screenHeigth! * 0.29,
                  child: SingleChildScrollView(
                    child: Text(
                      description,
                      textAlign: TextAlign.start,
                      style: customTextStyle.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future deleteFromCart() async {
    QuerySnapshot mydoc =
        await userCartCollection.where('id', isEqualTo: widget.id).get();
    String itemId = mydoc.docs[0].id;
    print(itemId);

    userCartCollection.doc(itemId).delete();
    Navigator.pop(context);
  }

  Future changeItemCount(bool theSign) async {
    QuerySnapshot mydoc =
        await userCartCollection.where('id', isEqualTo: widget.id).get();
    int savedItemCount = mydoc.docs[0]['itemCount'];
    String itemId = mydoc.docs[0].id;
    setState(() {
      if (theSign) {
        userCartCollection
            .doc(itemId)
            .update({'itemCount': savedItemCount + 1});
        widget.itemCount++;
      } else {
        userCartCollection
            .doc(itemId)
            .update({'itemCount': savedItemCount - 1});
        widget.itemCount--;
      }
    });

    print(itemId);
  }
}
