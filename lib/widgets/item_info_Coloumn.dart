import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/data.dart';

class ItemInfoRow extends StatelessWidget {
  ItemInfoRow(
      {Key? key,
      required this.theItemController,
      required this.theItemName,
      this.theFormater})
      : super(key: key);
  List<TextInputFormatter>? theFormater;
  final String theItemName;
  final TextEditingController theItemController;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Text(
            "Item $theItemName",
            style: customTextStyle.bodyMedium,
          ),
          addVerticalSpace(10),
          CustomTextfieldBlue(
            label: theItemName,
            theFormater: theFormater,
            theController: theItemController,
          ),
        ],
      ),
    );
  }
}
