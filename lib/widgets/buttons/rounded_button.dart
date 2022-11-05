import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double right;
  final double left;
  final Function onPress;

  RoundedButtonWidget({
    required this.title,
    required this.color,
    required this.left,
    required this.right,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: ElevatedButton(
        onPressed: () {
          return onPress();
        },
        child: Text('calculate'),
      ),
      // child: RaisedButton(elevation: 15,
      //     color: color,
      //     padding: EdgeInsets.only(
      //       right: right,
      //       left: left,
      //       top: 10,
      //       bottom: 10,
      //     ),
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //     child: Text(
      //       title,
      //       style: TextStyle(
      //           fontSize: 15, color: Colors.black, fontWeight: FontWeight.w300),
      //     ),
      //     onPressed: () {
      //       return onPress();
      //     }),
    );
  }
}
