import 'package:fina/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:fina/data/data.dart';
import 'package:image_picker/image_picker.dart';

import '../models/auth.dart';

class Profile_Page extends StatefulWidget {
  @override
  _Profile_PageState createState() => new _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  final emailController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final nameController = TextEditingController();

  String name = 'Your Name';
  final picker = ImagePicker();

  set newText(String newText) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: backgrounColor),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: getClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.8, 1),
                    end: Alignment.topCenter,
                    colors: [backgrounColor2, backgrounColor],
                  ),
                ),
              ),
            ),
            Positioned(
                width: 500.0,
                top: MediaQuery.of(context).size.height / 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(name,
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 200.0,
                              height: 200.0,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.all(Radius.circular(90.0)),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    const BoxShadow(
                                        blurRadius: 7.0, color: Colors.black)
                                  ])),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit))
                        ],
                      ),
                    ),
                    const SizedBox(height: 90.0),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 70,
                          right: 70,
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: "Your email",
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(
                          left: 70,
                          right: 70,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: "Your Weight",
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(
                          left: 70,
                          right: 70,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              hintText: "Your Height",
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        )),
                    const Padding(padding: EdgeInsets.all(10)),
                    const SizedBox(height: 15.0),
                    const Text(
                      'you can call us if you \n need any help \n +962......',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                        height: 50.0,
                        width: 120.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // title: Text("Your name"),
                                    actions: [
                                      TextField(
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              hintText: "Type Your Name",
                                              hintStyle: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black))),
                                      TextButton(
                                        child: const Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 18),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            nameController;
                                          }); //add setState here.

                                          name = nameController.text;
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Center(
                              child: Text(
                                'Edit Name',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(height: 25.0),
                    SizedBox(
                        height: 50.0,
                        width: 120.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.redAccent,
                          color: Colors.red,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(" Are you Sure"),
                                    actions: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              AuthService().signOut();
                                              Navigator.popAndPushNamed(
                                                  context, "welcome");
                                            },
                                            child: Text(
                                              "Sign out",
                                              style: TextStyle(
                                                  color: customRed,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return Profile_Page();
                                                },
                                              ));
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: customRed,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                              // AuthService().signOut();
                              // Navigator.popAndPushNamed(context, "welcome");
                            },
                            child: Center(
                              child: Text(
                                'Sign out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
            // FloatingActionButton(onPressed: (() {}))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 1);
    path.lineTo(size.width + 10, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
