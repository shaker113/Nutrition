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
        AuthService().saveAcount(
            id: userId,
            name: authInstance.currentUser?.displayName,
            email: authInstance.currentUser?.email);

        Navigator.pushNamed(context, "homepage");
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