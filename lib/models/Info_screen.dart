import 'package:flutter/material.dart';

List questions = [
  {
    'q': 'What is your gender',
    'a': [
      {
        'title': 'Male',
        'subtitle': '',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/man.png"),
        )
      },
      {
        'title': 'Female',
        'subtitle': '',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/weman.png"),
        )
      },
    ],
  },
  {
    'q': 'What is your main goal?',
    'a': [
      {
        'title': 'Lose Weight',
        'subtitle': 'Drop extra pounds wrth ease',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/2.png"),
        )
      },
      {
        'title': 'Build Muscle',
        'subtitle': 'Get lean and strong',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/muscl.png"),
        )
      },
      {
        'title': 'Keep Fit',
        'subtitle': 'Stay in shape and feel great',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/fit.png"),
        )
      },
    ],
  },
  {
    'q': 'Do you have any diseases?',
    'a': [
      {
        'title': 'None',
        'subtitle': '',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/none.png"),
        )
      },
      {
        'title': 'Diabetes',
        'subtitle': '',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/diabetes.png"),
        )
      },
      {
        'title': 'Hypertension',
        'subtitle': '',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/arm.png"),
        )
      },
      {
        'title': 'Gout',
        'subtitle': '',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/gout.png"),
        )
      },
      {
        'title': 'Other',
        'subtitle': '',
        'image': const CircleAvatar(
          foregroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/images/64.png"),
        )
      },
    ],
  },
];
