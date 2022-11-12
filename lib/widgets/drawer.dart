import 'package:fina/data/colors.dart';
import 'package:fina/screens/bodyFatClaculator.dart';
import 'package:fina/screens/profile.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';
import 'logoutListTile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(0.8, 1),
              colors: [backgrounColor2, backgrounColor],
            ),
          ),
          width: double.infinity,
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 15, left: 15, bottom: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: buttonsColor,
                          radius: 40,
                          child: const Text(
                            "R",
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                        addHorizantalSpace(15),
                        Column(
                          children: [
                            const Text("Username",
                                style: TextStyle(fontSize: 20.0)),
                            addVerticalSpace(5),
                            const Text("User Email",
                                style: TextStyle(fontSize: 15.0)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: backgrounColor,
          ),
          title: const Text("Filters"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, color: backgrounColor),
          title: const Text("Settings"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile_Page(),
                ));
          },
        ),
        ListTile(
          leading: Icon(Icons.calculate, color: backgrounColor),
          title: const Text("Daily Need Calculator"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyNeedCalculator(),
                ));
          },
        ),
        ListTile(
          leading: Icon(Icons.file_open, color: backgrounColor),
          title: const Text("fat Calculator"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const bodyFatCal(),
                ));
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: backgrounColor),
          title: const Text("Exit"),
          onTap: () {},
        ),
        ListTileLogout()
      ],
    );
  }
}
