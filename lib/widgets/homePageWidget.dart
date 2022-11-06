import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  MyWidget(
      {required this.ImagURL, required this.title, required this.subtitle});
  String ImagURL;
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {},
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 260,
            width: 220,
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
                          fit: BoxFit.fill, image: NetworkImage(ImagURL))),
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
                          child: Center(
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )),
                          SizedBox(height: 10,),
                      Container(
                          width: 400,
                          alignment: Alignment.topLeft,
                          child: Center(
                            child: Text(
                              subtitle,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
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
