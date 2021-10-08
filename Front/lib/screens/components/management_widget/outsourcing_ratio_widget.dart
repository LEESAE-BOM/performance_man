import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/outsourcing_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Outsourcing_Ratio_Widget extends StatefulWidget {
  @override
  _Outsourcing_Ratio_Widget createState() => _Outsourcing_Ratio_Widget();
}

class _Outsourcing_Ratio_Widget extends State<Outsourcing_Ratio_Widget> {

  final List<ChartData> chartData = [
    ChartData('A사', 45),
    ChartData('B사', 55),
  ];
  @override
  Widget build(BuildContext context) {
    Widget chartSection = Center(
        child: Container(
            height: 250.0,
            width:MediaQuery.of(context).size.width*0.5,
            child: SfCircularChart(
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          // Positioning the data label
                          labelPosition: ChartDataLabelPosition.inside)),
                ])));
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => outsourcing_ratio()));
        },
        child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width*0.5,
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
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                child: Row(
                  children: [
                    Text(
                      '외주비율',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    SizedBox(width:5),
                    Image.asset(
                      'image/danger.png',
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
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
