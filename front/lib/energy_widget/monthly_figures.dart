import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class monthly_figures extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _monthly_figures();
}

class _monthly_figures extends State<monthly_figures> {
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _toolTipBehavior;
  Map<String, int> selectOptions = {
    '최근 6개월': 6,
    '최근 12개월': 12,
    '전체보기': 24,
  };
  var dropDownValue = '최근 6개월';

  List<ChartData> monthlyusage = [];

  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming: true);
    _toolTipBehavior = TooltipBehavior();
    for (int i = 1; i <= 12; i++) monthlyusage.add(ChartData('$i월', 0, 0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '월별 전력 사용량',
            style: TextStyle(fontSize: 67.sp, fontFamily: 'applesdneom'),
          ),
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
                        'SELECT UseDate, Amount * 1000 as Amount FROM EnergyUse ORDER BY UseDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;
                        var thisMonthUse = double.parse(result[0]['Amount']);
                        var previousMonthUse =
                            double.parse(result[1]['Amount']);
                        var table = ResultSet(snapshot.data, ['날짜', '전력 사용량']);

                        int diff =
                            thisMonthUse.round() - previousMonthUse.round();
                        int thisYear =
                            DateTime.parse(result[0]['UseDate']).year;

                        for (var row in result) {
                          DateTime toDate = DateTime.parse(row['UseDate']);
                          int term = thisYear - toDate.year;
                          String moneyStr = row['Amount'];
                          if (term == 0) {
                            monthlyusage[toDate.month - 1].y1 = double.parse(
                                moneyStr.substring(0, moneyStr.length - 3));
                          } else if (term == 1) {
                            monthlyusage[toDate.month - 1].y2 = double.parse(
                                moneyStr.substring(0, moneyStr.length - 3));
                          } else if (term == 2) {
                            monthlyusage[toDate.month - 1].y3 = double.parse(
                                moneyStr.substring(0, moneyStr.length - 3));
                          } else if (term <= 3) break;
                        }
                        return ListView(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    50.sp, 100.sp, 20.sp, 100.sp),
                                child: Text.rich(TextSpan(children: [
                                  detailPageTheme.makeHeaderText(
                                      '이번 달의 전력사용량은\n[${detailPageTheme.money.format(thisMonthUse)}kWh] 입니다.\n전월 대비\n'),
                                  if (diff < 0)
                                    detailPageTheme.makeHeaderText(
                                        '[${detailPageTheme.money.format(diff * -1)}kWh] 감소했습니다.'),
                                  if (diff >= 0)
                                    detailPageTheme.makeHeaderText(
                                        '[${detailPageTheme.money.format(diff)}]kWh] 증가했습니다.')
                                ]))),
                            SfCartesianChart(
                              zoomPanBehavior: _zoomPanBehavior,
                              tooltipBehavior: _toolTipBehavior,
                              palette: <Color>[
                                Colors.blueAccent,
                                Colors.cyan,
                                Colors.orangeAccent,
                                Colors.amberAccent
                              ],
                              legend: Legend(
                                  isVisible: true,
                                  // Legend will be placed at the left
                                  position: LegendPosition.top),
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(
                                  // Y axis labels will be rendered with currency format
                                  numberFormat: NumberFormat.compact()),
                              series: <CartesianSeries>[
                                // Render column series
                                ColumnSeries<ChartData, String>(
                                    name: '${thisYear - 1}',
                                    dataSource: monthlyusage,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) =>
                                        data.y2),
                                ColumnSeries<ChartData, String>(
                                    name: '${thisYear}',
                                    dataSource: monthlyusage,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) =>
                                        data.y1),
                                // Render line series
                                LineSeries<ChartData, String>(
                                    name: '전 년도 최대전력',
                                    dataSource: monthlyusage,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) =>
                                        data.y2,
                                    dataLabelSettings: DataLabelSettings(
                                        // Renders the data label
                                        isVisible: false),
                                    markerSettings:
                                        MarkerSettings(isVisible: true)),
                                LineSeries<ChartData, String>(
                                  name: '현 년도 최대전력',
                                  dataSource: monthlyusage,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y1,
                                  dataLabelSettings: DataLabelSettings(
                                      // Renders the data label
                                      isVisible: false),
                                  markerSettings:
                                      MarkerSettings(isVisible: true),
                                )
                              ],
                            ),
                            Table(
                                border: TableBorder(
                                    horizontalInside: BorderSide(
                                        width: 1,
                                        color: Colors.black38,
                                        style: BorderStyle.solid)),
                                children: <TableRow>[
                                      table.getTableHeaderWidget(),
                                      TableRow(children: [
                                        TableCell(
                                          child: Text(''),
                                        ),
                                        TableCell(
                                            child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50.sp),
                                          child: DropdownButton(
                                            value: dropDownValue,
                                            items: <DropdownMenuItem<String>>[
                                              for (var val
                                                  in selectOptions.keys)
                                                DropdownMenuItem(
                                                    value: val,
                                                    child: Text(val))
                                            ],
                                            onChanged: (String? val) {
                                              setState(() {
                                                dropDownValue = val!;
                                              });
                                            },
                                            isExpanded: true,
                                          ),
                                        ))
                                      ])
                                    ] +
                                    table.getTableRowWidgets(convertor: (row) {
                                      row['Amount'] =
                                          '${detailPageTheme.money.format(double.parse(row['Amount']))} kWh';
                                      return row;
                                    }).sublist(
                                        0,
                                        min(
                                            result.length,
                                            selectOptions[dropDownValue]
                                                as int)))
                          ],
                        );
                      } else
                        return Text('불러오는 중');
                    }))));
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3);

  String? x;
  double y1;
  double y2;
  double y3;
}
