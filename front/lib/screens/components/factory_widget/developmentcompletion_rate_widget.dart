import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/development_completion_rate.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:flutter_app/screens/factory/factory_screen.dart';

//큰 위젯
class Developmentcompletion_Rate_Widget extends StatefulWidget {
  @override
  _Developmentcompletion_Rate_Widget createState() =>
      _Developmentcompletion_Rate_Widget();
}

class _Developmentcompletion_Rate_Widget
    extends State<Developmentcompletion_Rate_Widget> {
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isScrolling = false;

    return FutureBuilder(
        future: conn.sendQuery(
            'SELECT Label, RecordedDate, Achievement/Goal Rate FROM CompletionRate NATURAL JOIN CompletionGoal WHERE Category=\'DVLCM\' ORDER BY Label, Achievement/Goal DESC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            var label = result[0]['Label'];
            var achieveRate = double.parse(result[0]['Rate']) * 100;

            if (achieveRate > 80)
              state[1] = 'safe';
            else if (achieveRate > 50)
              state[1] = 'warning';
            else
              state[1] = 'danger';

            return BoxWidget("개발완료율", state[1], "wide").make(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => development_completion_rate()));
                },
                dbRelatedContentBuilder: FutureBuilder(
                    future: conn.sendQuery(
                        'SELECT Label, Year(RecordedDate) Year, Month(RecordedDate) Month, MAX(Achievement/Goal) Rate FROM CompletionRate NATURAL JOIN CompletionGoal WHERE Category=\'DVLCM\' GROUP BY Label, Year, Month ORDER BY Label, Year, Month;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;
                        List<ChartData> developmentData = [
                          for(int i=max(0, result.length - 12); i<result.length && result[i]['Label'] == label; i++)
                            ChartData('${result[i]['Month']}월', double.parse(result[i]['Rate']) * 100)
                        ];

                        return SfCartesianChart(
                          tooltipBehavior: _toolTipBehavior,
                          onChartTouchInteractionMove:
                              (_Developmentcompletion_Rate_Widget) {
                            isScrolling = true;
                          },
                          onChartTouchInteractionUp:
                              (_Developmentcompletion_Rate_Widget) {
                            if (isScrolling == false) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      development_completion_rate()));
                            }
                            isScrolling = false;
                          },
                          onChartTouchInteractionDown:
                              (_Developmentcompletion_Rate_Widget) {
                            isScrolling = false;
                          },
                          palette: <Color>[
                            Colors.teal,
                          ],
                          series: <ChartSeries>[
                            LineSeries<ChartData, String>(
                                dataSource: developmentData,
                                xValueMapper: (ChartData sales, _) =>
                                    sales.month,
                                yValueMapper: (ChartData sales, _) =>
                                    sales.data,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                markerSettings: MarkerSettings(
                                    isVisible: true,
                                    color: Colors.teal,
                                    borderColor: Colors.white)),
                          ],
                          primaryXAxis: CategoryAxis(
                            majorGridLines: MajorGridLines(width: 0),
                          ),
                          primaryYAxis: NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                          ),
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
  ChartData(this.month, this.data);

  String month;
  double data;
}
