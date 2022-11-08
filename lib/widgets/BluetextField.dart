import 'package:flutter/material.dart';
import 'package:fina/data/data.dart';
import 'package:flutter/services.dart';

class CustomTextfieldBlue extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? theController;
  final List<TextInputFormatter>? theFormater;
  final String label;
  final FocusNode? myFocusNode;
  final int? maxLines;

  const CustomTextfieldBlue(
      {super.key,
      this.validator,
      this.theFormater,
      this.maxLines,
      this.myFocusNode,
      required this.label,
      this.theController});

  @override
  State<CustomTextfieldBlue> createState() => _CustomTextfieldBlueState();
}

class _CustomTextfieldBlueState extends State<CustomTextfieldBlue> {
  IconData usedIcon = Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: widget.maxLines ?? 1,
      focusNode: widget.myFocusNode,
      style: customTextStyle.titleMedium,
      controller: widget.theController,
      textInputAction: TextInputAction.newline,
      validator: widget.validator,
      inputFormatters: widget.theFormater,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgrounColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgrounColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: customRed, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: customRed, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
