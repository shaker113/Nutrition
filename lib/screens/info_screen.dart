import 'package:fina/data/colors.dart';
import 'package:fina/screens/H_W.dart';
import 'package:fina/screens/screens.dart';
import 'package:fina/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

List userAnswers = [""];

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  PageController pageController = PageController();

  int currentIndex = 0;

  Color g = Colors.grey;
  Color w = Colors.white;
  Color t = const Color.fromARGB(255, 155, 147, 147);
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          List answers = questions[index]['a'];
          return Column(
            children: [
              addVerticalSpace(35),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        if (currentIndex == 0) {
                          Navigator.popAndPushNamed(context, "welcome");
                        }
                        userAnswers.removeLast();
                        pageController.jumpToPage(currentIndex - 1);
                        currentIndex--;
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ],
              ),
              addVerticalSpace(30),
              Text(
                questions[index]['q'],
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Column(
                children: answers.map(
                  (item) {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10, top: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          if (value == item['title'])
                            BoxShadow(
                              color: g,
                              blurRadius: 5,
                              offset: const Offset(0, 4),
                            )
                        ],
                        border: Border.all(
                            width: value == item['title'] ? 1.5 : 1,
                            color: value == item['title'] ? backgrounColor : g),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text(
                          item['title'],
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(item['subtitle']),
                        leading: item['image'],
                        onTap: () {
                          value = item['title'];
                          setState(() {});
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
              addVerticalSpace(30),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgrounColor,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: value.isEmpty
                      ? null
                      : () {
                          userAnswers.asMap()[currentIndex] == null
                              ? null
                              : userAnswers.removeAt(currentIndex);
                          userAnswers.insert(currentIndex, value);
                          value = "";

                          if (currentIndex == questions.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => H_W(),
                                ));
                            setState(() {});
                            print(userAnswers);

                            return;
                          }
                          pageController.jumpToPage(currentIndex + 1);
                          currentIndex++;
                          print(userAnswers);
                        },
                  child: const Text("Next"),
                ),
              ),
              addVerticalSpace(40)
            ],
          );
        },
      ),
    );
  }
}
