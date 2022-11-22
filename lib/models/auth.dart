import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'models.dart';

final authInstance = FirebaseAuth.instance;
String? userId = authInstance.currentUser?.uid;
DocumentReference userInfo = userCollection.doc(userId);

class AuthService {
  // to check if the User is New
  Future<bool> isNew(String? id) async {
    QuerySnapshot stroedInfo =
        await userCollection.where('id', isEqualTo: userId).get();
    if (stroedInfo.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

// if the user is new save his info
  Future saveAcount(
      {required String? name,
      required String? id,
      required String? email}) async {
    if (await isNew(id)) {
      final json = {
        'role': "user",
        'id': id,
        'name': name,
        'email': email!.toLowerCase(),
        'gender': '',
        'mainGoal': '',
        'height': 0,
        'Weight': 0,
        'diet': '',
        'age': 0,
        'image': '',
        'baseGoalCal': 0
      }; //to Create doucumant
      await userInfo.set(json);
    }
  }

  Future signOut() async {
    await authInstance.signOut();
  }
}
