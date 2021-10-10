import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/expected_profit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//큰 위젯
class Expected_Profit_Widget extends StatefulWidget {
  @override
  _Expected_Profit_Widget createState() => _Expected_Profit_Widget();
}

class _Expected_Profit_Widget extends State<Expected_Profit_Widget> {
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartdata = [
      SalesData('1월', 2.0),
      SalesData('2월', 2.8),
      SalesData('3월', 3.6),
      SalesData('4월', 3.0),
      SalesData('5월', 4.5),
      SalesData('6월', 4.0),
      SalesData('7월', 4.2),
      SalesData('8월', 3.8),
      SalesData('9월', 3.9)
    ];
    Widget chartSection = Center(
      child: Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            plotAreaBorderWidth: 0,
            series: <CartesianSeries>[
              FastLineSeries<SalesData, String>(
                  name: '2021',
                  dataSource: chartdata,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(
                      // Renders the data label
                      isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
            ]),
      ),
    );

    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => expected_profit()));
        },
        child: Container(
            width: 1060.w,
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
                      '추정수익률',
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
              Container(width: 1060.w, height: 320.w, child: chartSection)
            ])));
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String? month;
  final double sales;
}
