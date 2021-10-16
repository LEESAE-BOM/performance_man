import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/outsourcing_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//작은 위젯
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
            child: SfCircularChart(
                onChartTouchInteractionDown: (_Outsourcing_Ratio_Widget) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => outsourcing_ratio()));
                },
                palette: <Color>[
                  Colors.blue,
                  Colors.grey,
                ],
                series: <CircularSeries>[
      // Render pie chart
      PieSeries<ChartData, String>(radius: '100%',
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 50.w, fontFamily: 'applesdneob'),
              // Positioning the data label
              labelPosition: ChartDataLabelPosition.inside)),
    ])));
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => outsourcing_ratio()));
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
                      '외주비율',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 35.w,
                          fontFamily: 'applesdneom'),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'image/danger.png',
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
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
