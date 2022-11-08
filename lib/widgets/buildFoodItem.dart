import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/screens/details_Page.dart';
import 'package:fina/widgets/buttons/edit_item_button.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../models/models.dart';

class buildFoodItem extends StatefulWidget {
  String imageLink, name, vitamins, description, id, category;
  double calories, protein, carbs, fibers, weight, suger, fat;
  bool isSugerFree, isHighProtein, isHighIron, isHighCrbs;
  CollectionReference theCollectionReference;

  buildFoodItem(
      {super.key,
      required this.calories,
      required this.imageLink,
      required this.name,
      required this.carbs,
      required this.fibers,
      required this.protein,
      required this.vitamins,
      required this.fat,
      required this.suger,
      required this.weight,
      required this.description,
      required this.id,
      required this.category,
      required this.isHighCrbs,
      required this.isHighIron,
      required this.isHighProtein,
      required this.isSugerFree,
      required this.theCollectionReference});

  @override
  State<buildFoodItem> createState() => _buildFoodItemState();
}

class _buildFoodItemState extends State<buildFoodItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isAdd = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Details_Page(
              isInCart: false,
              id: widget.id,
              itemCount: 1,
              heroTag: widget.imageLink,
              name: widget.name,
              calories: widget.calories,
              carbs: widget.carbs,
              description: widget.description,
              fibers: widget.fibers,
              protein: widget.protein,
              vitamins: widget.vitamins,
              weight: widget.weight,
              fat: widget.fat,
              suger: widget.suger,
            ),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                    tag: widget.imageLink,
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(widget.imageLink),
                      backgroundImage: const NetworkImage(
                        "https://cdn.dribbble.com/users/3337757/screenshots/6825268/076_-loading_animated_dribbble_copy.gif",
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      radius: 40,
                    )),
                addHorizantalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: customTextStyle.bodySmall,
                    ),
                    Text(
                      "${widget.calories} Cal",
                      style: customTextStyle.displaySmall,
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                isAdmin ?? false
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: editItemButtonFunction(
                                  calories: widget.calories,
                                  imageLink: widget.imageLink,
                                  name: widget.name,
                                  carbs: widget.carbs,
                                  fibers: widget.fibers,
                                  protein: widget.protein,
                                  vitamins: widget.vitamins,
                                  weight: widget.weight,
                                  fat: widget.fat,
                                  suger: widget.suger,
                                  description: widget.description,
                                  id: widget.id,
                                  isHighCrbs: widget.isHighCrbs,
                                  isHighIron: widget.isHighIron,
                                  isHighProtein: widget.isHighProtein,
                                  isSugerFree: widget.isSugerFree,
                                  category: widget.category,
                                  theCollectionReference:
                                      widget.theCollectionReference),
                              type: PageTransitionType.bottomToTop,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      )
                    : const SizedBox(),
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    if (isAdd) {
                      isAdd = !isAdd;

                      try {
                        saveItemt();
                        controller.forward().then((value) async {
                          await Future.delayed(Duration(microseconds: 333));
                          controller.reverse();
                          isAdd = !isAdd;
                        });
                      } on Exception catch (e) {
                        print("======================");
                        print(e);
                      }
                    }
                  },
                  icon: AnimatedIcon(
                    progress: controller,

                    icon: AnimatedIcons.add_event,
                    // Icons.add_shopping_cart_outlined,
                    color: Colors.black,
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future saveItemt() async {
    QuerySnapshot mydoc =
        await userCartCollection.where('id', isEqualTo: widget.id).get();

    if (mydoc.docs.isEmpty) {
      final json = {
        'category': widget.category,
        'id': widget.id,
        'itemId': '',
        'itemCount': 1,
      }; //to Create doucuman
      await userCartCollection.add(json);
    } else {
      userCartCollection
          .doc(mydoc.docs[0].id)
          .update({'itemCount': mydoc.docs[0]['itemCount'] + 1});
    }
  }
}
