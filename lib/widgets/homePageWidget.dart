import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/screens/screens.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  String imagURL, title, subtitle;
  CollectionReference theCollectionReference;

  CategoryBox(
      {super.key,
      required this.imagURL,
      required this.title,
      required this.subtitle,
      required this.theCollectionReference});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Category_Page(
                theTitle: title,
                theCollectionReference: theCollectionReference),
          ),
        );
      },
      child: Container(
        // padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: buttonsColor.withOpacity(0.3),
          ),
        ),

        height: screenHeigth! * 0.1,
        width: screenWidth! * 0.4,
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imagURL))),
            ),
            addVerticalSpace(10),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
