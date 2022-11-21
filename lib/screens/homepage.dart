import 'package:fina/screens/admin_screen.dart';
import 'package:fina/screens/water_reminder.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/models.dart';
import 'screens.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fireMessging = FirebaseMessaging.instance;

  get theCollectionReference => null;
  intialMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      return const AlertDialog(
        content: Text("welcome"),
      );
      // it is work when the app closed
    }
  }

  @override
  void initState() {
    userId = authInstance.currentUser?.uid;
    checkRole();
    getAccountInfo();
    calculateUsercal() {
      setState(() {
        DailyNeedsCalcState().plussMethod(double.parse(userWeight!.toString()),
            double.parse(userHeight!.toString()), true, userGoalIndex);
        BodyFatCalcState().testmethod(double.parse(userWeight!.toString()),
            double.parse(userHeight!.toString()), userGender!, userAge!, true);
      });
    }

    intialMessage();

    fireMessging.getToken().then((value) {
      // print("@@@@@@@@@@@@@@@@@@@");
      // print(value);
      // print("@@@@@@@@@@@@@@@@@@@@@");

      //  to print the token
      // the message will not show on forground, it will appear on background
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const Water_Reminder();
        },
      ));
    });
    FirebaseMessaging.onMessage.listen((event) {
      // print("====================================");
      // print("${event.notification}");
      // print("====================================");

      // to send notification on forground.
    });

    print(isAdmin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: backgrounColor,
            actions: [
              isAdmin ?? false ? const AddButton() : const SizedBox(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "cartpage");
                },
                icon: Image.asset(
                  listIcon,
                  // height: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Water_Reminder();
                    },
                  ));
                },
                icon: Image.asset(
                  waterIcon,
                  // height: 40,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const AdminScreen();
                      },
                    ));
                  },
                  icon: const Icon(Icons.admin_panel_settings))
            ],
          ),
          drawer: const Drawer(
            child: MyDrawer(),
          ),
          backgroundColor: backgrounColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                    fontSize: 25,
                    height: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              addVerticalSpace(20),
              SingleChildScrollView(
                child: Container(
                  height: screenHeigth! - 151,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(42),
                      topLeft: Radius.circular(42),
                    ),
                  ),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        autoPlay: true,
                        disableCenter: true,
                        viewportFraction: 0.4,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.vertical),
                    itemCount: categories.length,
                    itemBuilder: ((context, index, realIndex) {
                      var myCateory = categories[index];
                      return CategoryBox(
                          imagURL: myCateory.imagURL,
                          title: myCateory.title,
                          subtitle: myCateory.subtitle,
                          theCollectionReference:
                              myCateory.theCollectionReference);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
