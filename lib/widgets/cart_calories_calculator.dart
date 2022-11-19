import 'package:fina/data/data.dart';
import 'package:fina/models/get_user_info.dart';
import 'package:fina/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';

class cartCalculator extends StatefulWidget {
  double? theFoodCalories, theGoalCalories;
  cartCalculator(
      {super.key,
      required this.theFoodCalories,
      required this.theGoalCalories});

  @override
  State<cartCalculator> createState() => _cartCalculatorState();
}

class _cartCalculatorState extends State<cartCalculator> {
  late double remaing;
  @override
  Widget build(BuildContext context) {
    remaing = widget.theGoalCalories! - widget.theFoodCalories!;
    return Container(
      padding: const EdgeInsets.only(left: 40, top: 10, right: 40),
      width: screenHeigth,
      height: 180,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Calories",
            style: customTextStyle.titleLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Circularindicator(
                  progressColors: Colors.white,
                  textInside: "${remaing.toStringAsFixed(0)}\nRemaing",
                  backGroundColor: Colors.red.shade300,
                  isUsed: false,
                  isInCart: true,
                  theFood: widget.theFoodCalories,
                  theGoal: widget.theGoalCalories),
              SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Base Goal",
                      style: customTextStyle.headlineMedium,
                    ),
                    Text(
                      widget.theGoalCalories!.toStringAsFixed(0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "food",
                      style: customTextStyle.headlineMedium,
                    ),
                    Text(
                      widget.theFoodCalories!.toStringAsFixed(0),
                      style: TextStyle(
                          color:
                              widget.theFoodCalories! > widget.theGoalCalories!
                                  ? customRed
                                  : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
