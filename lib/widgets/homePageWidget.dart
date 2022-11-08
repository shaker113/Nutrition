import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/data/data.dart';
import 'package:fina/models/firestore_refrences.dart';
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
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
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 240,
            width: screenWidth! * 0.8,
            child: Column(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(imagURL),
                    ),
                  ),
                ),
                addVerticalSpace(10),
                Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    addVerticalSpace(10),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
