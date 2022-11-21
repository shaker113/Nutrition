import 'package:fina/screens/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                  "average height =${heightAverage.toStringAsFixed(2)} cm",
                  "height in cm",
                  110,
                  230,
                  5,
                  0,
                  10,
                  2,
                  5,
                  widget.histogramDataHeight),
              agrChart(
                  "average Weight=${weightAverage.toStringAsFixed(2)} kg",
                  "Weight in kg",
                  20,
                  180,
                  10,
                  0,
                  10,
                  2,
                  5,
                  widget.histogramDataWeight),
              agrChart(
                  "average age=${ageAverage.toStringAsFixed(2)} years",
                  "age in years",
                  14,
                  80,
                  5,
                  0,
                  10,
                  2,
                  2,
                  widget.histogramDataAge),
              Text(
                  "${averageGender.round()}% Male \n${100 - averageGender.round()}% Female")
            ],
          ),
        ),
      ),
    );
  }

  SfCartesianChart agrChart(
      String title,
      String axisTitle,
      double xmin,
      double xmax,
      double xint,
      double ymin,
      double ymax,
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
        maximum: ymax,
        interval: yint,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
      ),
      tooltipBehavior: TooltipBehavior(
          enable: true, format: 'point.x ', header: '', canShowMarker: false),
      series: <ChartSeries>[
        HistogramSeries<ChartData, double>(
          enableTooltip: true,
          legendItemText: title,
          dataSource: histogramData,
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          binInterval: binInterval,
          // borderWidth: 2,
          width: 0.9,

          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
    );
  }
}
