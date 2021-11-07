import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/capacity_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';

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
    return BoxWidget('설비가동률', 'danger', 'narrow').make(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => capacity_ratio()));
        },
        dbRelatedContentBuilder: FutureBuilder(
            future: conn.sendQuery(
                'SELECT Goal, Achievement FROM CompletionRate WHERE Category=\'OPRCM\' ORDER BY RecordedDate DESC;'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var result = snapshot.data as List<Map<String, dynamic>>;
                var goal = double.parse(result[0]['Goal']);
                var achievement = double.parse(result[0]['Achievement']);
                var achieveRate = (achievement / goal) * 100;

                List<ChartData> capacityData = [
                  ChartData('complete', achieveRate),
                  ChartData('uncomplete', 100 - achieveRate)
                ];

                return SfCircularChart(
                    tooltipBehavior: _toolTipBehavior,
                    onChartTouchInteractionDown: (_Capacity_Ratio_Widget) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => capacity_ratio()));
                    },
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
                                  fontFamily: 'applesdneob'
                              )
                          )
                      )
                    ]);
              } else {
                return Text.rich(TextSpan(text: '불러오는 중'));
              }
            }
            )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;
}
