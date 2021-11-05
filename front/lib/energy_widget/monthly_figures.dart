import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/energy/energy_screen.dart';
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

  List<ChartData> monthlyusage = [];

  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming: true);
    _toolTipBehavior = TooltipBehavior();
    for (int i = 1; i <= 12; i++)
      monthlyusage.add(ChartData('$i월', 0,0,0));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Widget datatableSection1 = Padding(
        padding: EdgeInsets.fromLTRB(30.w, 100.sp, 30.w, 0),
        child: Center(
            child: Container(
                width: 1020.w,
                child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.black12),
                    child: DataTable(
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black12),
                      columns: [
                        DataColumn(
                          label: Container(
                            width: 1020.w * .2,
                            alignment: Alignment.center,
                            child: Text(
                              '구분',
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            ),
                          ),
                          // numeric: true,
                        ),
                        DataColumn(
                            label: Container(
                          width: 1020.w * .2666,
                          alignment: Alignment.center,
                          child: Text(
                            '8월',
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        )),
                        DataColumn(
                            label: Container(
                          width: 1020.w * .2666,
                          alignment: Alignment.center,
                          child: Text(
                            '9월',
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        )),
                        DataColumn(
                            label: Container(
                          width: 1020.w * .2666,
                          alignment: Alignment.center,
                          child: Text(
                            '10월',
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ))
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '2021년\n전력사용량',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '14,000',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '12,980',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '10,290',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                        ]),
                        DataRow(cells: [
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '2020년\n전력사용량',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '120,84',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '11,980',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '11,980',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                        ]),
                        DataRow(cells: [
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '2021년\n최대전력',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '11,980',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '85,780',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '70,122',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                        ]),
                        DataRow(cells: [
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '2020년\n최대전력',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '14,000',
                                style: TextStyle(
                                    fontSize: 3.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '11,980',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '11,980',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                        ]),
                      ],
                    )))));

    return MaterialApp(
        home: Scaffold(
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
                            'SELECT MoneyDate, Money * 1000 as Money FROM Money WHERE MoneyCategory=\'EGFEE\' ORDER BY MoneyDate ASC;'),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var result =
                                snapshot.data as List<Map<String, dynamic>>;
                            var thisMonthPrice = double.parse(result[0]['Money']);
                            var previousMonthPrice = double.parse(result[1]['Money']);
                            var table = MySQLTable(snapshot.data, ['구분', '월']);

                            int diff = thisMonthPrice.round() - previousMonthPrice.round();
                            int thisYear =
                                DateTime.parse(result[0]['MoneyDate']).year;

                            for (var row in result) {
                              DateTime toDate =
                                  DateTime.parse(row['MoneyDate']);
                              int term = toDate.year-thisYear;
                              String moneyStr = row['Money'];
                              if (term == 0) {
                                monthlyusage[toDate.month - 1].y1 =
                                    double.parse(moneyStr.substring(0, moneyStr.length - 3));
                              } else if (term == 1) {
                                monthlyusage[toDate.month - 1].y2 =
                                    double.parse(moneyStr.substring(0, moneyStr.length - 3));
                              } else if (term == 2) {
                                monthlyusage[toDate.month - 1].y3 =
                                    double.parse(moneyStr.substring(0, moneyStr.length - 3));
                              } else if (term <= 3) break;
                            }
                            return ListView(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
                                    child: Text.rich(
                                        TextSpan(
                                            children: [
                                              detailPageTheme.makeHeaderText('이번 달의 전력사용량은\n[${detailPageTheme.money.format(thisMonthPrice)}kWh] 입니다.\n전년 대비\n'),
                                              if(diff < 0)
                                                detailPageTheme.makeHeaderText('[${diff * -1}]kWh 감소했어요.'),
                                              if(diff >= 0)
                                                detailPageTheme.makeHeaderText('[$diff]kWh 증가했어요.')
                                            ]
                                        )
                                    )
                                ),
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
                                        name: '${thisYear+1}',
                                        dataSource: monthlyusage,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y2),
                                    ColumnSeries<ChartData, String>(
                                        name: '${thisYear+2}',
                                        dataSource: monthlyusage,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y3),
                                    // Render line series
                                    LineSeries<ChartData, String>(
                                        name: '전 년도 최대전력',
                                        dataSource: monthlyusage,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y1,
                                        dataLabelSettings: DataLabelSettings(
                                            // Renders the data label
                                            isVisible: true),
                                        markerSettings:
                                            MarkerSettings(isVisible: true)),
                                    LineSeries<ChartData, String>(
                                      name: '현 년도 최대전력',
                                      dataSource: monthlyusage,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y2,
                                      dataLabelSettings: DataLabelSettings(
                                          // Renders the data label
                                          isVisible: true),
                                      markerSettings:
                                          MarkerSettings(isVisible: true),
                                    )
                                  ],
                                ),
                                datatableSection1,
                              ],
                            );
                          } else
                            return Text('불러오는 중');
                        })))));
  }
}

class ChartData {
  ChartData(this.x, this.y1,this.y2,this.y3);

  String? x;
  double y1;
  double y2;
  double y3;
}
