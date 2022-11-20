import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/models/auth.dart';

final userCollection = FirebaseFirestore.instance.collection('user');

final categoryCollection = FirebaseFirestore.instance.collection('category');

final userCartCollection = userInfo.collection('cart');

String meatId = "PyLJTXTAmVk56txtcCvg",
    fruitsId = "vbAq9ACqLrfRd5JbvY09",
    dairy = "mKAWEVZGjaMXDC3H2uNl";

final meatCollection = categoryCollection.doc(meatId).collection('items');

final fruitsCollecton = categoryCollection.doc(fruitsId).collection('items');

final dairyCollection = categoryCollection.doc(dairy).collection('items');

final vegetablesCollection =
    categoryCollection.doc("vegetables").collection('items');

final whiteMeatCollection =
    categoryCollection.doc("White meat").collection('items');

final junkFoodCollection =
    categoryCollection.doc("junk food").collection('items');

final drinksCollection = categoryCollection.doc("drinks").collection('items');
final sweetCollection = categoryCollection.doc("sweets").collection("items");
final bakeryCollection = categoryCollection.doc("bakery").collection("items");
