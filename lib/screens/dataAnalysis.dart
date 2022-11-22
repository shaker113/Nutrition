import 'package:fina/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../data/data.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DataAnalysis extends StatefulWidget {
  List<ChartData> histogramDataHeight;
  List<ChartData> histogramDataWeight;
  List<ChartData> histogramDataAge;
  int maleNumber;
  int femaleNumber;
  int keepFitNumber, gainWeightNumber, loseWeightNumber;
  DataAnalysis(
      {super.key,
      required this.histogramDataHeight,
      required this.histogramDataWeight,
      required this.histogramDataAge,
      required this.femaleNumber,
      required this.maleNumber,
      required this.gainWeightNumber,
      required this.keepFitNumber,
      required this.loseWeightNumber});

  @override
  State<DataAnalysis> createState() => _DataAnalysisState();
}

class _DataAnalysisState extends State<DataAnalysis> {
  List<ChartData> histogramDataHeight = <ChartData>[];
  List<ChartData> histogramDataWeight = <ChartData>[];
  List<ChartData> histogramDataAge = <ChartData>[];
  int maleNumber = 0;
  int femaleNumber = 0;
  int keepFitNumber = 0, gainWeightNumber = 0, loseWeightNumber = 0;
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

  double allUsersHeight = 0;
  double heightAverage = 0;
  double allUsersWeight = 0;
  double weightAverage = 0;
  double allUsersage = 0;
  double ageAverage = 0;
  double averageGender = 0;
  double averageGain = 0, averageLose = 0, averageFit = 0;

  @override
  void initState() {
    getAllUsersData();

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
    averageGain = widget.gainWeightNumber /
        (widget.gainWeightNumber +
            widget.loseWeightNumber +
            widget.keepFitNumber) *
        100;
    averageLose = widget.loseWeightNumber /
        (widget.gainWeightNumber +
            widget.loseWeightNumber +
            widget.keepFitNumber) *
        100;
    averageFit = widget.keepFitNumber /
        (widget.gainWeightNumber +
            widget.loseWeightNumber +
            widget.keepFitNumber) *
        100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: backgrounColor,
        title: const Text("Statics"),
        centerTitle: true,
        elevation: 0,
      ),
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
              SfCircularChart(
                title: ChartTitle(text: 'Goal Ratio'),
                legend: Legend(isVisible: true),
                series: goalRatioSeries(),
              ),
              addVerticalSpace(10),
              SfCircularChart(
                title: ChartTitle(text: 'Gender Ratio'),
                legend: Legend(isVisible: false),
                series: genderRatioSeries(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieSeries<pieChartdata, String>> goalRatioSeries() {
    return <PieSeries<pieChartdata, String>>[
      PieSeries<pieChartdata, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '5%',
          dataSource: <pieChartdata>[
            pieChartdata(averageFit,
                "Keep Fit\n${averageFit.toStringAsFixed(2)} %", "Keep Fit"),
            pieChartdata(
                averageGain,
                "Gain Weight\n${averageGain.toStringAsFixed(2)} %",
                "Gain Weight"),
            pieChartdata(
                averageLose,
                "Loss Weight\n${averageLose.toStringAsFixed(2)} %",
                "Loss Weight"),
          ],
          xValueMapper: (pieChartdata data, _) => data.xValue,
          yValueMapper: (pieChartdata data, _) => data.yValue,
          dataLabelMapper: (pieChartdata data, _) => data.title,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }

  List<PieSeries<pieChartdata, String>> genderRatioSeries() {
    return <PieSeries<pieChartdata, String>>[
      PieSeries<pieChartdata, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '5%',
          dataSource: <pieChartdata>[
            pieChartdata(
                averageGender, "Male\n${averageGender.round()} %", "Male"),
            pieChartdata(
                (100 - averageGender),
                "Female\n${(100 - averageGender).toStringAsFixed(2)} %",
                "Female"),
          ],
          xValueMapper: (pieChartdata data, _) => data.xValue,
          yValueMapper: (pieChartdata data, _) => data.yValue,
          dataLabelMapper: (pieChartdata data, _) => data.title,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
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

class pieChartdata {
  final double yValue;
  final String title, xValue;
  pieChartdata(this.yValue, this.title, this.xValue);
}
