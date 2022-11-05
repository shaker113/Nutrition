import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List questions = [
    {
      'q': '1?',
      'a': [
        {
          'title': 'safsdf',
          'subtitle': '',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'dsadasd',
          'subtitle': '',
          'icon': const Icon(Icons.account_box),
        },
        {
          'title': 'uiouio',
          'subtitle': '',
          'icon': const Icon(Icons.ac_unit),
        },
      ],
    },
    {
      'q': '2?',
      'a': [
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
      ],
    },
    {
      'q': '3?',
      'a': [
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
      ],
    },
    {
      'q': '4?',
      'a': [
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
      ],
    },
    {
      'q': '5?',
      'a': [
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
      ],
    },
    {
      'q': '6?',
      'a': [
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
        {
          'title': 'safsdf',
          'subtitle': 'sadasd',
          'icon': const Icon(Icons.add),
        },
      ],
    },
  ];

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
                      onTap: (){
                        userAnswers.add(item['title']);
                        if(currentIndex == questions.length - 1){
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
