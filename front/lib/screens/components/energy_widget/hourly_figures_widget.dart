import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/hourly_figures.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//작은 위젯
class Hourly_Figures_Widget extends StatefulWidget {
  @override
  _Hourly_Figures_Widget createState() => _Hourly_Figures_Widget();
}

class _Hourly_Figures_Widget extends State<Hourly_Figures_Widget> {
  @override
  List<Chart_Data> _chart_Data = [];
  List<_SplineAreaData1> Energyusage_time = [];

  void initState() {
    for (double i = 1; i <= 24; i++)
      Energyusage_time.add(_SplineAreaData1('$i시', 0, 0));
    for (double i = 1; i < 24; i += 2)
      _chart_Data.add(
          Chart_Data('$i시~${i + 1}시', 1, Color.fromRGBO(226, 226, 226, 1)));
    super.initState();
  }

  Widget build(BuildContext context) {
    bool isScrolling = false;

    return BoxWidget('시간별 에너지', 'safe', 'narrow').make(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => hourly_figures()));
        },
        dbRelatedContentBuilder: FutureBuilder(
            future: conn.sendQuery(
                'SELECT UseDate,HOUR(UseTime) as UseTime,Amount * 1000 as Amount FROM EnergyUse ORDER BY UseDate DESC;;'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var result = snapshot.data as List<Map<String, dynamic>>;

                for (var row in result) {
                  int toDate1 = int.parse(row['UseTime']);
                  String energyStr = row['Amount'];
                  energyStr = energyStr.substring(0, energyStr.length - 3);

                  String energyStr1 = row['Amount'];
                  energyStr1 = energyStr1.substring(0, energyStr1.length - 3);

                  Energyusage_time[toDate1 - 1].y1 = double.parse(energyStr);
                  Energyusage_time[toDate1 - 1].y2 = double.parse(energyStr1);
                }

                int max = 0;
                for (int i = 1; i < 24; i++) {
                  if (Energyusage_time[max].y2 < Energyusage_time[i].y2) {
                    max = i;
                  }
                }
                _chart_Data[(max / 2).round() - 3].color =
                    Color.fromRGBO(225, 72, 72, 1);
                return Container(
                  child: SfCircularChart(
                      onChartTouchInteractionMove: (_Hourly_Figures_Widget){
                        isScrolling = true;
                      },
                      onChartTouchInteractionUp: (_Hourly_Figures_Widget){
                        if(isScrolling == false){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => hourly_figures()));
                        }
                        isScrolling = false;
                      },
                      onChartTouchInteractionDown: (_Hourly_Figures_Widget){
                        isScrolling = false;
                      },
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                            widget: Container(
                                child: Text(
                                    '${max}시~${max + 1}시',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 50.sp,
                                        fontFamily: 'applesdneom'
                                    )
                                )
                            )
                        )
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<Chart_Data, String>(
                            dataSource: _chart_Data,
                            pointColorMapper: (Chart_Data data, _) => data.color,
                            xValueMapper: (Chart_Data data, _) => data.x,
                            yValueMapper: (Chart_Data data, _) => data.y,
                            radius: '100%'
                        )
                      ]
                  ),
                );
              } else {
                return Text.rich(TextSpan(text: '불러오는 중'));
              }
            }));
  }
}

class Chart_Data {
  Chart_Data(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}

class _SplineAreaData1 {
  _SplineAreaData1(this.x, this.y1, this.y2);

  String? x;
  double y1;
  double y2;
}
