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
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: NetworkImage(
                //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzh5LSN6dk17RIhp1NKFP8zZ_XC7zulFcIUtg38MYQJg&s"),
                //   ),
                // ),
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: Colors.grey,
                            ),
                            Text("Back",style: TextStyle(fontSize: 15),)
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Color.fromARGB(255, 127, 162, 245),
                            child: Text(
                              "R",
                              style: TextStyle(fontSize: 40.0,color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Username", style: TextStyle(fontSize: 20.0)),
                          Text("User Email", style: TextStyle(fontSize: 15.0)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Filters"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.calculate),
          title: const Text("Daily Need Calculator"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.file_open),
          title: const Text("Policies"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text("Exit"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Log Out"),
          onTap: () {},
        ),
      ],
    );
  }
}
