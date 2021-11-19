import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/detail_page.dart';
import 'package:flutter_app/theme.dart';

class development_completion_rate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _development_completion_rate();
}

class _development_completion_rate extends State<development_completion_rate> {
  late TooltipBehavior _toolTipBehavior;
  int index = 0;
  String detailLabel = '';

  void initState() {
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isScrolling = false;

    return DetailPage().make(
        context: context,
        title: '개발완료율',
        content: FutureBuilder(
            future: conn.sendQuery(
              'SELECT Label, Goal, MAX(Achievement) as Achievement FROM CompletionRate NATURAL JOIN CompletionGoal WHERE Category=\'DVLCM\' GROUP BY Label, Goal ORDER BY MAX(Achievement)/Goal DESC;',
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var resultQ1 = snapshot.data as List<Map<String, dynamic>>;
                detailLabel = resultQ1[index]['Label'];

                var goal = double.parse(resultQ1[index]['Goal']);
                var achievement = double.parse(resultQ1[index]['Achievement']);
                var achieveRate = (achievement / goal) * 100;

                List<ChartData> simpleDevData = [
                  for (int i = index + 1; i < resultQ1.length; i++)
                    ChartData(
                        resultQ1[i]['Label'],
                        (double.parse(resultQ1[i]['Achievement']) /
                                double.parse(resultQ1[i]['Goal'])) *
                            100,
                        i),
                  for (int i = 0; i < index; i++)
                    ChartData(
                        resultQ1[i]['Label'],
                        (double.parse(resultQ1[i]['Achievement']) /
                                double.parse(resultQ1[i]['Goal'])) *
                            100,
                        i)
                ];
                return ListView(children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(50.sp, 50.sp, 50.sp, 25.sp),
                      child: Text.rich(
                        detailPageTheme.makeHeaderText(
                            '현재까지\n[$detailLabel] 개발 완료율은\n[${achieveRate.round()}%] 입니다.'),
                      )),
                  FutureBuilder(
                      future: conn.sendQuery(
                          'SELECT YEAR(RecordedDate) Year, MONTH(RecordedDate) Month, MAX(Achievement/Goal) Rate FROM CompletionRate NATURAL JOIN CompletionGoal WHERE Label=\'$detailLabel\' GROUP BY Year, Month ORDER BY Year, Month;'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var resultQ2 =
                              snapshot.data as List<Map<String, dynamic>>;

                          List<ChartData> devData = [
                            for (int i = max(0, resultQ2.length - 12);
                                i < resultQ2.length;
                                i++)
                              ChartData(
                                  resultQ2[i]['Year'] +
                                      '-' +
                                      resultQ2[i]['Month'],
                                  (double.parse(resultQ2[i]['Rate'])) * 100,
                                  index)
                          ];

                          return Padding(
                              padding: EdgeInsets.fromLTRB(
                                  50.sp, 25.sp, 50.sp, 50.sp),
                              child: SfCartesianChart(
                                palette: <Color>[
                                  Colors.teal,
                                ],
                                series: <ChartSeries>[
                                  StackedLineSeries<ChartData, String>(
                                      dataSource: devData,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          showCumulativeValues: true),
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
                              ));
                        } else {
                          return Text('진행 상황을 불러오는 중');
                        }
                      }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50.sp, 25.sp, 50.sp, 50.sp),
                    child: Text(
                      '다른 프로젝트 확인하기',
                      style: detailPageTheme.normalText,
                    ),
                  ),
                  for (var data in simpleDevData)
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              index = data.idx;
                              detailLabel = data.x;
                            });
                            isScrolling = false;
                          },
                          child: Container(
                              padding:
                              EdgeInsets.fromLTRB(50.sp, 25.sp, 50.sp, 25.sp),
                              width: 1040.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 3.0), //(x,y)
                                    blurRadius: 4.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 25.sp, 0, 0),
                                  ),
                                  Text('${data.x}',
                                      style: TextStyle(fontSize: 50.w)),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 25.sp, 0, 0),
                                  ),
                                  Text('${data.y.round()}% 완수',
                                      style: TextStyle(fontSize: 40.w)),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      height: 70.w,
                                      child: SfCartesianChart(
                                          tooltipBehavior: _toolTipBehavior,
                                          onChartTouchInteractionMove:
                                              (_development_completion_rate) {
                                            isScrolling = true;
                                          },
                                          onChartTouchInteractionUp:
                                              (_development_completion_rate) {
                                            if (isScrolling == false)
                                              setState(() {
                                                index = data.idx;
                                                detailLabel = data.x;
                                              });
                                            isScrolling = false;
                                          },
                                          onChartTouchInteractionDown:
                                              (_development_completion_rate) {
                                            isScrolling = false;
                                          },
                                          palette: [
                                            Colors.teal,
                                            Colors.black12
                                          ],
                                          primaryXAxis: CategoryAxis(
                                              edgeLabelPlacement:
                                              EdgeLabelPlacement.shift,
                                              isVisible: false),
                                          primaryYAxis: NumericAxis(
                                            edgeLabelPlacement:
                                            EdgeLabelPlacement.shift,
                                            isVisible: false,
                                          ),
                                          plotAreaBorderWidth: 0,
                                          series: <ChartSeries>[
                                            StackedBar100Series<ChartData,
                                                String>(
                                              dataSource: [data],
                                              xValueMapper: (ChartData data, _) =>
                                              data.x,
                                              yValueMapper: (ChartData data, _) =>
                                              data.y,
                                            ),
                                            StackedBar100Series<ChartData,
                                                String>(
                                              dataSource: [data],
                                              xValueMapper: (ChartData data, _) =>
                                              data.x,
                                              yValueMapper: (ChartData data, _) =>
                                              100 - data.y,
                                            )
                                          ])),
                                ],
                              )),
                        ),
                      ],
                    ),
                ]);
              } else
                return Text('불러오는 중');
            }));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.idx);

  String x;
  double y;
  int idx;
}
