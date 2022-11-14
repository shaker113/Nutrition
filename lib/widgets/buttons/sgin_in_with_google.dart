import 'package:fina/models/models.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';
import '../widgets.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await signInWithGoogle();
        userId = authInstance.currentUser?.uid;
        userInfo = userCollection.doc(userId);
        if (await AuthService().isNew(userId)) {
          Navigator.pushNamed(context, "infoscreen");
        } else {
          Navigator.pushNamed(context, "homepage");
        }
        AuthService().saveAcount(
            id: userId,
            name: authInstance.currentUser?.displayName ?? "User",
            email: authInstance.currentUser?.email);

        checkRole();

        CustomSnakBar("signed in successfully", context);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: customBlue, width: 2),
        ),
        child: const Image(
          image: AssetImage(
            googleImage,
          ),
          height: 35,
        ),
      ),
    );
  }
}
