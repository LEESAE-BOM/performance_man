import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/labor_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//작은 위젯
class Labor_Ratio_Widget extends StatefulWidget {
  @override
  _Labor_Ratio_Widget createState() => _Labor_Ratio_Widget();
}

class _Labor_Ratio_Widget extends State<Labor_Ratio_Widget> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('간접인건비', 202031684, '44%'),
      ChartData('직접인건비', 275146845, '56'),
    ];

    Widget chartSection = Center(
        child: Container(
            child: SfCircularChart(palette: <Color>[
      Colors.indigo,
      Colors.lightBlueAccent,
    ], series: <CircularSeries>[
      // Render pie chart
      PieSeries<ChartData, String>(radius: '100%',
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelMapper: (ChartData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 50.w, fontFamily: 'applesdneob'))),
    ])));

    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => labor_ratio()));
        },
        child: Container(
            width: 520.w,
            height: 400.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.w, bottom: 10.w, left: 35.w),
                child: Row(
                  children: [
                    Text(
                      '인건비율',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 35.w,
                          fontFamily: 'applesdneom'),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'image/warning.png',
                      width: 20.w,
                      height: 20.w,
                    ),
                  ],
                ),
              ),
              Container(
                width: 520.w,
                height: 320.w,
                child: chartSection,
              )
            ])));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text);

  final String x;
  final double y;
  final String text;
}
