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
      required this.caloriesUnit,
      required this.carbs,
      required this.carbsUnit,
      required this.fibers,
      required this.fibersUnit,
      required this.protein,
      required this.proteinUnit,
      required this.vitamins,
      required this.vitaminsUnit,
      required this.fat,
      required this.fatUnit,
      required this.suger,
      required this.sugerUnit,
      required this.weight,
      required this.weightUnit,
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
              caloriesUnit: caloriesUnit,
              carbs: carbs,
              carbsUnit: carbsUnit,
              description: description,
              fibers: fibers,
              fibersUnit: fibersUnit,
              protein: protein,
              proteinUnit: proteinUnit,
              vitamins: vitamins,
              vitaminsUnit: vitaminsUnit,
              weight: weight,
              weightUnit: weightUnit,
              fat: fat,
              fatUnit: fatUnit,
              suger: suger,
              sugerUnit: sugerUnit,
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
                      "$calories $caloriesUnit",
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
                                  caloriesUnit: caloriesUnit,
                                  carbs: carbs,
                                  carbsUnit: carbsUnit,
                                  fibers: fibers,
                                  fibersUnit: fibersUnit,
                                  protein: protein,
                                  proteinUnit: proteinUnit,
                                  vitamins: vitamins,
                                  vitaminsUnit: vitaminsUnit,
                                  weight: weight,
                                  fat: fat,
                                  fatUnit: fatUnit,
                                  suger: suger,
                                  sugerUnit: sugerUnit,
                                  weightUnit: weightUnit,
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
