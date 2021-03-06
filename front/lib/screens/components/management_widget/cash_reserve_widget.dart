import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/cash_reserve.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:flutter_app/screens/management/management_screen.dart';

//작은 위젯
class Cash_Reserve_Widget extends StatefulWidget {
  @override
  _Cash_Reserve_Widget createState() => _Cash_Reserve_Widget();
}

class _Cash_Reserve_Widget extends State<Cash_Reserve_Widget> {
  List<ChartData> cashData = [];

  @override
  Widget build(BuildContext context) {
    bool isScrolling = false;
    return FutureBuilder(
        future: conn.sendQuery(
            'SELECT YEAR(RecordedDate) as Year, SUM(Money) * 1000 as Money FROM Money WHERE Category=\'MONEY\' GROUP BY Year ORDER BY Year;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            for (int i = 0; i <= min(result.length, 2); i++) {
              cashData.add(ChartData((double.parse(result[i]['Year'])).round(),
                  double.parse(result[i]['Money'])));
            }
            if (double.parse(result[2]['Year']) > 200000000000)
              state[0] = 'safe';
            else if (double.parse(result[2]['Year']) > 170000000000) {
              state[0] = 'warning';
            } else {
              state[0] = 'danger';
            }
            return BoxWidget('현금보유액', state[0], 'wide').make(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => cash_reserve()));
                },
                dbRelatedContentBuilder: SfCartesianChart(
                    onChartTouchInteractionMove: (_Cash_Reserve_Widget) {
                      isScrolling = true;
                    },
                    onChartTouchInteractionUp: (_Cash_Reserve_Widget) {
                      if (isScrolling == false) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => cash_reserve()));
                      }
                      isScrolling = false;
                    },
                    onChartTouchInteractionDown: (_Cash_Reserve_Widget) {
                      isScrolling = false;
                    },
                    primaryXAxis: CategoryAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      labelStyle:
                          TextStyle(fontFamily: 'applesdneom', fontSize: 35.w),
                    ),
                    primaryYAxis: NumericAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      numberFormat: NumberFormat.compact(locale: "ko_KR"),
                      labelStyle:
                          TextStyle(fontFamily: 'applesdneom', fontSize: 35.w),
                    ),
                    plotAreaBorderWidth: 0,
                    palette: <Color>[
                      Colors.teal,
                    ],
                    series: <ChartSeries>[
                      BarSeries<ChartData, int>(
                          dataSource: cashData,
                          xValueMapper: (ChartData cash, _) => cash.x,
                          yValueMapper: (ChartData cash, _) => cash.y,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          width: 0.6,
                          spacing: 0.2),
                    ]));
          } else {
            return Text('불러오는 중');
          }
        });
  }
}

class ChartData {
  ChartData(this.x, this.y);

  int x;
  double y;
}
