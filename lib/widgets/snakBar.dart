import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> CustomSnakBar(
    String? theMessage, context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(theMessage ?? ""),
    ),
  );
}
