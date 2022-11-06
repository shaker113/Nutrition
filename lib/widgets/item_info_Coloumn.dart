import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/data.dart';

class ItemInfoRow extends StatelessWidget {
  const ItemInfoRow(
      {Key? key, required this.theItemController, required this.theItemName})
      : super(key: key);
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
            theFormater: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            ],
            theController: theItemController,
          ),
        ],
      ),
    );
  }
}
