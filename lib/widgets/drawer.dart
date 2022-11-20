import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/screens/daily2.dart';
import 'package:fina/screens/fat2.dart';
import 'package:fina/screens/water_reminder.dart';
import 'package:fina/data/data.dart';
import 'package:fina/widgets/textFieldCalc.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';
import 'package:fina/models/url.dart';
import 'widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    // getAccountInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
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
                // Container(
                //   alignment: Alignment.topLeft,
                //   padding: const EdgeInsets.only(
                //       left: 15, top: 15, right: 15, bottom: 1),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Row(
                //       children: const [
                //         Icon(
                //           Icons.arrow_back_ios,
                //           size: 20,
                //         ),
                //         Text(
                //           "Back",
                //           style: TextStyle(
                //             fontSize: 15,
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 4, left: 10, bottom: 15),
                    child: StreamBuilder<Object>(
                      stream: userCollection
                          .where('id', isEqualTo: userId)
                          .snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot streamSnapShot) {
                        if (streamSnapShot.hasData) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapShot.data!.docs[0];
                          userName = documentSnapshot['name'];
                          userEmail = documentSnapshot['email'];
                          userWeight = double.parse(
                              documentSnapshot['Weight'].toString());
                          userHeight = double.parse(
                              documentSnapshot['height'].toString());
                          userAge =
                              int.parse(documentSnapshot['age'].toString());
                          userGender = documentSnapshot['gender'];
                          userGoal = documentSnapshot['mainGoal'];
                          accountImage = documentSnapshot['image'];
                          userCal = double.parse(
                              documentSnapshot['baseGoalCal'].toString());
                          if (userGoal == 'Keep Fit') {
                            userGoalIndex = 1;
                          } else if (userGoal == 'Build Muscle') {
                            userGoalIndex = 2;
                          } else if (userGoal == 'Lose Weight') {
                            userGoalIndex = 0;
                          }
                        }

                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Profile_Page(),
                              )),
                          child: Container(
                            height: 80,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Hero(
                                  tag: accountImage ?? "",
                                  child: CircleAvatar(
                                    foregroundImage: accountImage == null ||
                                            accountImage == ""
                                        ? null
                                        : CachedNetworkImageProvider(
                                            accountImage!),
                                    backgroundColor: buttonsColor,
                                    radius: 40,
                                    child: Text(
                                      (userName ?? "a a")
                                          .trim()
                                          .split(' ')
                                          .map((l) => l[0])
                                          .take(2)
                                          .join()
                                          .toUpperCase()
                                          .toString(),
                                      style: const TextStyle(
                                          letterSpacing: 4,
                                          fontSize: 25.0,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                addHorizantalSpace(15),
                                SizedBox(
                                  width: 180,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(userName ?? " ",
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              const TextStyle(fontSize: 20.0)),
                                      addVerticalSpace(5),
                                      Text(userEmail ?? " ",
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              const TextStyle(fontSize: 14.0)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person, color: backgrounColor),
          title: const Text("Profile"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile_Page(),
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
                  builder: (context) => const DailyNeedsCalc(),
                ));
          },
        ),
        ListTile(
          leading: Icon(Icons.fitness_center_rounded, color: backgrounColor),
          title: const Text("BMI Calculator"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BodyFatCalc(),
              ),
            );
          },
        ),
        const ListTileLogout(),
        addVerticalSpace(screenHeigth! * 0.32),
        Divider(
          height: 20,
          color: backgrounColor,
        ),
        urlClass(
            myfunction: Insta_function,
            myplatformicon: (FontAwesomeIcons.instagram),
            myplatformsubtitle: "Contact US",
            myplatformtitle: "Instagram profile"),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "if you need any further information please contact us via this email \nnutrution1@gmail.com ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                overflow: TextOverflow.clip,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
          ),
        )
      ],
    );
  }
}
