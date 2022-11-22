import 'package:fina/screens/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/data.dart';

class DataAnalysis extends StatefulWidget {
  List<ChartData> histogramDataHeight;
  List<ChartData> histogramDataWeight;
  List<ChartData> histogramDataAge;
  int maleNumber;
  int femaleNumber;
  DataAnalysis(
      {super.key,
      required this.histogramDataHeight,
      required this.histogramDataWeight,
      required this.histogramDataAge,
      required this.femaleNumber,
      required this.maleNumber});

  @override
  State<DataAnalysis> createState() => _DataAnalysisState();
}

class _DataAnalysisState extends State<DataAnalysis> {
  double allUsersHeight = 0;
  double heightAverage = 0;
  double allUsersWeight = 0;
  double weightAverage = 0;
  double allUsersage = 0;
  double ageAverage = 0;
  double averageGender = 0;

  @override
  void initState() {
    for (var i = 0; i < widget.histogramDataHeight.length; i++) {
      allUsersHeight += widget.histogramDataHeight[i].y;
      setState(() {
        heightAverage = allUsersHeight / widget.histogramDataHeight.length;
      });
    }
    for (var i = 0; i < widget.histogramDataWeight.length; i++) {
      allUsersWeight += widget.histogramDataWeight[i].y;
      setState(() {
        weightAverage = allUsersWeight / widget.histogramDataWeight.length;
      });
    }
    for (var i = 0; i < widget.histogramDataAge.length; i++) {
      allUsersage += widget.histogramDataAge[i].y;
      setState(() {
        ageAverage = allUsersage / widget.histogramDataAge.length;
      });
    }
    averageGender =
        widget.maleNumber / (widget.maleNumber + widget.femaleNumber) * 100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              agrChart(
                  "Average height =${heightAverage.toStringAsFixed(2)} cm",
                  "height in cm",
                  "cm",
                  110,
                  230,
                  5,
                  0,
                  2,
                  5,
                  widget.histogramDataHeight),
              agrChart(
                  "Average weight=${weightAverage.toStringAsFixed(2)} kg",
                  "Weight in kg",
                  "Kg",
                  20,
                  180,
                  10,
                  0,
                  2,
                  5,
                  widget.histogramDataWeight),
              agrChart(
                  "Average age=${ageAverage.toStringAsFixed(2)} years",
                  "age in years",
                  "years",
                  14,
                  80,
                  5,
                  0,
                  2,
                  2,
                  widget.histogramDataAge),
              Text(
                  "${averageGender.round()}% Male \n${100 - averageGender.round()}% Female"),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Gender ratio\n",
                  style: customTextStyle.headlineSmall,
                  children: [
                    TextSpan(
                      text: "${averageGender.round()}% Male",
                    ),
                    TextSpan(
                      text: " ${100 - averageGender.round()}% Female",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: 300,
                child: Table(
                  textDirection: TextDirection.ltr,
                  border: TableBorder.all(
                      width: 1.5, borderRadius: BorderRadius.circular(10)),
                  children: [
                    TableRow(children: [
                      tableText("Gender ratio"),
                      const SizedBox(),
                      const SizedBox(),
                    ]),
                    TableRow(children: [
                      tableText("Gender"),
                      tableText("Male"),
                      tableText("Female")
                    ]),
                    TableRow(children: [
                      tableText("Percentage"),
                      tableText("${averageGender.round()}%"),
                      tableText("${100 - averageGender.round()}%")
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: 300,
                child: Table(
                  textDirection: TextDirection.ltr,
                  border: TableBorder.all(
                      width: 1.5, borderRadius: BorderRadius.circular(10)),
                  children: [
                    TableRow(children: [
                      tableText("Goal ratio"),
                      const SizedBox(),
                    ]),
                    TableRow(children: [
                      tableText("lose weight"),
                      tableText("to do"),
                    ]),
                    TableRow(children: [
                      tableText("Gain weight"),
                      tableText("to do"),
                    ]),
                    TableRow(children: [
                      tableText("keep fit"),
                      tableText("to do"),
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container tableText(String theText) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      child: Text(
        theText,
        textAlign: TextAlign.center,
        style: customTextStyle.headlineSmall,
      ),
    );
  }

  SfCartesianChart agrChart(
      String title,
      String axisTitle,
      String unit,
      double xmin,
      double xmax,
      double xint,
      double ymin,
      double yint,
      double binInterval,
      List<ChartData> histogramData) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: title),
      primaryXAxis: NumericAxis(
        title: AxisTitle(text: axisTitle),
        minimum: xmin,
        maximum: xmax,
        interval: xint,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        minimum: ymin,
        interval: yint,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
      ),
      tooltipBehavior: TooltipBehavior(
          enable: true,
          format: 'point.x $unit',
          header: '',
          canShowMarker: false),
      series: <ChartSeries>[
        HistogramSeries<ChartData, double>(
          enableTooltip: true,
          legendItemText: title,
          dataSource: histogramData,
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          binInterval: binInterval,
          // borderWidth: 2,
          curveWidth: 2.5,
          width: 0.9,
          curveDashArray: <double>[12, 3, 3, 3],
          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
    );
  }
}
