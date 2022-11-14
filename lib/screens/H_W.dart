// ignore_for_file: camel_case_types

import 'package:fina/data/data.dart';
import 'package:fina/screens/birth.dart';
import 'package:fina/widgets/buttons/back_button.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class H_W extends StatefulWidget {
  const H_W({super.key});

  @override
  State<H_W> createState() => _H_WState();
}

class _H_WState extends State<H_W> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  backButton(context),
                ],
              ),

              addVerticalSpace(60),
              const Text(
                "Enter your hight",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                        ],
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: backgrounColor))),
                      )),
                  addHorizantalSpace(5),
                  const Text(
                    "cm",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              addVerticalSpace(7),
              const Text(
                "Enter your Weight",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                        ],
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: backgrounColor))),
                      )),
                  addHorizantalSpace(5),
                  const Text(
                    "kg",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              addVerticalSpace(10),

              Container(
                // width: 400,
                // height: 500,
                child: const Image(image: AssetImage("assets/images/20.jpeg")),
              ),
              // Positioned(
              //   right: 260,
              //   child: Container(
              //     width: 150,
              //     height: 300,
              //     child:const Image(image: AssetImage("assets/images/w.png")),
              //   ),s
              // ),
              SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgrounColor,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Birth(),
                        ));
                    setState(() {});
                  },
                  child: const Text("Next"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
