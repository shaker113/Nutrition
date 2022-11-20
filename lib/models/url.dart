// ignore_for_file: non_constant_identifier_names

import 'package:fina/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri insta_url = Uri.parse('https://www.instagram.com/nutrition_jor/');
final Uri email_url = Uri.parse('nutrution1@gmail.com');

Future<void> Insta_function() async {
  if (!await launchUrl(insta_url)) {
    throw 'Could not launch $insta_url';
  }
}

Future<void> Email_function() async {
  if (!await launchUrl(email_url)) {
    throw 'Could not launch $email_url';
  }
}

// ignore: camel_case_types
class urlClass extends StatelessWidget {
  urlClass(
      {required this.myfunction,
      required this.myplatformicon,
      required this.myplatformsubtitle,
      required this.myplatformtitle});
  String? myplatformtitle;
  String? myplatformsubtitle;
  IconData? myplatformicon;
  Function()? myfunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myfunction,
      child: Container(
        child: ListTile(
            title: Text("$myplatformtitle"),
            subtitle: Text("$myplatformsubtitle"),
            leading: Icon(
              myplatformicon,
              color: backgrounColor,
            )),
      ),
    );
  }
}
