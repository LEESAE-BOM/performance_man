import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/labor_production_rate.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';
import 'dart:math';
import 'package:flutter_app/screens/factory/factory_screen.dart';

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
    bool isScrolling = false;
    return FutureBuilder(
        future: conn.sendQuery(
            'SELECT RecordedDate, Productivity FROM Productivity ORDER BY RecordedDate DESC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            var thisMonthProductivity = double.parse(result[0]['Productivity']);
            var previousMonthProductivity =
            double.parse(result[1]['Productivity']);

            int diff = thisMonthProductivity.round() -
                previousMonthProductivity.round();

            if (diff > -2)
              state[2] = 'safe';
            else if (diff < -10)
              state[2] = 'warning';
            else
              state[2] = 'danger';

            return BoxWidget('노동생산성', state[2], 'wide').make(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => labor_production_rate()));
                },
                dbRelatedContentBuilder: FutureBuilder(
                    future: conn.sendQuery(
                        'SELECT MONTH(RecordedDate) as Month, Productivity FROM Productivity ORDER BY RecordedDate;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result = snapshot.data as List<Map<String, dynamic>>;

                        for (int i = 0; i < min(result.length, 12); i++) {
                          laborData.add(ChartData(
                              '${double.parse(result[i]['Month'])}월',
                              double.parse(result[i]['Productivity'])));
                        }
                        return SfCartesianChart(
                          onChartTouchInteractionMove:
                              (_Labor_Production_Rate_Widget) {
                            isScrolling = true;
                          },
                          onChartTouchInteractionUp:
                              (_Labor_Production_Rate_Widget) {
                            if (isScrolling == false) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      labor_production_rate()));
                            }
                            isScrolling = false;
                          },
                          onChartTouchInteractionDown:
                              (_Labor_Production_Rate_Widget) {
                            isScrolling = false;
                          },
                          primaryXAxis: CategoryAxis(
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                              majorGridLines: MajorGridLines(width: 0),
                              isVisible: true),
                          primaryYAxis: NumericAxis(
                              isVisible: true,
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                            majorGridLines: MajorGridLines(width: 0)),
                          series: <ChartSeries>[
                            AreaSeries<ChartData, String>(
                              dataSource: laborData,
                              xValueMapper: (ChartData labors, _) => labors.x,
                              yValueMapper: (ChartData labors, _) => labors.y,
                              dataLabelSettings:
                              DataLabelSettings(isVisible: true,labelAlignment: ChartDataLabelAlignment.top),
                              color: Colors.indigo,
                            ),
                          ],
                          plotAreaBorderWidth: 0,
                        );
                      } else {
                        return Text.rich(TextSpan(text: '불러오는 중'));
                      }
                    }));
          } else {
            return Text.rich(TextSpan(text: '불러오는 중'));
          }
        });
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String? x;
  double y;
}
