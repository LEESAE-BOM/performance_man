import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/order_amount.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//작은 위젯
class Order_Amount_Widget extends StatefulWidget {
  @override
  _Order_Amount_Widget createState() => _Order_Amount_Widget();
}

class _Order_Amount_Widget extends State<Order_Amount_Widget> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('수금', 40000, '40%'),
      ChartData('미수금', 50000, '50%'),
      ChartData('채권', 10000, '10%'),
    ];

    Widget chartSection = Center(
        child: Container(
            child: SfCircularChart(
                onChartTouchInteractionDown: (_Order_Amount_Widget) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => order_amount()));
                },
                palette: <Color>[
              Colors.indigoAccent,
              Colors.blueGrey,
              Colors.indigo,
            ], series: <CircularSeries>[
      // Render pie chart
      PieSeries<ChartData, String>(radius: '100%',
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelMapper: (ChartData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 40.w, fontFamily: 'applesdneob'))),
    ])));
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => order_amount()));
        },
        child: Container(
            width: 510.w,
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
                      '수주금액',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 35.w,
                          fontFamily: 'applesdneom'),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'image/safe.png',
                      width: 20.w,
                      height: 20.w,
                    ),
                  ],
                ),
              ),
              Container(
                width: 510.w,
                height: 310.w,
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
