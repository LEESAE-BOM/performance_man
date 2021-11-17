import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'dart:math';

class energy_fee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _energy_fee();
}

class _energy_fee extends State<energy_fee> {
  Map<String, int> selectOptions = {
    '최근 6개월': 6,
    '최근 12개월': 12,
    '전체보기': detailPageTheme.maxTableRow,
  };
  var dropDownValue = '최근 6개월';

  late List<Chart_Data>? _chart_Data;
  late List<Chart_Data>? _chart_Data2;
  late TooltipBehavior _toolTipBehavior;
  List<ChartData> salesData = [];

  void initState() {
    _chart_Data = getChartData();
    _chart_Data2 = getChartData2();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data> getChartData() {
    final List<Chart_Data> getChartData = [
      Chart_Data('Completed', 43, Color.fromRGBO(43, 63, 107, 1)),
      Chart_Data('unCompleted', 57, Colors.grey),
    ];
    return getChartData;
  }

  List<Chart_Data> getChartData2() {
    final List<Chart_Data> getChartData = [
      Chart_Data('Completed', 74, Color.fromRGBO(43, 63, 107, 1)),
      Chart_Data('unCompleted', 26, Colors.grey),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('요금 현황',
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
                        'SELECT MoneyDate, Money FROM Money WHERE MoneyCategory=\'EGFEE\' ORDER BY MoneyDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;
                        var thisMonthPrice = double.parse(result[0]['Money']);
                        var table = ResultSet(snapshot.data, ['구분', '요금현황']);

                        int thisYear =
                            DateTime.parse(result[0]['MoneyDate']).year;

                        return ListView(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    50.sp, 100.sp, 20.sp, 100.sp),
                                child: Text.rich(TextSpan(children: [
                                  detailPageTheme.makeHeaderText(
                                      '이번 달 전기요금 현황은\n[${detailPageTheme.money.format(thisMonthPrice)}원] 입니다.'),
                                ]))),
                            Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                  Container(
                                      width: 540.w,
                                      height: 200,
                                      child: SfCircularChart(
                                          tooltipBehavior: _toolTipBehavior,
                                          title: ChartTitle(
                                              text: '<월별>',
                                              // Aligns the chart title to left
                                              alignment: ChartAlignment.center,),
                                          annotations: <
                                              CircularChartAnnotation>[
                                            CircularChartAnnotation(
                                                height: '110%',
                                                // Setting height and width for the circular chart annotation
                                                width: '110%',
                                                widget: Container(
                                                    child: PhysicalModel(
                                                        child: Container(),
                                                        shape: BoxShape.circle,
                                                        elevation: 10,
                                                        color: Colors.white))),
                                            CircularChartAnnotation(
                                                widget: Container(
                                                    child: Text(
                                                        '${detailPageTheme.money.format(thisMonthPrice)}원\n /63000',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0.5),
                                                            fontSize: 45.sp,
                                                            fontFamily:
                                                                'applesdneoeb')))),
                                          ],
                                          series: <CircularSeries>[
                                            DoughnutSeries<Chart_Data, String>(
                                                dataSource: _chart_Data,
                                                xValueMapper:
                                                    (Chart_Data data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (Chart_Data data, _) =>
                                                        data.y,
                                                pointColorMapper:
                                                    (Chart_Data data, _) =>
                                                        data.color,
                                                // Radius of doughnut
                                                radius: '85%')
                                          ])),
                                  Container(
                                      width: 540.w,
                                      height: 200,
                                      child: SfCircularChart(
                                          title: ChartTitle(
                                            text: '<월별 누적>',
                                            // Aligns the chart title to left
                                            alignment: ChartAlignment.center,),
                                          annotations: <
                                          CircularChartAnnotation>[
                                        CircularChartAnnotation(
                                            height: '110%',
                                            // Setting height and width for the circular chart annotation
                                            width: '110%',
                                            widget: Container(
                                                child: PhysicalModel(
                                                    child: Container(),
                                                    shape: BoxShape.circle,
                                                    elevation: 10,
                                                    // shadowColor: Colors.black,
                                                    color: Colors.white))),
                                        CircularChartAnnotation(
                                            widget: Container(
                                                child: Text(
                                                    '18250kwh\n/50000kwh',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.5),
                                                        fontSize: 43.sp,
                                                        fontFamily:
                                                            'applesdneoeb'))))
                                      ], series: <CircularSeries>[
                                        DoughnutSeries<Chart_Data, String>(
                                            dataSource: _chart_Data2,
                                            xValueMapper:
                                                (Chart_Data data, _) => data.x,
                                            yValueMapper:
                                                (Chart_Data data, _) => data.y,
                                            pointColorMapper:
                                                (Chart_Data data, _) =>
                                                    data.color,
                                            // Radius of doughnut
                                            radius: '80%')
                                      ]))
                                ])),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Table(
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
                                                alignment: Alignment.centerRight,
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
                                            ),
                                          ))
                                        ])
                                      ] +
                                      table.getTableRowWidgets(
                                          convertor: (row) {
                                        row['Money'] =
                                            '${detailPageTheme.money.format(double.parse(row['Money']))} 원';
                                        return row;
                                      }).sublist(
                                          0,
                                          min(
                                              result.length,
                                              selectOptions[dropDownValue]
                                                  as int))),
                            )
                          ],
                        );
                      } else
                        return Text('불러오는 중');
                    }))));
  }
}

class Chart_Data {
  Chart_Data(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

class Chart_Data3 {
  Chart_Data3(this.x, this.y1, this.color);

  final String? x;
  final double y1;
  final Color color;
}

class ChartData {
  ChartData(this.x, this.y, this.y2, this.y3);

  String? x;
  int y;
  int y2;
  int y3;
}
