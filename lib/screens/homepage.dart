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
            // CategoryBox(
            //     imagURL:
            //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzh5LSN6dk17RIhp1NKFP8zZ_XC7zulFcIUtg38MYQJg&s",
            //     title: "Fruits",
            //     subtitle: "This category contains all the fruits food"),
            // CategoryBox(
            //     imagURL:
            //         "data:image/jpeg;base64,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",
            //     title: "Dairy products",
            //     subtitle: "This category contains all the dairy products food"),
          ],
        ),
      ),
    );
  }
}
