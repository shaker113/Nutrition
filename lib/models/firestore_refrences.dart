import 'package:cloud_firestore/cloud_firestore.dart';

final userCollection = FirebaseFirestore.instance.collection('user');
final categoryCollection = FirebaseFirestore.instance.collection('category');

final healthyCategoryCollection =
    categoryCollection.doc("PyLJTXTAmVk56txtcCvg").collection('items');
