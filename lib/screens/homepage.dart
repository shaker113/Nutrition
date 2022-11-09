import 'package:fina/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var fireMessging = FirebaseMessaging.instance;
  @override
  void initState() {
    // fireMessging.getToken().then((value) {
    //   print("@@@@@@@@@@@@@@@@@@@");
    //   print(value);
    //   print("@@@@@@@@@@@@@@@@@@@@@");
    // });
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
        backgroundColor: backgrounColor,
        actions: [
          isAdmin ?? false ? const AddButton() : const SizedBox(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "cartpage");
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      // appBar: AppBar(elevation: 0, backgroundColor: Color(0xFF21BFBD)),
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
            Container(
              height: screenHeigth! - 151,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45),
                  topLeft: Radius.circular(45),
                ),
              ),
              child: myGridView(),
            )
          ]),
    );
  }

  Widget myGridView() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          var myCateory = categories[index];
          return CategoryBox(
              imagURL: myCateory.imagURL,
              title: myCateory.title,
              subtitle: myCateory.subtitle,
              theCollectionReference: myCateory.theCollectionReference);
        },
      );
}
