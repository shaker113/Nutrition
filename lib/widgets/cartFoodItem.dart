import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/screens/screens.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/models.dart';
import 'widgets.dart';

class CartFoodItem extends StatefulWidget {
  String id, category;
  int itemCount;
  CartFoodItem({
    super.key,
    required this.category,
    required this.itemCount,
    required this.id,
  });

  @override
  State<CartFoodItem> createState() => _CartFoodItemState();
}

class _CartFoodItemState extends State<CartFoodItem> {
  @override
  void initState() {
    getItemData();
    super.initState();
  }

  late String name = "", description, vitamins;
  late double calories = 0, carbs, fibers, protein, weight, fat, suger;
  String? imageLink;
  bool isZero = false;

  @override
  Widget build(BuildContext context) {
    widget.itemCount == 0 ? isZero = true : isZero = false;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details_Page(
              isInCart: true,
              heroTag: imageLink != null ? imageLink! : loadingIcon,
              name: name,
              calories: calories,
              carbs: carbs,
              fibers: fibers,
              protein: protein,
              vitamins: vitamins,
              weight: weight,
              fat: fat,
              suger: suger,
              description: description,
              id: widget.id,
              itemCount: widget.itemCount,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: imageLink != null ? imageLink! : loadingIcon,
                  child: CircleAvatar(
                    foregroundImage: imageLink != null
                        ? CachedNetworkImageProvider(imageLink!)
                        : null,
                    backgroundImage: const AssetImage(
                      loadingIcon,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                ),
                addHorizantalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: customTextStyle.bodySmall,
                      ),
                    ),
                    Text(
                      "${(calories * widget.itemCount).toStringAsFixed(1)} Cal",
                      style: customTextStyle.displaySmall,
                    )
                  ],
                ),
              ],
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
                          : widget.itemCount > 0
                              ? changeItemCount(false)
                              : null;
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
                    style: const TextStyle(fontSize: 15, color: Colors.white),
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
            ),
          ],
        ),
      ),
    );
  }

  Future deleteFromCart() async {
    QuerySnapshot mydoc =
        await userCartCollection.where('id', isEqualTo: widget.id).get();
    String itemId = mydoc.docs[0].id;

    setState(() {
      userCartCollection.doc(itemId).delete();
    });
  }

  Future changeItemCount(bool theSign) async {
    QuerySnapshot mydoc =
        await userCartCollection.where('id', isEqualTo: widget.id).get();
    int savedItemCount = mydoc.docs[0]['itemCount'];
    String itemId = mydoc.docs[0].id;

    theSign
        ? userCartCollection
            .doc(itemId)
            .update({'itemCount': savedItemCount + 1})
        : userCartCollection
            .doc(itemId)
            .update({'itemCount': savedItemCount - 1});
  }

  Future getItemData() async {
    CollectionReference? theCollectionReference;

    if (widget.category == "Meat") {
      theCollectionReference = meatCollection;
    } else if (widget.category == "Fruits") {
      theCollectionReference = fruitsCollecton;
    } else if (widget.category == "Vegetables") {
      theCollectionReference = vegetablesCollection;
    } else if (widget.category == "Dairy") {
      theCollectionReference = dairyCollection;
    } else if (widget.category == "junk Food") {
      theCollectionReference = junkFoodCollection;
    } else if (widget.category == "White meat") {
      theCollectionReference = whiteMeatCollection;
    } else if (widget.category == "Drinks") {
      theCollectionReference = drinksCollection;
    } else if (widget.category == "Sweets") {
      theCollectionReference = sweetCollection;
    }
    DocumentSnapshot mydoc = await theCollectionReference!.doc(widget.id).get();
    setState(() {
      name = mydoc['name'];
      imageLink = mydoc['imageLink'];
      calories = mydoc['calories'];
      carbs = mydoc['carbs'];
      fibers = mydoc['fibers'];
      protein = mydoc['protein'];
      vitamins = mydoc['vitamins'];
      weight = mydoc['weight'];
      fat = mydoc['fat'];
      suger = mydoc['suger'];
      description = mydoc['description'];
    });
  }
}
