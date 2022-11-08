import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          child: Column(
            children: [
              Container(
                height: 160,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: [
                      Color.fromARGB(255, 33, 191, 189),
                      Color.fromARGB(255, 127, 162, 245),
                      Color.fromARGB(255, 82, 118, 247)
                    ])),
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 15, left: 15, bottom: 15),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              child: Text(
                                "R",
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text("Username",
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("User Email",
                                    style: TextStyle(fontSize: 15.0)),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Color(0xFF21BFBD),
          ),
          title: const Text("Filters"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Color(0xFF21BFBD)),
          title: const Text("Settings"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.calculate, color: Color(0xFF21BFBD)),
          title: const Text("Daily Need Calculator"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.file_open, color: Color(0xFF21BFBD)),
          title: const Text("Policies"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app, color: Color(0xFF21BFBD)),
          title: const Text("Exit"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Color(0xFF21BFBD)),
          title: const Text("Log Out"),
          onTap: () {},
        ),
      ],
    );
  }
}
