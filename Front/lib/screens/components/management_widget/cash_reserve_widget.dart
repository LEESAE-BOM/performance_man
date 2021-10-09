import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/cash_reserve.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//작은 위젯
class Cash_Reserve_Widget extends StatefulWidget {
  @override
  _Cash_Reserve_Widget createState() => _Cash_Reserve_Widget();
}

class _Cash_Reserve_Widget extends State<Cash_Reserve_Widget> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartdata = [
      ChartData(2019, 253654978),
      ChartData(2020, 323456789),
      ChartData(2021, 450340890)
    ];
    Widget chartSection = Center(
      child: Container(
         // width: MediaQuery.of(context).size.width * 0.5,
         // height: 250,
          width: 520.w,
          height: 152,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                numberFormat: NumberFormat.compact(),
              ),
              plotAreaBorderWidth:0,
              series: <ChartSeries>[
                BarSeries<ChartData, double>(
                    dataSource: chartdata,
                    xValueMapper: (ChartData sales, _) => sales.x,
                    yValueMapper: (ChartData sales, _) => sales.y,

                    dataLabelSettings: DataLabelSettings(
                        // Renders the data label
                        isVisible: false),
                    width: 0.6,
                    spacing: 0.2),
              ])),
    );
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => cash_reserve()));
        },
        child: Container(
            //height: 300,
            //width: MediaQuery.of(context).size.width * 0.5,
            width: 520.w,
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
                      '현금보유액',
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
                  width: 520.w,
                  height: 152,
                child: chartSection
              )
            ])));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}
