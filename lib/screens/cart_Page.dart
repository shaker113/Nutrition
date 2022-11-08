import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/models/firestore_refrences.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                    text: "Cart",
                    style: customTextStyle.headlineLarge,
                    children: [
                      TextSpan(
                        text: " Food",
                        style: customTextStyle.titleLarge,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(40),
          Container(
              height: screenHeigth! - 140,
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
              ),
              child: StreamBuilder(
                stream: userCartCollection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> streamSnapShot) {
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
                        itemId: documentSnapshot['itemId'],
                        category: documentSnapshot['category'],
                        id: documentSnapshot['id'],
                        itemCount: documentSnapshot['itemCount'],
                      );
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
