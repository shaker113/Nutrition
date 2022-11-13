import 'package:flutter/material.dart';

IconButton backButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(
      Icons.arrow_back_ios,
      color: Colors.black.withOpacity(0.5),
    ),
  );
}
