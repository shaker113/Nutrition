import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';

import '../data/colors.dart';

class Birth extends StatefulWidget {
  const Birth({super.key});

  @override
  State<Birth> createState() => _BirthState();
}

class _BirthState extends State<Birth> {
  DateTime d = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(40),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text(
              "$d",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 48),
            child: TextButton(
              onPressed: () {
                setState(() {
                  d = DateTime.now();
                });
              },
              child: Text(
                "TODAY",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ScrollDatePicker(
              selectedDate: d,
              locale: Locale('en'),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  d = value;
                });
              },
            ),
          ),
          addVerticalSpace(300),
          SizedBox(
            height: 40,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: backgrounColor,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: const Text("Next"),
            ),
          )
        ],
      ),
    );
  }
}
