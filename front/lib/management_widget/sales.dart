import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class sales extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _sales();
}

class _sales extends State<sales> {

  late ZoomPanBehavior _zoomPanBehavior;
  Map<String, int> selectOptions = {
    '최근 6개월': 6,
    '최근 12개월': 12,
    '전체보기': detailPageTheme.maxTableRow,
  };
  var dropDownValue = '최근 6개월';
  List<ChartData> salesData = [];

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming : true
    );
    for(int i=1; i<=12; i++)
      salesData.add(ChartData('$i월', 0, 0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('매출 금액',
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
            child:Center(
                child: FutureBuilder(
                    future: conn.sendQuery('SELECT MoneyDate, Money * 1000 as Money FROM Money WHERE MoneyCategory=\'SALES\' ORDER BY MoneyDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result = snapshot.data as List<Map<String, dynamic>>;
                        var thisMonthPrice = double.parse(result[0]['Money']);
                        var previousMonthPrice = double.parse(result[1]['Money']);
                        var table = ResultSet(snapshot.data, ['날짜', '금액']);

                        int diff = thisMonthPrice.round() - previousMonthPrice.round();

                        int thisYear = DateTime.parse(result[0]['MoneyDate']).year;

                        for (var row in result) {
                          DateTime toDate = DateTime.parse(row['MoneyDate']);
                          int term = thisYear-toDate.year;
                          String moneyStr = row['Money'];
                          if (term == 0) {
                            salesData[toDate.month - 1].y = int.parse(moneyStr.substring(0, moneyStr.length - 3));
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
                                  padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
                                  child: Text.rich(
                                      TextSpan(
                                          children: [
                                            detailPageTheme.makeHeaderText('이번 달 매출금액은\n[${detailPageTheme.money.format(thisMonthPrice)}원] 입니다.\n전월 대비\n'),
                                            if(diff < 0)
                                              detailPageTheme.makeHeaderText('[${detailPageTheme.money.format(diff * -1)}]원 감소했어요.'),
                                            if(diff >= 0)
                                              detailPageTheme.makeHeaderText('[${detailPageTheme.money.format(diff)}]원 증가했어요.')
                                          ]
                                      )
                                  )
                              ),
                              SfCartesianChart(
                                  zoomPanBehavior: _zoomPanBehavior,
                                  palette: <Color>[
                                    Colors.blueAccent,
                                    Colors.lightBlueAccent,
                                    Colors.teal,
                                  ],
                                  primaryXAxis: CategoryAxis(),
                                  primaryYAxis: NumericAxis(
                                      numberFormat: NumberFormat.compact(locale:"ko_KR" ),
                                  ),
                                  legend: Legend(
                                      isVisible: true,
                                      // Legend will be placed at the left
                                      position: LegendPosition.bottom),
                                  series: <CartesianSeries>[
                                    ColumnSeries<ChartData, String>(
                                      name: '${thisYear-2}',
                                      dataSource: salesData,
                                      xValueMapper: (ChartData sales, _) => sales.x,
                                      yValueMapper: (ChartData sales, _) => sales.y3,
                                    ),
                                    ColumnSeries<ChartData, String>(
                                      name: '${thisYear-1}',
                                      dataSource: salesData,
                                      xValueMapper: (ChartData sales, _) => sales.x,
                                      yValueMapper: (ChartData sales, _) => sales.y2,
                                    ),
                                    ColumnSeries<ChartData, String>(
                                      name: '$thisYear',
                                      dataSource: salesData,
                                      xValueMapper: (ChartData sales, _) => sales.x,
                                      yValueMapper: (ChartData sales, _) => sales.y,
                                    ),
                                  ]
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: Table(
                                    border: TableBorder(
                                        horizontalInside: BorderSide(width: 1,
                                            color: Colors.black38,
                                            style: BorderStyle.solid)),
                                    children: <TableRow>[
                                      table.getTableHeaderWidget(),
                                      TableRow(
                                          children: [
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
                                                      for(var val in selectOptions.keys)
                                                        DropdownMenuItem(
                                                            value: val,
                                                            child: Text(val)
                                                        )
                                                    ],
                                                    onChanged: (String? val) {
                                                      setState(() { dropDownValue = val!; });
                                                    },
                                                
                                                  ),
                                                )
                                            )
                                          ]
                                      )
                                    ] + table.getTableRowWidgets(
                                      convertor: (row) {
                                        row['Money'] = '${detailPageTheme.money.format(double.parse(row['Money']))} 원';
                                        return row;
                                      }
                                    ).sublist(0, min(result.length, selectOptions[dropDownValue] as int))
                                ),
                              )
                            ]
                        );
                      } else
                        return Text('불러오는 중');
                    }
                )
            )
        )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y2, this.y3);

  String? x;
  int y;
  int y2;
  int y3;
}
