import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

String? accountImage, userName, userEmail, userStatus, userGender;
double? userWeight,
    userHeight,
    userCal,
    userProtein,
    userFat,
    userBmi,
    userFatPercentage;
int? userAge;
getAccountInfo() async {
  DocumentSnapshot userInfo = await userCollection.doc(userId).get();

  userName = userInfo['name'];
  userEmail = userInfo['email'];
  userWeight = double.parse(userInfo['Weight'].toString());
  userHeight = double.parse(userInfo['height'].toString());
  accountImage = userInfo['image'];
  userAge = int.parse(userInfo['age'].toString());
  userGender = userInfo['gender'];
}
