import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/models/firestore_refrences.dart';
import 'package:fina/screens/screens.dart';
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
              ));
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 250,
            width: 350,
            child: Column(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(30),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(imagURL))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                          width: 400,
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          width: 400,
                          alignment: Alignment.topLeft,
                          child: Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
