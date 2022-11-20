import 'package:flutter/material.dart';

import '../data/colors.dart';
import '../models/auth.dart';

class ListTileLogout extends StatefulWidget {
  const ListTileLogout({super.key});

  @override
  State<ListTileLogout> createState() => _ListTileLogoutState();
}

class _ListTileLogoutState extends State<ListTileLogout> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: backgrounColor),
      title: const Text("Log Out"),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Are you sure to log out?",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: const Color(0xFF21BFBD)),
                              onPressed: () {
                                AuthService().signOut();
                                Navigator.popAndPushNamed(context, "welcome");
                              },
                              child: const Text("Logout")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor:
                                      Color.fromARGB(255, 53, 66, 66)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Back"))
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
