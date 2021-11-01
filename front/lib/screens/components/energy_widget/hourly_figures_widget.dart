import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/hourly_figures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//작은 위젯
class Hourly_Figures_Widget extends StatefulWidget {
  @override
  _Hourly_Figures_Widget createState() => _Hourly_Figures_Widget();
}

class _Hourly_Figures_Widget extends State<Hourly_Figures_Widget> {
  @override
  late List<Sales_Data> _Sales_Data;

  void initState() {
    _Sales_Data = getChartData();
    super.initState();
  }

  List<Sales_Data> getChartData() {
    final List<Sales_Data> getChartData = [
      Sales_Data('12~01', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('01~02', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('02~03', 1,Color.fromRGBO(226,226,226,1)),
      Sales_Data('03~04', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('04~05', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('05~06', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('06~07', 1,Color.fromRGBO(226,226,226,1)),
      Sales_Data('07~08', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('08~09', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('09~10', 1, Color.fromRGBO(225,72,72,1)),
      Sales_Data('10~11', 1, Color.fromRGBO(226,226,226,1)),
      Sales_Data('11~12', 1, Color.fromRGBO(226,226,226,1)),
    ];
    return getChartData;
  }

  Widget build(BuildContext context) {
    Widget chartSection = Center(
        child: SfCircularChart(
            onChartTouchInteractionDown: (_Hourly_Figures_Widget) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => hourly_figures()));
            },
            annotations: <CircularChartAnnotation>[
      CircularChartAnnotation(
          widget: Container(
              child: Text('9시~10시',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 32.sp,
                      fontFamily: 'applesdneoeb'))))
    ],
            series: <CircularSeries>[
      // Renders doughnut chart
      DoughnutSeries<Sales_Data, String>(
          radius: '100%',
          dataSource: _Sales_Data,
          pointColorMapper: (Sales_Data data, _) => data.color,
          xValueMapper: (Sales_Data data, _) => data.x,
          yValueMapper: (Sales_Data data, _) => data.y,
      ),
      // explode: true
    ]));
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => hourly_figures()));
        },
        child: Container(
            width: 510.w,
            height: 400.w,
            decoration: BoxDecoration(
              //color: Colors.white,
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
                      '시간별 에너지',
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

class Sales_Data {
  Sales_Data(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
