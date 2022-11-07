import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 171, 194, 249),
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 35,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),

                  Text('Email',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
SizedBox(height: 50,),
          Column(
            children: [
               ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Filters"),
          onTap: () {
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {
          },
        ),
        ListTile(
          leading: const Icon(Icons.calculate),
          title: const Text("Calculator"),
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
            ]
          ),

         


        ],
      ),

    );
  }
}