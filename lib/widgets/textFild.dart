import 'package:flutter/material.dart';
import 'package:fina/data/data.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? theController;
  final TextInputType? inputType;
  final String label;
  List<TextInputFormatter>? theFormater;
  final FocusNode? myFocusNode;
  bool? visbleText;

  CustomTextfield(
      {super.key,
      this.validator,
      this.inputType,
      this.visbleText,
      this.theFormater,
      this.myFocusNode,
      required this.label,
      this.theController});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  IconData usedIcon = Icons.visibility_outlined;
  late bool securetext = widget.visbleText ?? false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.myFocusNode,
      style: customTextStyle.labelSmall,
      inputFormatters: widget.theFormater,
      keyboardType: widget.inputType,
      controller: widget.theController,
      textInputAction: TextInputAction.next,
      validator: widget.validator,
      obscureText: securetext,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        label: Text(widget.label),
        errorStyle: TextStyle(color: customRed, fontSize: 13),
        labelStyle: customTextStyle.labelSmall,
        suffixIcon: widget.visbleText ?? false
            ? IconButton(
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    securetext = !securetext;
                  });
                  securetext
                      ? usedIcon = Icons.visibility_outlined
                      : usedIcon = Icons.visibility_off_outlined;
                },
                icon: Icon(usedIcon))
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: customRed),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
