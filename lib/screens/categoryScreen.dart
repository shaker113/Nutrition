import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/widgets/textFieldCalc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

class _Category_PageState extends State<Category_Page>
    with SingleTickerProviderStateMixin {
  late AnimationController sortController;
  @override
  void initState() {
    super.initState();
    sortController = AnimationController(
      value: 0.16,
      vsync: this,
      duration: const Duration(microseconds: 300),
    );
  }

  TextEditingController searchController = TextEditingController();
  // Color g = const Color.fromARGB(255, 33, 191, 189);
  bool v = false;
  @override
  void dispose() {
    sortController.dispose();
    super.dispose();
  }

  String searchText = '';
  String sortBy = 'name';
  bool descending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(context),
                  SizedBox(
                    height: 35,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              v = !v;
                            });
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 80,
                          child: v
                              ? TextField(
                                  autofocus: true,
                                  controller: searchController,
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      searchText = value.toCapitalized();
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white70))),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 185,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addHorizantalSpace(50),
                        CustomPopUpMenu(),
                        sortButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: widget.theTitle,
                      style: customTextStyle.headlineLarge,
                      children: [
                        TextSpan(
                          text: " ",
                          style: customTextStyle.titleLarge,
                        )
                      ],
                    ),
                  ),
                  isAdmin ?? false ? const AddButton() : const SizedBox()
                ],
              ),
            ),

            addVerticalSpace(25),
            Container(
              height: screenHeigth! - 138,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                ),
              ),
              child: StreamBuilder(
                stream: searchText.isNotEmpty
                    ? widget.theCollectionReference
                        .orderBy('name', descending: false)
                        .startAt([searchText]).endAt(['$searchText\uf8ff'])
                        // .orderBy(sortBy, descending: false)
                        .snapshots()
                    : widget.theCollectionReference
                        .orderBy(sortBy, descending: descending)
                        .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                  return ListView.builder(
                    shrinkWrap: true,
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
      ),
    );
  }

  GestureDetector sortButton() {
    return GestureDetector(
      onTap: () async {
        setState(() {
          descending
              ? sortController.forward(from: 0.1).timeout(
                    const Duration(milliseconds: 1900),
                    onTimeout: () => sortController.stop(),
                  )
              : sortController.forward(from: 0.7);

          descending = !descending;
        });
      },
      child: SizedBox(
        height: 50,
        child: Lottie.asset(
          sortIcon,
          repeat: true,
          controller: sortController,
          onLoaded: (composition) {
            sortController.duration = composition.duration;
          },
        ),
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
                  width: 107,
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
          descending = false;
        });
        break;
      case MenuItems.calories:
        setState(() {
          sortBy = 'calories';
          descending = true;
        });
        break;
      case MenuItems.suger:
        setState(() {
          sortBy = 'suger';
          descending = true;
        });
        break;
      case MenuItems.protein:
        setState(() {
          sortBy = 'protein';
          descending = true;
        });
        break;
      case MenuItems.fibers:
        setState(() {
          sortBy = 'fibers';
          descending = true;
        });
        break;
      case MenuItems.carbs:
        setState(() {
          sortBy = 'carbs';
          descending = true;
        });
        break;
      case MenuItems.fat:
        setState(() {
          sortBy = 'fat';
          descending = true;
        });
        break;
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
