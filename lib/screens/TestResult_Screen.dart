import 'package:Sorteerhoed/utils/User.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestResultScreen extends StatefulWidget {
  TestResultScreen({Key key}) : super(key: key);

  @override
  State<TestResultScreen> createState() => _TestResultState();
}

class _TestResultState extends State<TestResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      User.specialisation,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Text(
                      "The results are shown in percentages\n\n How higher the percentage, the better you match",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            _createChartWidget(),
          ],
        ),
      ),
    );
  }

  Widget _createChartWidget() {
    var data = [
      PPerSpec("FICT", User.specialisationPoints[0]),
      PPerSpec("IAT", User.specialisationPoints[1]),
      PPerSpec("SE", User.specialisationPoints[2]),
      PPerSpec("BDAM", User.specialisationPoints[3]),
    ];

    var series = [
      charts.Series(
        domainFn: (PPerSpec percentage, _) => percentage.specialisation,
        measureFn: (PPerSpec percentage, _) => percentage.percentage,
        data: data,
        labelAccessorFn: (PPerSpec percentage, _) =>
        '${percentage.percentage.toString()} %',
        id: "Percentage",
      )
    ];

    return Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 300,
        child: charts.BarChart(
          series,
          animate: false,
          barRendererDecorator: new charts.BarLabelDecorator<String>(),
          domainAxis: new charts.OrdinalAxisSpec(),
        ),
      ),
    );
  }
}

class PPerSpec {
  final String specialisation;
  final int percentage;

  PPerSpec(this.specialisation, this.percentage);
}
