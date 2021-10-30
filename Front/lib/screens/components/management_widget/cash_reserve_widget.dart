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
          child: SfCartesianChart(
              onChartTouchInteractionDown: (_Cash_Reserve_Widget) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => cash_reserve()));
              },
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                labelStyle: TextStyle(fontFamily:'applesdneom', fontSize:35.w),

              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                numberFormat: NumberFormat.compact(),
                labelStyle: TextStyle(fontFamily:'applesdneom', fontSize:35.w),
              ),
              plotAreaBorderWidth:0,
              palette: <Color>[
                Colors.teal,
              ],
              series: <ChartSeries>[
                BarSeries<ChartData, double>(
                    dataSource: chartdata,
                    xValueMapper: (ChartData sales, _) => sales.x,
                    yValueMapper: (ChartData sales, _) => sales.y,

                    dataLabelSettings: DataLabelSettings(
                        // Renders the data label
                        isVisible: true),
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
                      '현금보유액',
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
                  width: 1000.w,
                  height: 310.w,
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
