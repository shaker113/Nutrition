import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';

class Category {
  String imagURL;
  String title;
  String subtitle;
  CollectionReference theCollectionReference;

  Category(
      {required this.imagURL,
      required this.title,
      required this.subtitle,
      required this.theCollectionReference});
}

final List<Category> categories = [
  Category(
      imagURL: "assets/images/vegetables.jpg",
      title: "vegetables",
      subtitle: "This category contains all the vegan food",
      theCollectionReference: vegetablesCollection),
  Category(
      imagURL: "assets/images/meats.jpeg",
      title: "Meat",
      subtitle: "This category contains all the meat food",
      theCollectionReference: meatCollection),
  Category(
      imagURL: "assets/images/fruits.jpg",
      title: "Fruits",
      subtitle: "This category contains all the fruits food",
      theCollectionReference: fruitsCollecton),
  Category(
    imagURL: "assets/images/drinks.jpg",
    title: "Drinks",
    subtitle: "This category contains all the Drinks food",
    theCollectionReference: drinksCollection,
  ),
  Category(
      imagURL: "assets/images/whitemeats.jpeg",
      title: "White meat",
      subtitle: "This category contains all the White meat food",
      theCollectionReference: whiteMeatCollection),
  Category(
    imagURL: "assets/images/Dairy.jpeg",
    title: "Dairy products",
    subtitle: "This category contains all the dairy products food",
    theCollectionReference: dairyCollection,
  ),
  Category(
      imagURL: "assets/images/junk.jpg",
      title: "Junk food",
      subtitle: "This category contains all the Junk food",
      theCollectionReference: junkFoodCollection),
  Category(
      imagURL: "assets/images/sweets.jpg",
      title: "Sweets",
      subtitle: "",
      theCollectionReference: sweetCollection),
  Category(
      imagURL: "assets/images/bakery.jpg",
      title: "Bakery",
      subtitle: "",
      theCollectionReference: bakeryCollection)
];
