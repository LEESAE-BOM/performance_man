import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class energy_fee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _energy_fee();
}

class _energy_fee extends State<energy_fee> {
  final List<String> _valueList = [
    '1월',
    '2월',
    '3월',
    '4월',
    '5월',
    '6월',
    '7월',
    '8월',
    '9월',
    '10월',
    '11월',
    '12월'
  ];
  String? _selectedValue = '10월';
  late List<Chart_Data>? _chart_Data;
  late List<Chart_Data>? _chart_Data2;
  late List<Chart_Data3> _chart_Data3;
  late TooltipBehavior _toolTipBehavior;
  List<ChartData> salesData = [];

  void initState() {
    _chart_Data = getChartData();
    _chart_Data2 = getChartData2();
    _chart_Data3 = getChartData3();
    _toolTipBehavior = TooltipBehavior();
    for (int i = 1; i <= 12; i++) salesData.add(ChartData('$i월', 0, 0, 0));
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

  List<Chart_Data3> getChartData3() {
    final List<Chart_Data3> getChartData = [
      Chart_Data3('당일누적요금', 780, Color.fromRGBO(43, 63, 107, 1)),
      Chart_Data3('당월누적요금', 560, Color.fromRGBO(43, 63, 107, 1)),
      Chart_Data3('전월요금', 300, Color.fromRGBO(43, 63, 107, 1)),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    Widget datatableSection1 = Padding(
        padding: EdgeInsets.fromLTRB(30.w, 100.sp, 30.w, 0),
        child: Center(
            child: Container(
                width: double.infinity,
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
                            alignment: Alignment.center,
                            width: 1020.w * .3,
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
                          alignment: Alignment.center,
                          width: 1020.w * .7,
                          child: Text(
                            '요금현황',
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        )),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('')),
                          DataCell(Container(
                              width: 1020.w * .6,
                              alignment: Alignment.centerRight,
                              child: DropdownButton(
                                value: _selectedValue,
                                items: _valueList.map(
                                  (String value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  },
                                ).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedValue = value;
                                  });
                                },
                              )))
                        ]),
                        DataRow(cells: [
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '전월요금',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '54,000원',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                        ]),
                        DataRow(cells: [
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '당월누적요금',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '165,000원',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                        ]),
                        DataRow(cells: [
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '당일 누적요금',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                '125,000원',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              ))),
                        ])
                      ],
                    )))));

    //Widget chartSection= const ();

    //Widget dataSection=();

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                '요금 현황',
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
                            'SELECT MoneyDate, Money * 1000 as Money FROM Money WHERE MoneyCategory=\'EGFEE\' ORDER BY MoneyDate DESC;'),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var result =
                                snapshot.data as List<Map<String, dynamic>>;
                            var thisMonthPrice =
                                double.parse(result[0]['Money']);
                            var previousMonthPrice =
                                double.parse(result[1]['Money']);
                            var table =
                                MySQLTable(snapshot.data, ['구분', '요금현황']);

                            int diff = thisMonthPrice.round() -
                                previousMonthPrice.round();

                            int thisYear =
                                DateTime.parse(result[0]['MoneyDate']).year;

                            for (var row in result) {
                              DateTime toDate =
                                  DateTime.parse(row['MoneyDate']);
                              int term = thisYear - toDate.year;
                              String moneyStr = row['Money'];
                              if (term == 0) {
                                salesData[toDate.month - 1].y = int.parse(
                                    moneyStr.substring(0, moneyStr.length - 3));
                              } else if (term == 1) {
                                salesData[toDate.month - 1].y2 = int.parse(
                                    moneyStr.substring(0, moneyStr.length - 3));
                              } else if (term == 2) {
                                salesData[toDate.month - 1].y3 = int.parse(
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
                                              annotations: <
                                                  CircularChartAnnotation>[
                                                CircularChartAnnotation(
                                                    height: '110%',
                                                    // Setting height and width for the circular chart annotation
                                                    width: '110%',
                                                    widget: Container(
                                                        child: PhysicalModel(
                                                            child: Container(),
                                                            shape:
                                                                BoxShape.circle,
                                                            elevation: 10,
                                                            color:
                                                                Colors.white))),
                                                CircularChartAnnotation(
                                                    widget: Container(
                                                        child: Text(
                                                            '43000\n /63000',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.5),
                                                                fontSize: 45.sp,
                                                                fontFamily:
                                                                    'applesdneoeb')))),
                                              ],
                                              series: <CircularSeries>[
                                                DoughnutSeries<Chart_Data,
                                                        String>(
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
                                                    radius: '80%')
                                              ])),
                                      Container(
                                          width: 540.w,
                                          height: 200,
                                          child: SfCircularChart(annotations: <
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
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0.5),
                                                            fontSize: 43.sp,
                                                            fontFamily:
                                                                'applesdneoeb'))))
                                          ], series: <CircularSeries>[
                                            DoughnutSeries<Chart_Data, String>(
                                                dataSource: _chart_Data2,
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
                                                radius: '80%')
                                          ]))
                                    ])),
                                datatableSection1,
                              ],
                            );
                          } else
                            return Text('불러오는 중');
                        })))));
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
