import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/labor_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Labor_Ratio_Widget extends StatefulWidget {
  @override
  _Labor_Ratio_Widget createState() => _Labor_Ratio_Widget();
}

class _Labor_Ratio_Widget extends State<Labor_Ratio_Widget> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('간접인건비', 202031684,'44%'),
      ChartData('직접인건비', 275146845,'56'),
    ];

    Widget chartSection = Center(
        child: Container(
            width: 250.0,
            height: 250.0,
            child: SfCircularChart(palette: <Color>[
              Colors.indigo,
              Colors.lightBlueAccent,
            ], series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelMapper: (ChartData data, _) => data.text,
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true)),
            ])));

    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => labor_ratio()));
        },
        child: Container(
            height: 300,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            //margin: EdgeInsets.all(30),
            child: Column(children: <Widget>[
              Container(
                height: 40,
                padding: EdgeInsets.only(top: 10, bottom: 5, left: 10),
                child: Row(
                  children: [
                    Text(
                      '인건비율',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    Image.asset(
                      'image/warning.png',
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                child: chartSection,
              )
            ])));
  }
}

class ChartData {
  ChartData(this.x, this.y,this.text);

  final String x;
  final double y;
  final String text;
}
