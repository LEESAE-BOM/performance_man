import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/capacity_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//작은 위젯
class Capacity_Ratio_Widget extends StatefulWidget {
  @override
  _Capacity_Ratio_Widget createState() => _Capacity_Ratio_Widget();
}

class _Capacity_Ratio_Widget extends State<Capacity_Ratio_Widget> {
  late List<Chart_Data>? _chart_Data;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _chart_Data = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data> getChartData() {
    final List<Chart_Data> getChartData = [
      Chart_Data('Completed', 43, Colors.blue),
      Chart_Data('unCompleted', 57, Colors.grey),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    Widget chartSection = SfCircularChart(
        onChartTouchInteractionDown: (_Capacity_Ratio_Widget) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => capacity_ratio()));
        },
        series: <CircularSeries>[
      DoughnutSeries<Chart_Data, String>(radius: '100%',
          dataSource: _chart_Data,
          xValueMapper: (Chart_Data data, _) => data.x,
          yValueMapper: (Chart_Data data, _) => data.y,
          pointColorMapper: (Chart_Data data, _) => data.color,
          dataLabelSettings: DataLabelSettings(
             showCumulativeValues: false,
              showZeroValue: false,
              isVisible: true,
              textStyle: TextStyle(fontSize: 30.w, fontFamily: 'applesdneob')))
    ]);

    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => capacity_ratio()));
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
                      '설비가동율',
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
              Container(width: 510.w, height: 310.w, child: chartSection)
            ])));
  }
}

class Chart_Data {
  Chart_Data(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
