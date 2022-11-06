import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/screens/details_Page.dart';
import 'package:fina/widgets/buttons/edit_item_button.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../models/models.dart';

class buildFoodItem extends StatelessWidget {
  String imageLink,
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
      id,
      category;
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Details_Page(
              heroTag: imageLink,
              name: name,
              calories: calories,
              carbs: carbs,
              description: description,
              fibers: fibers,
              protein: protein,
              vitamins: vitamins,
              weight: weight,
              fat: fat,
              suger: suger,
            ),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                    tag: imageLink,
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(imageLink),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      radius: 40,
                    )),
                addHorizantalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: customTextStyle.bodySmall,
                    ),
                    Text(
                      "$calories Cal",
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
                                  calories: calories,
                                  imageLink: imageLink,
                                  name: name,
                                  carbs: carbs,
                                  fibers: fibers,
                                  protein: protein,
                                  vitamins: vitamins,
                                  weight: weight,
                                  fat: fat,
                                  suger: suger,
                                  description: description,
                                  id: id,
                                  isHighCrbs: isHighCrbs,
                                  isHighIron: isHighIron,
                                  isHighProtein: isHighProtein,
                                  isSugerFree: isSugerFree,
                                  category: category,
                                  theCollectionReference:
                                      theCollectionReference),
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
