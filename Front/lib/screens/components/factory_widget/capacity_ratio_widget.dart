import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/capacity_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  List<Chart_Data>  getChartData(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('Completed', 43, Colors.blue),
      Chart_Data('unCompleted', 57,  Colors.grey),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    Widget chartSection=
    SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<Chart_Data, String>(
                        dataSource: _chart_Data,
                        xValueMapper: (Chart_Data data, _) => data.x,
                        yValueMapper: (Chart_Data data, _) => data.y,
                        pointColorMapper:(Chart_Data data,  _) => data.color,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle:TextStyle(
                              fontSize: 25,
                              fontFamily: 'applesdneom'
                          )
                        )
                    )
                  ]
    );

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => capacity_ratio()));
        },
        child: Container(
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
            child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    child: Row(
                      children: [
                        Text(
                          '설비가동율',
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
                      width: 540.w,
                      height: 140,
                    child:chartSection
                  )
                ])));
  }
}
class Chart_Data {
  Chart_Data(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}