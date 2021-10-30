import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class contracted_price extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _contracted_price();
}

class _contracted_price extends State<contracted_price> {
  final List<String> _valueList =['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
  String? _selectedValue='10월';
  late ZoomPanBehavior _zoomPanBehavior;

  Map<String, int> selectOptions = {
    '최근 6개월': 6,
    '최근 12개월': 12,
    '전체보기': -1,
  };
  var dropDownValue = '최근 6개월';

  List<ChartData> contractData = [];
  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming : true
    );
    for(int i=1; i<=12; i++)
      contractData.add(ChartData('$i월', 0, 0, 0));
    super.initState();
  }

  List<ChartData> chartData = <ChartData>[
    ChartData('5월', 2093000, 74185000, 78645000),
    ChartData('6월', 34436000, 12349000, 48612000),
    ChartData('7월', 4356000, 74501000, 45671000),
    ChartData('8월', 24636000, 14714000, 58258000),
    ChartData('9월', 54636000, 69312000, 65432000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계약 금액',
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
                  future: conn.sendQuery('SELECT ContractDate, Company, Price * 1000 as Money, Backlog FROM Contract ORDER BY ContractDate DESC;'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var result = snapshot.data as List<Map<String, dynamic>>;
                      var thisMonthPrice = result[0]['Money'];
                      var previousMonthPrice = result[1]['Money'];
                      var table = MySQLTable(snapshot.data, ['날짜', '기업', '금액', '수주 잔고 금액']);

                      thisMonthPrice = thisMonthPrice.substring(0, thisMonthPrice.length - 3);
                      previousMonthPrice = previousMonthPrice.substring(0, previousMonthPrice.length - 3);
                      int diff = int.parse(thisMonthPrice) - int.parse(previousMonthPrice);

                      int thisYear = DateTime.parse(result[0]['ContractDate']).year;

                      for (var row in result) {
                        DateTime toDate = DateTime.parse(row['ContractDate']);
                        int term = thisYear - toDate.year;
                        String moneyStr = row['Money'];
                        moneyStr = moneyStr.substring(0, moneyStr.length - 3);
                        if (term == 0) {
                          contractData[toDate.month - 1].y = int.parse(moneyStr);
                        } else if (term == 1) {
                          contractData[toDate.month - 1].y2 = int.parse(moneyStr);
                        } else if (term == 2) {
                          contractData[toDate.month - 1].y3 = int.parse(moneyStr);
                        } else if (term <= 3) break;
                      }

                      selectOptions['전체보기'] = table.rows.length;
                      TableRow header = table.getTableHeader(TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          color: Colors.black87));
                      List<TableRow> rows = table.getTableRows(
                          TextStyle(fontSize: 40.sp, color: Colors.black38));

                      return ListView(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          HeaderTheme().makeHeaderText('이번 달 [계약금액]은\n[$thisMonthPrice원] 입니다.\n전월 대비\n'),
                                          if(diff < 0)
                                            HeaderTheme().makeHeaderText('[${diff * -1}]원 감소했어요.'),
                                          if(diff >= 0)
                                            HeaderTheme().makeHeaderText('[$diff]원 증가했어요.')
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
                                  // Y axis labels will be rendered with currency format
                                    numberFormat: NumberFormat.compact()),
                                legend: Legend(
                                    isVisible: true,
                                    // Legend will be placed at the left
                                    position: LegendPosition.bottom),
                                series: <CartesianSeries>[
                                  ColumnSeries<ChartData, String>(
                                    name: '$thisYear',
                                    dataSource: contractData,
                                    xValueMapper: (ChartData sales, _) => sales.x,
                                    yValueMapper: (ChartData sales, _) => sales.y,
                                  ),
                                  ColumnSeries<ChartData, String>(
                                    name: '${thisYear-1}',
                                    dataSource: contractData,
                                    xValueMapper: (ChartData sales, _) => sales.x,
                                    yValueMapper: (ChartData sales, _) => sales.y2,
                                  ),
                                  ColumnSeries<ChartData, String>(
                                    name: '${thisYear-2}',
                                    dataSource: contractData,
                                    xValueMapper: (ChartData sales, _) => sales.x,
                                    yValueMapper: (ChartData sales, _) => sales.y3,
                                  ),
                                  LineSeries<ChartData, String>(
                                      name: '$thisYear',
                                      color: Colors.teal,
                                      dataSource: contractData,
                                      xValueMapper: (ChartData sales, _) => sales.x,
                                      yValueMapper: (ChartData sales, _) => sales.y,
                                      dataLabelSettings: DataLabelSettings(
                                        // Renders the data label
                                          isVisible: true),
                                      markerSettings: MarkerSettings(isVisible: true))
                                ]
                            ),
                            Table(
                                border: TableBorder(
                                    horizontalInside: BorderSide(width: 1,
                                        color: Colors.black38,
                                        style: BorderStyle.solid)),
                                children: <TableRow>[
                                  header,
                                  TableRow(
                                      children: [
                                        TableCell(
                                          child: Text(''),
                                        ),
                                        TableCell(
                                          child: Text(''),
                                        ),
                                        TableCell(
                                          child: Text(''),
                                        ),
                                        TableCell(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 50.sp),
                                              child: DropdownButton(
                                                value: dropDownValue,
                                                items: <
                                                    DropdownMenuItem<String>>[
                                                  for(var val in selectOptions
                                                      .keys)
                                                    DropdownMenuItem(value: val,
                                                        child: Text(val))
                                                ],
                                                onChanged: (String? val) {
                                                  setState(() {
                                                    dropDownValue = val!;
                                                  });
                                                },
                                                isExpanded: true,
                                              ),
                                            )
                                        )
                                      ]
                                  )
                                ] + rows.sublist(0, min(selectOptions[dropDownValue] as int, rows.length))
                            )
                          ]
                      );
                    } else
                      return Text('...');
                  }
              )
          )
      ),
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
