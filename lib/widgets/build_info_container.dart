import 'dart:ui';

import 'package:fina/screens/screens.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class infoContainer extends StatelessWidget {
  String assetName1,
      title1,
      subtitle1,
      assetName2,
      title2,
      subtitle2,
      assetName3,
      title3,
      subtitle3;
  var thepage;
  infoContainer(
      {super.key,
      required this.assetName1,
      required this.title1,
      required this.subtitle1,
      required this.assetName2,
      required this.title2,
      required this.subtitle2,
      required this.assetName3,
      required this.title3,
      required this.subtitle3,
      required this.thepage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => thepage)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: screenHeigth! / 4,
            width: screenWidth! / 2.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                ),
                child: Container(
                  height: screenHeigth! / 4,
                  width: screenWidth! / 2.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: Text(
                              title1,
                              style: customTextStyle.labelMedium,
                            ),
                            subtitle: Text(
                              subtitle1,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            leading: Image(
                              image: AssetImage(assetName1),
                              height: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: Text(
                              title2,
                              style: customTextStyle.labelMedium,
                            ),
                            subtitle: Text(
                              subtitle2,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            leading: Image(
                              image: AssetImage(assetName2),
                              height: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: Text(
                              title3,
                              style: customTextStyle.labelMedium,
                            ),
                            subtitle: Text(
                              subtitle3,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            leading: Image(
                              image: AssetImage(assetName3),
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
