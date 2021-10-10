import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/labor_production_rate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//큰 위젯
class Labor_Production_Rate_Widget extends StatefulWidget {
  @override
  _Labor_Production_Rate_Widget createState() =>
      _Labor_Production_Rate_Widget();
}

class _Labor_Production_Rate_Widget
    extends State<Labor_Production_Rate_Widget> {
  late List<Chart_Data> _chartData;

  void initState() {
    _chartData = getChartData();

    super.initState();
  }

  List<Chart_Data> getChartData() {
    final List<Chart_Data> chartData = [
      Chart_Data(4, 60),
      Chart_Data(5, 51),
      Chart_Data(6, 152),
      Chart_Data(7, 202),
      Chart_Data(8, 259),
      Chart_Data(9, 500)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    Widget chartSection1 = Center(
        child: SfCartesianChart(
      series: <ChartSeries>[
        AreaSeries<Chart_Data, double>(
          dataSource: _chartData,
          xValueMapper: (Chart_Data labors, _) => labors.year,
          yValueMapper: (Chart_Data labors, _) => labors.labor,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
          color: Colors.indigo,
        ),
      ],
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift, isVisible: false),
      primaryYAxis: NumericAxis(
          isVisible: false, edgeLabelPlacement: EdgeLabelPlacement.shift),
      plotAreaBorderWidth: 0,
    ));
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => labor_production_rate()));
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
                      '노동생산성',
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
              Container(width: 1060.w, height: 320.w, child: chartSection1)
            ])));
  }
}

class Chart_Data {
  Chart_Data(this.year, this.labor);

  final double year;
  final double labor;
}
