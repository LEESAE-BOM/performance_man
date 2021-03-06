import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/capacity_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/screens/factory/factory_screen.dart';

class Capacity_Ratio_Widget extends StatefulWidget {
  @override
  _Capacity_Ratio_Widget createState() => _Capacity_Ratio_Widget();
}

class _Capacity_Ratio_Widget extends State<Capacity_Ratio_Widget> {
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
            'SELECT Goal, Achievement FROM CompletionRate NATURAL JOIN CompletionGoal WHERE Category=\'OPRCM\' ORDER BY RecordedDate DESC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            if (result.length > 0) {
              var goal = double.parse(result[0]['Goal']);
              var achievement = double.parse(result[0]['Achievement']);
              var achieveRate = (achievement / goal) * 100;

              List<ChartData> capacityData = [
                ChartData('complete', achieveRate),
                ChartData('uncomplete', 100 - achieveRate)
              ];

              if (achieveRate > 70)
                state[0] = 'safe';
              else if (achieveRate > 50)
                state[0] = 'warning';
              else
                state[0] = 'danger';

              return BoxWidget('설비가동률', state[0], 'narrow').make(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => capacity_ratio()));
                  },
                  dbRelatedContentBuilder: SfCircularChart(
                      tooltipBehavior: _toolTipBehavior,
                      onChartTouchInteractionMove: (_Capacity_Ratio_Widget) {
                        isScrolling = true;
                      },
                      onChartTouchInteractionUp: (_Capacity_Ratio_Widget) {
                        if (isScrolling == false) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => capacity_ratio()));
                        }
                        isScrolling = false;
                      },
                      onChartTouchInteractionDown: (_Capacity_Ratio_Widget) {
                        isScrolling = false;
                      },
                      palette: <Color>[
                        Color.fromRGBO(105, 168, 248, 0),
                        Color.fromRGBO(253, 122, 93, 0),
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            radius: '100%',
                            dataSource: capacityData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            dataLabelMapper: (ChartData data, _) => data.x,
                            dataLabelSettings: DataLabelSettings(
                                showCumulativeValues: false,
                                showZeroValue: false,
                                isVisible: true,
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 30.w,
                                    fontFamily: 'applesdneob')))
                      ]));
            } else {
              state[0] = 'none';
              return BoxWidget('설비가동률', state[0], 'narrow').make(
                  onTap: () {},
                  dbRelatedContentBuilder:
                      Text.rich(detailPageTheme.makeHeaderText('데이터가 없습니다.')));
            }
          } else {
            return Text.rich(TextSpan(text: '불러오는 중'));
          }
        });
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;
}
