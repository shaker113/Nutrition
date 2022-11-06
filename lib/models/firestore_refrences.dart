import 'package:cloud_firestore/cloud_firestore.dart';

final userCollection = FirebaseFirestore.instance.collection('user');
final categoryCollection = FirebaseFirestore.instance.collection('category');

final healthyCategoryCollection =
    categoryCollection.doc("PyLJTXTAmVk56txtcCvg").collection('items');
final fruitsCollecton =
    categoryCollection.doc("vbAq9ACqLrfRd5JbvY09").collection('items');
final dairyCollection =
    categoryCollection.doc("mKAWEVZGjaMXDC3H2uNl").collection('items');
