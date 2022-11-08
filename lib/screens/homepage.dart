import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    checkRole();
    userId = authInstance.currentUser?.uid;
    userInfo = userCollection.doc(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 127, 162, 245),
        title: const Text("Meals"),
        actions: [
          isAdmin ?? false ? const AddButton() : const SizedBox(),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "cartpage");
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryBox(
                imagURL:
                    "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6",
                title: "vegetables",
                subtitle: "This category contains all the vegan food",
                theCollectionReference: vegetablesCollection),
            CategoryBox(
                imagURL:
                    "https://cdn-prod.medicalnewstoday.com/content/images/articles/315/315449/a-variety-of-red-meats.jpg",
                title: "Meat",
                subtitle: "This category contains all the meat food",
                theCollectionReference: meatCollection),
            CategoryBox(
                imagURL:
                    "https://www.eatforhealth.gov.au/sites/default/files/images/the_guidelines/lean_meats_food_group_75650673_8_web.jpg",
                title: "White meat",
                subtitle: "This category contains all the White meat food",
                theCollectionReference: whiteMeatCollection),
            CategoryBox(
                imagURL:
                    "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature.jpg?sfvrsn=64942d53_4",
                title: "Fruits",
                subtitle: "This category contains all the fruits food",
                theCollectionReference: fruitsCollecton),
            CategoryBox(
              imagURL:
                  "https://www.bruker.com/en/applications/food-analysis-and-agriculture/food-quality/milk-and-dairy/_jcr_content/root/herostage/backgroundImageVPL.coreimg.82.1462.jpeg/1596451146895/milk-dairy.jpeg",
              title: "Dairy products",
              subtitle: "This category contains all the dairy products food",
              theCollectionReference: dairyCollection,
            ),
            CategoryBox(
              imagURL:
                  "https://info.ehl.edu/hubfs/Blog-EHL-Insights/Blog-Header-EHL-Insights/trends%20drinks.jpg",
              title: "Drinks",
              subtitle: "This category contains all the Drinks food",
              theCollectionReference: drinksCollection,
            ),
            CategoryBox(
                imagURL:
                    "https://foodtolive.com/healthy-blog/wp-content/uploads/sites/3/2017/11/Fast-Food-and-Junk-Food-4-1.jpg",
                title: "Junk food",
                subtitle: "This category contains all the Junk food",
                theCollectionReference: junkFoodCollection)
          ],
        ),
      ),
    );
  }
}
