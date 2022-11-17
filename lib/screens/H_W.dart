// ignore_for_file: camel_case_types

import 'package:fina/data/data.dart';
import 'package:fina/models/validation.dart';
import 'package:fina/screens/birth.dart';
import 'package:fina/screens/info_screen.dart';
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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    )
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
                        child: h_w_textfield(
                          validator: (p0) => heightValidator(p0),
                          thisController: heightController,
                        )),
                    addHorizantalSpace(5),
                    const Text(
                      "cm",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        child: h_w_textfield(
                          validator: (p0) => wightValidator(p0),
                          thisController: weightController,
                        )),
                    addHorizantalSpace(5),
                    const Text(
                      "kg",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                addVerticalSpace(10),

                Container(
                  // width: 400,
                  // height: 500,
                  child: const Image(image: AssetImage("assets/images/20.png")),
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
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Birth(),
                            ));
                        userAnswers.asMap()[3] == null
                            ? null
                            : userAnswers.removeAt(3);

                        userAnswers.insert(3, weightController.text);
                        userAnswers.asMap()[4] == null
                            ? null
                            : userAnswers.removeAt(4);

                        userAnswers.insert(4, heightController.text);
                        print(userAnswers);
                        setState(() {});
                      } else {
                        null;
                      }
                    },
                    child: const Text("Next"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class h_w_textfield extends StatelessWidget {
  TextEditingController thisController;
  String? Function(String?)? validator;
  h_w_textfield({
    required this.validator,
    required this.thisController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: TextInputType.number,
      controller: thisController,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
      ],
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: backgrounColor))),
    );
  }
}
