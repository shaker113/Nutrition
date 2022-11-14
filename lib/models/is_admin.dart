import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/models/models.dart';

bool? isAdmin;
Future<void> checkRole() async {
  DocumentSnapshot userInfo = await userCollection.doc(userId).get();
  String userRole = userInfo['role'];
  userRole == "admin" ? isAdmin = true : isAdmin = false;
}
