import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/models/firestore_refrences.dart';
import 'package:fina/models/get_user_info.dart';
import 'package:fina/widgets/cart_calories_calculator.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // late String category, id;
  double calories = 0;
  int itemCount = 1;
  // int? myCartItems;
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backButton(context),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Daily",
                    style: customTextStyle.headlineLarge,
                    children: [
                      TextSpan(
                        text: " Food List",
                        style: customTextStyle.titleLarge,
                      )
                    ],
                  ),
                ),
                clearAll(),
              ],
            ),
          ),
          addVerticalSpace(20),
          Container(
            height: screenHeigth! - 316,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ]),
            child: StreamBuilder(
              stream: userCartCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                calories = 0;
                return ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 15, top: 20, bottom: 20, right: 5),
                  itemCount: streamSnapShot.data == null
                      ? 0
                      : streamSnapShot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapShot.data!.docs[index];
                    return CartFoodItem(
                      category: documentSnapshot['category'],
                      id: documentSnapshot['id'],
                      itemCount: documentSnapshot['itemCount'],
                    );
                  },
                );
              },
            ),
          ),
          StreamBuilder(
              stream: userCartCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                int listLength = streamSnapShot.data == null
                    ? 0
                    : streamSnapShot.data!.docs.length;
                for (int i = 0; i < listLength; i++) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapShot.data!.docs[i];
                  calories = calories +
                      documentSnapshot['calories'] *
                          documentSnapshot['itemCount'];
                }

                return cartCalculator(
                  theFoodCalories: calories,
                  theGoalCalories: userCal ?? 0,
                );
              })
        ],
      ),
    );
  }

  // checkItemsNumber() {
  //   if (myCartItems == null || myCartItems! < 1) {
  //     isEmpty = false;
  //   } else {
  //     isEmpty = true;
  //   }
  // }

  ElevatedButton clearAll() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonsColor,
        // disabledBackgroundColor: buttonsColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed:
          //  isEmpty
          //     ?
          () async {
        var snapshots = await userCartCollection.get();
        if (snapshots.docs.isEmpty) {
          setState(() {
            isEmpty = true;
          });
        } else {
          for (var doc in snapshots.docs) {
            await doc.reference.delete();
          }
        }
      },
      // : null,
      child: Text("Clear All", style: customTextStyle.labelSmall),
    );
  }
}
