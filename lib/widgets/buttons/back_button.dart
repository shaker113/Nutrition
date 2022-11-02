import 'package:flutter/material.dart';

IconButton backButton(BuildContext context) {
  return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ));
}
