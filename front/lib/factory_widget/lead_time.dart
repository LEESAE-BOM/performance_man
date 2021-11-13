import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/factory/factory_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'dart:math';

class lead_time extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _lead_time();
}

class _lead_time extends State<lead_time> {
  late List<Chart_Data> chartData;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    chartData = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data> getChartData() {
    final List<Chart_Data> getChartData = [
      Chart_Data('LeadTIME', 2, 3, 4),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData> salesData = []; //

    return Scaffold(
        appBar: AppBar(
          title: Text('제조 Lead-time',
              style: TextStyle(fontSize: 67.sp, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: SafeArea(
            child: Center(
                child: FutureBuilder(
                    future: conn.sendQuery(
                        'SELECT ProductName, ProductTime, CumulativeTime, DeliveryTime, StartDate, DueDate FROM LeadTime ORDER BY DueDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;

                        var today = DateTime.now();
                        int dif = int.parse(today
                            .difference(DateTime.parse(result[0]['DueDate']))
                            .inDays
                            .toString());
                        dif *= -1;

                        //Chart_Data('LeadTIME', double.parse(result[0]['ProductTime']), double.parse(result[0]['CumulativeTime']), double.parse(result[0]['DeliveryTime']));
                        chartData.clear();
                        chartData.add(Chart_Data(
                            'LeadTIME',
                            double.parse(result[0]['ProductTime']),
                            double.parse(result[0]['CumulativeTime']),
                            double.parse(result[0]['DeliveryTime'])));

                        return ListView(children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  50.sp, 100.sp, 20.sp, 100.sp),
                              child: Text.rich(TextSpan(children: [
                                detailPageTheme.makeHeaderText(
                                    '[${result[0]['ProductName']}] 제조에\n총 [${result[0]['CumulativeTime']}]일 소요되었어요.\n예정일까지 [${dif}]일 남았어요.'),
                              ]))),
                          SfCartesianChart(
                            tooltipBehavior: _toolTipBehavior,
                            legend: Legend(
                              isVisible: true,
                              position: LegendPosition.bottom,
                            ),
                            primaryXAxis: CategoryAxis(
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                                isVisible: false),
                            //backgroundColor: Colors.white,
                            primaryYAxis: NumericAxis(
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                              isVisible: false,
                            ),
                            series: <ChartSeries>[
                              StackedBar100Series<Chart_Data, String>(
                                name: '제품 소요시간',
                                dataSource: chartData,
                                xValueMapper: (Chart_Data sales, _) => sales.x,
                                yValueMapper: (Chart_Data sales, _) => sales.y1,
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                      fontSize: 100.sp,
                                      color: Colors.white,
                                      fontFamily: 'applesdneob',
                                    ),
                                    labelAlignment:
                                        ChartDataLabelAlignment.middle),
                              ),
                              StackedBar100Series<Chart_Data, String>(
                                  name: '누적 소요시간',
                                  dataSource: chartData,
                                  xValueMapper: (Chart_Data sales, _) =>
                                      sales.x,
                                  yValueMapper: (Chart_Data sales, _) =>
                                      sales.y2,
                                  dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      textStyle: TextStyle(
                                        fontSize: 100.sp,
                                        color: Colors.white,
                                        fontFamily: 'applesdneob',
                                      ),
                                      labelAlignment:
                                          ChartDataLabelAlignment.middle)),
                              StackedBar100Series<Chart_Data, String>(
                                name: '납기 소요시간',
                                dataSource: chartData,
                                xValueMapper: (Chart_Data sales, _) => sales.x,
                                yValueMapper: (Chart_Data sales, _) => sales.y3,
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                      fontSize: 100.sp,
                                      color: Colors.white,
                                      fontFamily: 'applesdneob',
                                    ),
                                    labelAlignment:
                                        ChartDataLabelAlignment.middle),
                              )
                            ],
                            plotAreaBorderWidth: 0,
                            //chart 테두리 삭제
                            borderWidth: 30,
                          ),
                          Column(children: <Widget>[
                            Text.rich(
                              TextSpan(
                                // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '예정일 D-${dif}',
                                    style: TextStyle(
                                        fontSize: 100.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'applesdneol'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text.rich(
                              TextSpan(
                                // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '제품 소요시간 ${result[0]['ProductTime']} Days',
                                    style: TextStyle(
                                        fontSize: 90.sp,
                                        color: Colors.black,
                                        letterSpacing: 1.0,
                                        fontFamily: 'applesdneob'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text.rich(
                              TextSpan(
                                // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '누적 소요시간 ${result[0]['CumulativeTime']} Days',
                                    style: TextStyle(
                                        fontSize: 90.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'applesdneol'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text.rich(
                              TextSpan(
                                // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '납기 소요시간 ${result[0]['DeliveryTime']} Days',
                                    style: TextStyle(
                                        fontSize: 90.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'applesdneol'),
                                  ),
                                ],
                              ),
                            )
                          ])
                        ]);
                      } else
                        return Text('불러오는 중');
                    }))));
  }
}

class Chart_Data {
  Chart_Data(this.x, this.y1, this.y2, this.y3);

  final String x;
  final double y1;
  final double y2;
  final double y3;
}

class ChartData {
  ChartData(this.x, this.y, this.y2, this.y3);

  String? x;
  int y;
  int y2;
  int y3;
}
