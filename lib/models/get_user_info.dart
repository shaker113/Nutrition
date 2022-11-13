import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

String? accountImage, userName, userEmail;
double? userWeight, userHeight, userCal, userProtein, userFat;

getAccountInfo() async {
  DocumentSnapshot userInfo = await userCollection.doc(userId).get();

  userName = userInfo['name'];
  userEmail = userInfo['email'];
  userWeight = userInfo['Weight'];
  userHeight = userInfo['height'];
  accountImage = userInfo['image'];
}
