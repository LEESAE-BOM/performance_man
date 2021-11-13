import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/development_completion_rate.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';

//큰 위젯
class Developmentcompletion_Rate_Widget extends StatefulWidget {
  @override
  _Developmentcompletion_Rate_Widget createState() =>
      _Developmentcompletion_Rate_Widget();
}

class _Developmentcompletion_Rate_Widget extends State<Developmentcompletion_Rate_Widget> {
  late TooltipBehavior _toolTipBehavior;
  List<ChartData> developmentData = [];

  void initState() {
    _toolTipBehavior = TooltipBehavior();
    for(int i=1; i<=12; i++)
      developmentData.add(ChartData('$i월', 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isScrolling = false;

    return BoxWidget("개발완료율", "safe", "wide").make(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => development_completion_rate()));
        },
        dbRelatedContentBuilder: FutureBuilder(
            future: conn.sendQuery(
                'SELECT RecordedDate, Goal, Achievement FROM CompletionRate WHERE Category=\'DVLCM\' ORDER BY Achievement/Goal DESC;'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var result = snapshot.data as List<Map<String, dynamic>>;
                var thisMonth = DateTime.parse(result[0]['RecordedDate']).month;

                for (int i = 1; i < min(thisMonth, result.length); i++)
                  developmentData[thisMonth - i].data =
                      double.parse(result[i]['Achievement']) /
                          double.parse(result[i]['Goal']) *
                          100;

                return SfCartesianChart(
                  tooltipBehavior: _toolTipBehavior,
                  onChartTouchInteractionMove: (_Developmentcompletion_Rate_Widget){
                    isScrolling = true;
                  },
                  onChartTouchInteractionUp: (_Developmentcompletion_Rate_Widget) {
                    if(isScrolling == false) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => development_completion_rate()));
                    }
                    isScrolling = false;
                  },
                  onChartTouchInteractionDown: (_Developmentcompletion_Rate_Widget){
                    isScrolling = false;
                  },
                  palette: <Color>[
                    Colors.teal,
                  ],
                  series: <ChartSeries>[
                    LineSeries<ChartData, String>(
                        dataSource: developmentData,
                        xValueMapper: (ChartData sales, _) => sales.month,
                        yValueMapper: (ChartData sales, _) => sales.data,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
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
            }
            )
    );
  }
}

class ChartData {
  ChartData(this.month, this.data);

  String month;
  double data;
}
