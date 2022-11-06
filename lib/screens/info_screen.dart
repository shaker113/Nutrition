import 'package:flutter/material.dart';

import '../models/models.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  PageController pageController = PageController();

  int currentIndex = 0;

  List userAnswers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          List answers = questions[index]['a'];
          return Column(
            children: [
              Text(questions[index]['q']),
              const Spacer(),
              Column(
                children: answers.map((item) {
                  return Card(
                    child: ListTile(
                      title: Text(item['title']),
                      subtitle: Text(item['subtitle']),
                      leading: item['icon'],
                      onTap: () {
                        userAnswers.add(item['title']);
                        if (currentIndex == questions.length - 1) {
                          /// TODO: write your code
                          print(userAnswers);

                          /// TODO: Navigator to another page
                          return;
                        }
                        pageController.jumpToPage(currentIndex + 1);
                        currentIndex++;
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
