import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  textField({required this.mycont, required this.hint});
  TextEditingController mycont = TextEditingController();
  String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required...';
          }

          return null;
        },
        controller: mycont,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            borderSide: BorderSide(
              width: 5,
              style: BorderStyle.none,
            ),
          ),
        ));
  }
}
