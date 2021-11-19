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
    '전체보기': 300,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '현금 보유액',
          style: TextStyle(fontSize: 67.sp, color: Colors.white),
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
                  future: conn.sendQuery(
                      'SELECT YEAR(RecordedDate) as Year, SUM(Money) * 1000 as Money FROM Money WHERE Category=\'MONEY\' GROUP BY Year ORDER BY Year DESC;'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var result = snapshot.data as List<Map<String, dynamic>>;
                      var thisYearPrice = '0.00';
                      var previousYearPrice = '0.00';
                      var table = ResultSet(snapshot.data, ['연도', '금액']);

                      if (result.length > 1) {
                        thisYearPrice = result[0]['Money'];
                      }

                      int result_thisYearPrice =
                          double.parse(thisYearPrice).round();
                      if (result.length > 1)
                        previousYearPrice = result[1]['Money'];

                      int diff = int.parse(thisYearPrice.substring(
                              0, thisYearPrice.length - 3)) -
                          int.parse(previousYearPrice.substring(
                              0, previousYearPrice.length - 3));
                      double incrementRate = 0;
                      if (previousYearPrice != '0.00')
                        incrementRate = (diff /
                                int.parse(previousYearPrice.substring(
                                    0, previousYearPrice.length - 3))) *
                            100;
                      if (incrementRate < 0) incrementRate *= -1;

                      for (int i = 0; i < min(result.length, 3); i++)
                        cashData.insert(
                            0,
                            ChartData(result[i]['Year'],
                                double.parse(result[i]['Money'])));

                      return ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                80.sp, 100.sp, 20.sp, 100.sp),
                            child: Text.rich(TextSpan(children: [
                              detailPageTheme.makeHeaderText(
                                  '이번 년도 [현금 보유액]은\n[${detailPageTheme.money.format(result_thisYearPrice)}]원 입니다.'),
                              if (previousYearPrice != '0.00')
                                detailPageTheme.makeHeaderText(
                                    '\n전년대비 [${incrementRate.round()}%]'),
                              if (diff < 0)
                                detailPageTheme.makeHeaderText(' [감소]했어요.'),
                              if (diff >= 0)
                                detailPageTheme.makeHeaderText(' [상승]했어요.'),
                            ])),
                          ),
                          Center(
                            child: Container(
                                width: 1000.w,
                                height: 300,
                                child: SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    primaryYAxis: NumericAxis(
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.shift,
                                      numberFormat:
                                          NumberFormat.compact(locale: "ko_KR"),
                                    ),
                                    palette: <Color>[
                                      Colors.teal,
                                    ],
                                    series: <ChartSeries>[
                                      BarSeries<ChartData, String>(
                                        dataSource: cashData,
                                        xValueMapper: (ChartData sales, _) =>
                                            sales.x,
                                        yValueMapper: (ChartData sales, _) =>
                                            sales.y,
                                        dataLabelSettings: DataLabelSettings(
                                            // Renders the data label
                                            isVisible: true),
                                        width: 0.6,
                                        spacing: 0.2,
                                      ),
                                    ])),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.w,0,10.w,10.w),
                            child: Table(
                              border: detailPageTheme.tableBorderStyle,
                              children: [
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
                                            for (var val in selectOptions.keys)
                                              DropdownMenuItem(
                                                  value: val, child: Text(val))
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
                                  table.getTableRowWidgets(convertor: (row) {
                                    row['Money'] =
                                        '${detailPageTheme.money.format(double.parse(row['Money']))} 원';
                                    return row;
                                  }).sublist(
                                      0,
                                      min(selectOptions[dropDownValue] as int,
                                          table.rows.length)),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Text('불러오는 중');
                    }
                  }),
            ),
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
