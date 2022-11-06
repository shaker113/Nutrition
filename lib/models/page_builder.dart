import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Page_bulider extends StatelessWidget {
  Page_bulider(
      {super.key,
      this.questions,
      required this.controller,
      required this.ontap,
      required this.itemBuilder});
  final PageController controller;

  List<String>? questions;

  Function()? ontap;

  Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            scrollDirection: Axis.vertical,
            itemCount: questions!.length + 1,
            itemBuilder: itemBuilder,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: ontap,
            child: const Text('Next'),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff3D8361)),
          ),
        )
      ],
    );
  }
}
