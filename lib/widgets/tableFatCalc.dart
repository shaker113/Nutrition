// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class tableWidget extends StatelessWidget {
//   tableWidget(
//       {super.key,
//       required this.BMI,
//       required this.bodyfat,
//       required this.status});
//   String BMI;
//   String bodyfat;
//   String status;

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       textDirection: TextDirection.ltr,
//       border:
//           TableBorder.all(width: 2.0, borderRadius: BorderRadius.circular(10)),
//       children: [
//         TableRow(children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "BMI :",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textScaleFactor: 1,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "$BMI ",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textScaleFactor: 1,
//             ),
//           ),
//         ]),
//         TableRow(children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "Body Fat :",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textScaleFactor: 1,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "$bodyfat",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textScaleFactor: 1,
//             ),
//           ),
//         ]),
//         TableRow(children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               " Status :",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textScaleFactor: 1,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "$status",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textScaleFactor: 1,
//             ),
//           ),
//         ]),
//       ],
//     );
//   }
// }
