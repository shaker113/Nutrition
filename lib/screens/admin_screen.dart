import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fina/models/firestore_refrences.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController searchController = TextEditingController();
  late List<_ChartData> _heightChartData;
  String searchText = '';
  @override
  void initState() {
    // _heightChartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          userList(),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            title: ChartTitle(text: "avrage height"),
            primaryXAxis: NumericAxis(
              title: AxisTitle(text: "height in cm"),
              minimum: 110,
              maximum: 230,
              interval: 5,
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(color: Colors.transparent),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              // title: AxisTitle(text: "height in cm"),
              minimum: 0,
              maximum: 100,
              interval: 20,
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(color: Colors.transparent),
            ),
            series: <ChartSeries>[
              HistogramSeries<ChartData1, double>(
                enableTooltip: true,
                dataSource: histogramData,
                showNormalDistributionCurve: true,
                curveColor: const Color.fromRGBO(192, 108, 132, 1),
                binInterval: 20,
                // borderWidth: 2,
                width: 0.2,
                // markerSettings: const MarkerSettings(
                //     height: 10, width: 10, isVisible: true),
                yValueMapper: (ChartData1 data, _) => data.y,
              )
            ],
          )
        ],
      ),
    );
  }

  final List<ChartData1> histogramData = <ChartData1>[
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(110),
    ChartData1(180),
    ChartData1(180),
    ChartData1(180),
    ChartData1(180),
    ChartData1(180),
    ChartData1(180),
    ChartData1(180),
    ChartData1(180),
    ChartData1(180),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(125),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(120),
    ChartData1(180),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(180),
    ChartData1(180),
    ChartData1(160),
    ChartData1(160),
    ChartData1(160),
    ChartData1(160),
    ChartData1(160),
    ChartData1(160),
    ChartData1(160),
    ChartData1(160),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(186),
    ChartData1(160),
  ];

  List<_ChartData> getChartData() {
    final List<_ChartData> heightChartData = [
      _ChartData(170, 100),
      _ChartData(180, 90),
      _ChartData(190, 90),
      _ChartData(160, 80),
      _ChartData(115, 50),
    ];
    return heightChartData;
  }

  Container userList() {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      child: Column(
        children: [
          TextField(
            controller: searchController,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            onChanged: (value) {
              setState(() {
                searchText = value.toLowerCase();
              });
            },
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          SizedBox(
            height: 350,
            child: StreamBuilder(
              stream: searchText.isNotEmpty
                  ? userCollection.orderBy('name').startAt([searchText]).endAt(
                      ['$searchText\uf8ff']).snapshots()
                  : userCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: streamSnapShot.data?.docs.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    List role = ["admin", "user"];
                    String userRole = streamSnapShot.data!.docs[index]['role'];
                    if (streamSnapShot.hasData) {
                      return ListTile(
                        title: Text(
                          "Email: ${streamSnapShot.data?.docs[index]['email']}",
                          style: const TextStyle(fontSize: 15),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final double x;
  final int y;
}

class ChartData1 {
  ChartData1(this.y);
  final double y;
}
