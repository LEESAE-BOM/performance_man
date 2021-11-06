import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/labor_production_rate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:intl/intl.dart';
import 'dart:math';

//큰 위젯
class Labor_Production_Rate_Widget extends StatefulWidget {
  @override
  _Labor_Production_Rate_Widget createState() =>
      _Labor_Production_Rate_Widget();
}

class _Labor_Production_Rate_Widget
    extends State<Labor_Production_Rate_Widget> {
  List<ChartData> laborData = [];

  @override
  Widget build(BuildContext context) {
    return BoxWidget('노동생산성', 'safe', 'wide').make(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => labor_production_rate()));
        },
        dbRelatedContentBuilder: FutureBuilder(
          future: conn.sendQuery(
              'SELECT MONTH(RecordedDate) as Month, Productivity FROM Productivity ORDER BY RecordedDate;'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var result = snapshot.data as List<Map<String, dynamic>>;

              print('결과 : ${result.length}');

              for (int i = 0; i < min(result.length, 12); i++)
                laborData.add(ChartData(double.parse(result[i]['Month']),
                    double.parse(result[i]['Productivity'])));

              return SfCartesianChart(
                onChartTouchInteractionDown: (_Labor_Production_Rate_Widget) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => labor_production_rate()));
                },


                primaryXAxis: NumericAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    isVisible: true),

                primaryYAxis: NumericAxis(
                    isVisible: true,
                    edgeLabelPlacement: EdgeLabelPlacement.shift),

                series: <ChartSeries>[
                  AreaSeries<ChartData, double>(
                    dataSource: laborData,
                    xValueMapper: (ChartData labors, _) => labors.x,
                    yValueMapper: (ChartData labors, _) => labors.y,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                    color: Colors.indigo,
                  ),
                ],

                plotAreaBorderWidth: 0,

              );

            } else {
              return Text('불러오는 중');
            }
          },
        ));
  }

  /*late List<Chart_Data> _chartData;

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
  }*/
}

class ChartData {
  ChartData(this.x, this.y);

  double x;
  double y;
}
