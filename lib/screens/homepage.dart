import 'package:fina/models/firestore_refrences.dart';
import 'package:fina/widgets/drawer.dart';
import 'package:fina/widgets/homePageWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 127, 162, 245),
        title: const Text("Meals"),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CategoryBox(
            //     imagURL:
            //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLtwJW7HaHUS5Pgw7I69NUnDst5Qia_fTHMw&usqp=CAU",
            //     title: "Vegan",
            //     subtitle: "This category contains all the vegan food"),
            CategoryBox(
                imagURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQSFia2nGN0UHvJvMhZBJQaJkxyp391IYfrQ&usqp=CAU",
                title: "Meat",
                subtitle: "This category contains all the meat food",
                theCollectionReference: healthyCategoryCollection),
            CategoryBox(
                imagURL:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzh5LSN6dk17RIhp1NKFP8zZ_XC7zulFcIUtg38MYQJg&s",
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
          ],
        ),
      ),
    );
  }
}
