import 'package:fina/data/data.dart';
import 'package:fina/models/auth.dart';
import 'package:fina/models/firestore_refrences.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../data/colors.dart';
import '../models/models.dart';
import 'screens.dart';

class Birth extends StatefulWidget {
  const Birth({super.key});

  @override
  State<Birth> createState() => _BirthState();
}

class _BirthState extends State<Birth> {
  DateTime todayDate = DateTime.now();
  DateTime userDate = DateTime.now();
  @override
  void initState() {
    int goalindex = 0;
    if (userAnswers[1] == 'Keep Fit') {
      goalindex = 1;
    } else if (userAnswers[1] == 'Build Muscle') {
      goalindex = 2;
    } else if (userAnswers[1] == 'Lose Weight') {
      goalindex = 0;
    }
    DailyNeedsCalcState().plussMethod(double.parse(userAnswers[3]),
        double.parse(userAnswers[4]), true, goalindex);
    userCollection.doc(userId).update({'baseGoalCal': userCal});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            addVerticalSpace(40),
            const Text(
              "When is your brithday?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            addVerticalSpace(10),
            Text(
              "We will use it to personalize\n your plan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: customGrey),
            ),
            addVerticalSpace(10),
            todayDate.year - userDate.year > 14
                ? const Text("العمر كله")
                : Text(
                    "you need to be at least 14 years old",
                    style: TextStyle(
                      color: customRed,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            SizedBox(
              height: 250,
              child: ScrollDatePicker(
                selectedDate: userDate,
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    userDate = value;
                  });
                },
              ),
            ),
            addVerticalSpace(260),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgrounColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: todayDate.year - userDate.year > 14
                    ? () {
                        userAnswers.asMap()[5] == null
                            ? null
                            : userAnswers.removeAt(5);

                        userAnswers.insert(5, todayDate.year - userDate.year);
                        saveUserInfo();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "splash", (Route<dynamic> route) => false);
                      }
                    : null,
                child: const Text("Personalize my plan"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveUserInfo() {
    userCollection.doc(userId).update({
      'gender': userAnswers[0],
      'mainGoal': userAnswers[1],
      'height': double.parse(userAnswers[4].toString()),
      'Weight': double.parse(userAnswers[3].toString()),
      'diet': userAnswers[2],
      'age': int.parse(userAnswers[5].toString())
    });
  }
}
