import 'package:fina/models/models.dart';
import 'package:fina/widgets/buttons/gradiantButton.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GradientButton(
          theFunction: () {
            AuthService().signOut();
            Navigator.popAndPushNamed(context, "welcome");
          },
          theText: "Sign Out"),
    );
  }
}
