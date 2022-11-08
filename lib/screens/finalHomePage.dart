import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/finalHomePageWidget.dart';

class finalHomePage extends StatefulWidget {
  const finalHomePage({super.key});

  @override
  State<finalHomePage> createState() => _finalHomePageState();
}

class _finalHomePageState extends State<finalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(elevation: 0, backgroundColor: Color(0xFF21BFBD)),
      backgroundColor: const Color(0xFF21BFBD),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            "Categories",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 515,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(75), topLeft: Radius.circular(75))),
          child: ListView(
            primary: false,
            padding: const EdgeInsets.only(left: 25, right: 20),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: SizedBox(
                  height: 515,
                  child: ListView(children: [
                    Row(
                      children: [
                        homePageWidget(
                            ImagURL:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLtwJW7HaHUS5Pgw7I69NUnDst5Qia_fTHMw&usqp=CAU",
                            title: "Vegan",
                            subtitle:
                                "This category contains all the vegan food"),
                        homePageWidget(
                            ImagURL:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQSFia2nGN0UHvJvMhZBJQaJkxyp391IYfrQ&usqp=CAU",
                            title: "Meat",
                            subtitle:
                                "This category contains all the meat food"),
                      ],
                    ),
                    Row(
                      children: [
                        homePageWidget(
                            ImagURL:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLtwJW7HaHUS5Pgw7I69NUnDst5Qia_fTHMw&usqp=CAU",
                            title: "Vegan",
                            subtitle:
                                "This category contains all the vegan food"),
                        homePageWidget(
                            ImagURL:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQSFia2nGN0UHvJvMhZBJQaJkxyp391IYfrQ&usqp=CAU",
                            title: "Meat",
                            subtitle:
                                "This category contains all the meat food"),
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
