import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/widgets/buttons/add_Item_button.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/buildFoodItem.dart';

class Category_Page extends StatefulWidget {
  CollectionReference theCollectionReference;
  String theTitle;
  Category_Page(
      {super.key,
      required this.theTitle,
      required this.theCollectionReference});

  @override
  State<Category_Page> createState() => _Category_PageState();
}

class _Category_PageState extends State<Category_Page> {
  @override
  void initState() {
    checkRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
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
                    text: widget.theTitle, //should be a variable
                    style: customTextStyle.headlineLarge,
                    children: [
                      TextSpan(
                        text: " Food",
                        style: customTextStyle.titleLarge,
                      )
                    ],
                  ),
                ), //healthyCategoryCollection shoull be a variable
                isAdmin ?? false
                    ? AddButton(
                        theCollectionReference: widget.theCollectionReference,
                      )
                    : const SizedBox()
              ],
            ),
          ),
          addVerticalSpace(40),
          Container(
            height: screenHeigth! - 150,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: StreamBuilder(
              stream: widget.theCollectionReference.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                return ListView.builder(
                  padding: const EdgeInsets.only(left: 25, top: 45, right: 0),
                  itemCount: streamSnapShot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapShot.data!.docs[index];
                    return buildFoodItem(
                      id: documentSnapshot.id,
                      imageLink: documentSnapshot['imageLink'],
                      name: documentSnapshot['name'],
                      calories: documentSnapshot['calories'],
                      caloriesUnit: documentSnapshot['caloriesUnit'],
                      carbs: documentSnapshot['carbs'],
                      carbsUnit: documentSnapshot['carbsUnit'],
                      fibers: documentSnapshot['fibers'],
                      fibersUnit: documentSnapshot['fibersUnit'],
                      protein: documentSnapshot['protein'],
                      proteinUnit: documentSnapshot['proteinUnit'],
                      vitamins: documentSnapshot['vitamins'],
                      vitaminsUnit: documentSnapshot['vitaminsUnit'],
                      weight: documentSnapshot['weight'],
                      weightUnit: documentSnapshot['weightUnit'],
                      fat: documentSnapshot['fat'],
                      fatUnit: documentSnapshot['fatUnit'],
                      suger: documentSnapshot['suger'],
                      sugerUnit: documentSnapshot['sugerUnit'],
                      description: documentSnapshot['description'],
                      category: documentSnapshot['category'],
                      isHighCrbs: documentSnapshot['isHighcarbs'],
                      isHighIron: documentSnapshot['isHighIron'],
                      isHighProtein: documentSnapshot['isHighprotine'],
                      isSugerFree: documentSnapshot['isSugerFree'],
                      theCollectionReference: healthyCategoryCollection,
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}