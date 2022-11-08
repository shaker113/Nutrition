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
      imagURL:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6",
      title: "vegetables",
      subtitle: "This category contains all the vegan food",
      theCollectionReference: vegetablesCollection),
  Category(
      imagURL:
          "https://cdn-prod.medicalnewstoday.com/content/images/articles/315/315449/a-variety-of-red-meats.jpg",
      title: "Meat",
      subtitle: "This category contains all the meat food",
      theCollectionReference: meatCollection),
  Category(
      imagURL:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature.jpg?sfvrsn=64942d53_4",
      title: "Fruits",
      subtitle: "This category contains all the fruits food",
      theCollectionReference: fruitsCollecton),
  Category(
    imagURL:
        "https://info.ehl.edu/hubfs/Blog-EHL-Insights/Blog-Header-EHL-Insights/trends%20drinks.jpg",
    title: "Drinks",
    subtitle: "This category contains all the Drinks food",
    theCollectionReference: drinksCollection,
  ),
  Category(
      imagURL:
          "https://www.eatforhealth.gov.au/sites/default/files/images/the_guidelines/lean_meats_food_group_75650673_8_web.jpg",
      title: "White meat",
      subtitle: "This category contains all the White meat food",
      theCollectionReference: whiteMeatCollection),
  Category(
    imagURL:
        "https://www.bruker.com/en/applications/food-analysis-and-agriculture/food-quality/milk-and-dairy/_jcr_content/root/herostage/backgroundImageVPL.coreimg.82.1462.jpeg/1596451146895/milk-dairy.jpeg",
    title: "Dairy products",
    subtitle: "This category contains all the dairy products food",
    theCollectionReference: dairyCollection,
  ),
  Category(
      imagURL:
          "https://foodtolive.com/healthy-blog/wp-content/uploads/sites/3/2017/11/Fast-Food-and-Junk-Food-4-1.jpg",
      title: "Junk food",
      subtitle: "This category contains all the Junk food",
      theCollectionReference: junkFoodCollection),
];
