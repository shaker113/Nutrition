import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/models/firestore_refrences.dart';
import 'package:fina/data/data.dart';
import 'package:fina/screens/screens.dart';
import 'package:fina/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<ChartData> histogramDataHeight = <ChartData>[];
  List<ChartData> histogramDataWeight = <ChartData>[];
  List<ChartData> histogramDataAge = <ChartData>[];
  int maleNumber = 0;
  int femaleNumber = 0;
  int keepFitNumber = 0, gainWeightNumber = 0, loseWeightNumber = 0;
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  void getAllUsersData() async {
    await userCollection.get().then((value) {
      value.docs.forEach((element) {
        histogramDataHeight.add(ChartData(double.parse(
          element.data()['height'].toString(),
        )));
        histogramDataWeight.add(ChartData(double.parse(
          element.data()['Weight'].toString(),
        )));
        histogramDataAge.add(ChartData(double.parse(
          element.data()['age'].toString(),
        )));
        element.data()['gender'] == "Male" ? maleNumber++ : femaleNumber++;
        element.data()['mainGoal'] == "Lose Weight"
            ? loseWeightNumber++
            : element.data()['mainGoal'] == "Build Muscle"
                ? gainWeightNumber++
                : keepFitNumber++;
      });
    });
  }

  @override
  void initState() {
    getAllUsersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrounColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(context),
              userList(),
            ],
          ),
        ),
      ),
    );
  }

  Container userList() {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      height: screenHeigth! - 73,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Text(
            "User List",
            style: customTextStyle.displayLarge,
          ),
          addVerticalSpace(10),
          SizedBox(
            height: 50,
            width: screenWidth! * 0.8,
            child: searchTextField(),
          ),
          userListBuilder(),
        ],
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> userListBuilder() {
    return StreamBuilder(
      stream: searchText.isNotEmpty
          ? userCollection
              .orderBy('email')
              .startAt([searchText]).endAt(['$searchText\uf8ff']).snapshots()
          : userCollection.orderBy('email').snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
        return Column(
          children: [
            SizedBox(
              height: screenHeigth! - 240,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: streamSnapShot.data?.docs.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  List role = ["admin", "user"];
                  String userRole = streamSnapShot.data!.docs[index]['role'];
                  if (streamSnapShot.hasData) {
                    return ListTile(
                      leading: Text((index + 1).toString()),
                      minLeadingWidth: 10,
                      title: Text(
                        "Email: ${streamSnapShot.data?.docs[index]['email']}",
                        style: const TextStyle(
                            fontSize: 15, overflow: TextOverflow.fade),
                      ),
                      subtitle: Text(
                          "Name: ${streamSnapShot.data?.docs[index]['name']}"),
                      trailing: DropdownButton(
                        items: role
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "$e",
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            )
                            .toList(),
                        value: userRole,
                        onChanged: (value) {
                          streamSnapShot.data?.docs[index].reference
                              .update({'role': value});
                          setState(
                            () {
                              userRole = value.toString();
                            },
                          );
                        },
                      ),
                    );
                  }
                  if (streamSnapShot.hasError) {
                    return const Text(
                        "somthing went Wrong! please check your connection");
                  } else {
                    return const Text("please wait");
                  }
                },
              ),
            ),
            addVerticalSpace(15),
            LongButton(
                theFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataAnalysis(
                          userNumber: histogramDataAge.length,
                          histogramDataAge: histogramDataAge,
                          histogramDataHeight: histogramDataHeight,
                          histogramDataWeight: histogramDataWeight,
                          femaleNumber: femaleNumber,
                          maleNumber: maleNumber,
                          gainWeightNumber: gainWeightNumber,
                          keepFitNumber: keepFitNumber,
                          loseWeightNumber: loseWeightNumber),
                    ),
                  );
                },
                theText: "Data Analysis")
          ],
        );
      },
    );
  }

  TextField searchTextField() {
    return TextField(
      controller: searchController,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      onChanged: (value) {
        setState(() {
          searchText = value.toLowerCase();
        });
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();
                searchText = "";
                FocusManager.instance.primaryFocus?.unfocus();
              });
            },
            icon: Icon(
              Icons.clear,
              color: searchText.isNotEmpty ? backgrounColor : Colors.grey,
            )),
        suffixIconColor: backgrounColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1.5,
            color: backgrounColor,
          ),
        ),
        hintText: "Search by email",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1.5,
            color: backgrounColor,
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.y);
  final double y;
}
