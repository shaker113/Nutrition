import 'package:fina/data/colors.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class Details_Page extends StatefulWidget {
  final String heroTag,
      name,
      calories,
      caloriesUnit,
      protein,
      proteinUnit,
      carbs,
      carbsUnit,
      fibers,
      fibersUnit,
      weight,
      weightUnit,
      vitamins,
      vitaminsUnit,
      suger,
      sugerUnit,
      fat,
      fatUnit,
      description;

  const Details_Page(
      {super.key,
      required this.heroTag,
      required this.name,
      required this.calories,
      required this.caloriesUnit,
      required this.carbs,
      required this.carbsUnit,
      required this.fibers,
      required this.fibersUnit,
      required this.protein,
      required this.proteinUnit,
      required this.vitamins,
      required this.vitaminsUnit,
      required this.weight,
      required this.weightUnit,
      required this.fat,
      required this.fatUnit,
      required this.suger,
      required this.sugerUnit,
      required this.description});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  int itemCount = 1;
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
                            Text(
                              widget.caloriesUnit,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
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
                              color: backgrounColor2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (itemCount > 1) {
                                      itemCount--;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: backgrounColor2),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "$itemCount",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    itemCount++;
                                  });
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
                              unit: widget.weightUnit,
                              imagePath: weightIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'VITAMINS',
                              info: widget.vitamins,
                              unit: widget.vitaminsUnit,
                              imagePath: vitaminsIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'PROTEIN',
                              info:
                                  "${double.parse(widget.protein) * itemCount}",
                              unit: widget.proteinUnit,
                              imagePath: proteinIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'FIBERS',
                              info:
                                  "${double.parse(widget.fibers) * itemCount}",
                              unit: widget.fibersUnit,
                              imagePath: fibersIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'CARBS',
                              info: "${double.parse(widget.carbs) * itemCount}",
                              unit: widget.carbsUnit,
                              imagePath: carbsIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'FATS',
                              info: "${double.parse(widget.fat) * itemCount}",
                              unit: widget.fatUnit,
                              imagePath: fatsIcon),
                          addHorizantalSpace(15),
                          buildInfoCard(
                              cardTiltle: 'SUGER',
                              info: "${double.parse(widget.suger) * itemCount}",
                              unit: widget.sugerUnit,
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
}
