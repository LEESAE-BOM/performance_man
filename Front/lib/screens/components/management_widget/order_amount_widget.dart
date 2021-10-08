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
            //width:MediaQuery.of(context).size.width*0.5,
            //height: 250.0,
            width: 540.w,
            height: 152,
            child: SfCircularChart(series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelMapper: (ChartData data, _) => data.text,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                  )),
            ])));
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => order_amount()));
        },
        child: Container(
            //height: 300,
           // width: MediaQuery.of(context).size.width*0.5,
            width: 540.w,
            height: 200,
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
               // height: 40,
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                child: Row(
                  children: [
                    Text(
                      '수주금액',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    SizedBox(width:5),
                    Image.asset(
                      'image/safe.png',
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                width: 540.w,
                height: 152,
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
