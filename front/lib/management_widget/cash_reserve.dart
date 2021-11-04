
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';

class cash_reserve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _cash_reserve();
}

class _cash_reserve extends State<cash_reserve> {
  Map<String, int> selectOptions = {
    '최근 3개년': 3,
    '최근 6개년': 6,
    '전체보기': detailPageTheme.maxTableRow,
  };
  var dropDownValue = '최근 3개년';
  List<ChartData> cashData = [];

  PageController pageController = PageController(
    initialPage: 0,
  );

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget chartSection1 = Center(
        child: Container(
            width: 1000.w,
            height: 400,
            child: SfCircularChart(
                title: ChartTitle(
                    text: '2021',
                    textStyle:
                    TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
                legend: Legend(
                    isVisible: true,
                    // Legend will be placed at the left
                    position: LegendPosition.bottom),
                series: <CircularSeries>[
                  // Renders doughnut chart
                  DoughnutSeries<ChartData, String>(
                      dataSource: cashData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      dataLabelSettings: DataLabelSettings(
                        // Renders the data label
                          isVisible: true),
                      radius: '95%'
                  )
                ])));
    Widget datatableSection1 = Padding(
        padding:  EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
        child:Center(
          child: Container(
            width: 1020.w,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.grey),
              child: DataTable(
                columnSpacing:  0,
                horizontalMargin: 0,
                showBottomBorder: true,
                headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.black12),
                columns: <DataColumn>[
                  DataColumn(
                    label: Container(
                      width: 1020.w * .3,
                      alignment: Alignment.center,
                      child: Text(
                        '종류',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 45.sp,
                            fontFamily: 'applesdneoeb'),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .7,
                      alignment: Alignment.center,
                      child: Text('금액',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 45.sp,
                              fontFamily: 'applesdneoeb')),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('')),
                      DataCell(
                          Container(
                            width: 1020.w *.6,
                            alignment: Alignment.centerRight,
                          )
                      )
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '현금',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '253,654,978원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '현금성 자산',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '323,456,789원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '단기 금융 상품',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '450,340,890원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '현금 보유액',
          style: TextStyle(
              fontSize: 67.sp, color: Colors.white),
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
        child: PageView(
            controller: pageController,
            children: <Widget>[
              Center(
                child: FutureBuilder(
                    future: conn.sendQuery('SELECT YEAR(MoneyDate) as Year, SUM(Money) * 1000 as Money FROM Money WHERE MoneyCategory=\'MONEY\' GROUP BY Year ORDER BY Year DESC;'),
                    builder: (context, snapshot){
                      if(snapshot.hasData) {
                        var result = snapshot.data as List<Map<String, dynamic>>;
                        var year = '';
                        var thisYearPrice = '0.00';
                        var previousYearPrice = '0.00';
                        var table = MySQLTable(snapshot.data, ['연도', '금액']);

                        if(result.length > 0){
                          year = result[0]['Year'];
                          thisYearPrice = result[0]['Money'];
                        }

                        int result_thisYearPrice=double.parse(thisYearPrice).round();
                        if(result.length > 1) previousYearPrice = result[1]['Money'];

                        int diff = int.parse(thisYearPrice.substring(0, thisYearPrice.length - 3)) - int.parse(previousYearPrice.substring(0, previousYearPrice.length - 3));
                        double incrementRate = 0;
                        if(previousYearPrice != '0.00')
                          incrementRate = ( diff / int.parse(previousYearPrice.substring(0, previousYearPrice.length - 3))) * 100;
                        if(incrementRate < 0) incrementRate *= -1;

                        for(int i=0; i<min(result.length, 3); i++)
                          cashData.insert(0, ChartData(result[i]['Year'], double.parse(result[i]['Money'])));

                        return ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 20.sp, 100.sp),
                              child: Text.rich(
                                  TextSpan(
                                      children: [
                                        detailPageTheme.makeHeaderText('$year년 [현금 보유액]은\n[${detailPageTheme.money.format(result_thisYearPrice)}]원 입니다.'),
                                        if(previousYearPrice != '0.00')
                                          detailPageTheme.makeHeaderText('\n전년대비 [${incrementRate.round()}%]'),
                                        if(diff < 0)
                                          detailPageTheme.makeHeaderText(' [감소]했어요.'),
                                        if(diff >= 0)
                                          detailPageTheme.makeHeaderText(' [상승]했어요.'),
                                      ]
                                  )
                              ),
                            ),
                            Center(
                              child: Container(
                                  width: 1000.w,
                                  height: 300,
                                  child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(
                                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                                          numberFormat: NumberFormat.compact()
                                      ),
                                      series: <ChartSeries>[
                                        BarSeries<ChartData, String>(
                                          dataSource: cashData,
                                          xValueMapper: (ChartData sales, _) => sales.x,
                                          yValueMapper: (ChartData sales, _) => sales.y,
                                          dataLabelSettings: DataLabelSettings(
                                            // Renders the data label
                                              isVisible: true),
                                          width: 0.6,
                                          spacing: 0.2,
                                        ),
                                      ])),
                            ),
                            Table(
                              border: detailPageTheme.tableBorderStyle,
                              children: [
                                table.getTableHeader(),
                                TableRow(
                                    children: [
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
                                                for(var val in selectOptions.keys)
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
                              ] + table.getTableRows(
                                  convertor: (row) {
                                    row['Money'] = '${detailPageTheme.money.format(double.parse(row['Money']))} 원';
                                    return row;
                                  }
                              ).sublist(0, min(selectOptions[dropDownValue] as int, table.rows.length)),
                            )
                          ],
                        );
                      }else{
                        return Text('불러오는 중');
                      }
                    }
                ),
              ),
              ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        chartSection1,
                        datatableSection1,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
