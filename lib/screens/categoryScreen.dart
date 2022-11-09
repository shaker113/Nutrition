import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

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
  String sortBy = 'name';
  bool descending = false;
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
                      CustomPopUpMenu(),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: widget.theTitle,
                    style: customTextStyle.headlineLarge,
                    children: [
                      TextSpan(
                        text: " Food",
                        style: customTextStyle.titleLarge,
                      )
                    ],
                  ),
                ),
                isAdmin ?? false ? const AddButton() : const SizedBox()
              ],
            ),
          ),
          addVerticalSpace(40),
          Container(
            height: screenHeigth! - 150,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
              ),
            ),
            child: StreamBuilder(
              stream: widget.theCollectionReference
                  .orderBy(sortBy, descending: descending)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                return ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 30, top: 20, bottom: 20, right: 0),
                  itemCount: streamSnapShot.data == null
                      ? 0
                      : streamSnapShot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapShot.data!.docs[index];
                    return buildFoodItem(
                      id: documentSnapshot.id,
                      imageLink: documentSnapshot['imageLink'],
                      name: documentSnapshot['name'],
                      calories: documentSnapshot['calories'],
                      carbs: documentSnapshot['carbs'],
                      fibers: documentSnapshot['fibers'],
                      protein: documentSnapshot['protein'],
                      vitamins: documentSnapshot['vitamins'],
                      weight: documentSnapshot['weight'],
                      fat: documentSnapshot['fat'],
                      suger: documentSnapshot['suger'],
                      description: documentSnapshot['description'],
                      category: documentSnapshot['category'],
                      isHighCrbs: documentSnapshot['isHighcarbs'],
                      isHighIron: documentSnapshot['isHighIron'],
                      isHighProtein: documentSnapshot['isHighprotine'],
                      isSugerFree: documentSnapshot['isSugerFree'],
                      theCollectionReference: widget.theCollectionReference,
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

  PopupMenuButton CustomPopUpMenu() {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onSelected: (value) => onSelected(context, value),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text(
            "Sort by:",
            style: customTextStyle.displayLarge,
          ),
        ),
        const PopupMenuDivider(),
        ...MenuItems.menuItemList
            .map(
              (e) => PopupMenuItem(
                value: e,
                child: SizedBox(
                  width: 105,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(e.imagURL),
                        height: 30,
                      ),
                      addHorizantalSpace(13),
                      Text(
                        e.title,
                        style: customTextStyle.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ],
      icon: const Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
    );
  }

  void onSelected(BuildContext context, item) {
    switch (item) {
      case MenuItems.name:
        setState(() {
          sortBy = 'name';
          descending = !descending;
        });
        break;
      case MenuItems.calories:
        setState(() {
          sortBy = 'calories';
          descending = !descending;
        });
        break;
      case MenuItems.suger:
        setState(() {
          sortBy = 'suger';
          descending = !descending;
        });
        break;
      case MenuItems.protein:
        setState(() {
          sortBy = 'protein';
          descending = !descending;
        });
        break;
      case MenuItems.fibers:
        setState(() {
          sortBy = 'fibers';
          descending = !descending;
        });
        break;
      case MenuItems.carbs:
        setState(() {
          sortBy = 'carbs';
          descending = !descending;
        });
        break;
      case MenuItems.fat:
        setState(() {
          sortBy = 'fat';
          descending = !descending;
        });
        break;
    }
  }
}
