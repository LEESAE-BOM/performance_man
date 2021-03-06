import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class labor_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_ratio();
}

class _labor_ratio extends State<labor_ratio> {
  var today = DateTime.now();
  DateFormat formatter = DateFormat('yyyy년 MM월');

  Map<String, int> selectOptions = {
    '최근 6개월': 12,
    '최근 12개월': 24,
    '전체보기': detailPageTheme.maxTableRow,
  };
  var dropDownValue = '최근 6개월';

  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  List<ChartData> laborRate = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인건비율',
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
          child: PageView(
            controller: pageController,
            children: <Widget>[
              Center(
                child: FutureBuilder(
                    future: conn.sendQuery(
                        'SELECT RecordedDate, Category, Money * 1000 as Money FROM Money WHERE Category like \'%LBR\' ORDER BY RecordedDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;
                        if (result.length > 0) {
                          var table = ResultSet(result, ['날짜', '분류', '금액']);
                          double totalDCLBR = 0;
                          double totalIDLBR = 0;
                          double IDLBRRate = 0;
                          double DCLBRRate = 0;
                          int diff = 0;

                          int thisYear =
                              DateTime.parse(result[0]['RecordedDate']).year;
                          int thisMonth =
                              DateTime.parse(result[0]['RecordedDate']).month;

                          for (int i = 0; i < result.length; i++) {
                            int year =
                                DateTime.parse(result[i]['RecordedDate']).year;
                            int month =
                                DateTime.parse(result[i]['RecordedDate']).month;
                            if (thisYear == year &&
                                thisMonth ==
                                    month) if (result[i]['Category'] == 'DCLBR')
                              totalDCLBR += double.parse(result[i]['Money']);
                            else if (result[i]['Category'] == 'IDLBR')
                              totalIDLBR += double.parse(result[i]['Money']);
                          }

                          laborRate.clear();
                          IDLBRRate =
                              (totalIDLBR / (totalIDLBR + totalDCLBR)) * 100;
                          DCLBRRate =
                              (totalDCLBR / (totalIDLBR + totalDCLBR)) * 100;
                          diff = max(IDLBRRate.round(), DCLBRRate.round()) -
                              min(IDLBRRate.round(), DCLBRRate.round());

                          laborRate.add(ChartData(
                              '직접인건비', DCLBRRate, '${DCLBRRate.round()}%'));
                          laborRate.add(ChartData(
                              '간접인건비', IDLBRRate, '${IDLBRRate.round()}%'));

                          return ListView(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      80.sp, 100.sp, 20.sp, 100.sp),
                                  child: Text.rich(TextSpan(children: [
                                    detailPageTheme.makeHeaderText('이번 달은\n'),
                                    if (IDLBRRate > DCLBRRate)
                                      detailPageTheme
                                          .makeHeaderText('[간접인건비]가 '),
                                    if (IDLBRRate <= DCLBRRate)
                                      detailPageTheme
                                          .makeHeaderText('[직접인건비]가 '),
                                    detailPageTheme
                                        .makeHeaderText('[$diff%p] 높아요.'),
                                  ]))),
                              Container(
                                  width: 1000.w,
                                  height: 300,
                                  child: SfCircularChart(
                                      palette: <Color>[
                                        Colors.indigo,
                                        Colors.lightBlueAccent,
                                      ],
                                      title: ChartTitle(
                                          text: '$thisYear',
                                          textStyle: TextStyle(
                                              fontSize: 100.sp,
                                              fontWeight: FontWeight.bold)),
                                      legend: Legend(
                                          isVisible: true,
                                          position: LegendPosition.bottom,
                                          isResponsive: false),
                                      series: <CircularSeries>[
                                        // Render pie chart
                                        PieSeries<ChartData, String>(
                                            dataSource: laborRate,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.y,
                                            dataLabelMapper:
                                                (ChartData data, _) =>
                                                    data.text,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                    isVisible: true,
                                                    textStyle: TextStyle(
                                                        fontSize: 50.w,
                                                        fontFamily:
                                                            'applesdneob')),
                                            radius: '100%'),
                                      ])),
                              Container(
                                alignment: Alignment.centerRight,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 50.sp),
                                child: DropdownButton(
                                  value: dropDownValue,
                                  items: <DropdownMenuItem<String>>[
                                    for (var val in selectOptions.keys)
                                      DropdownMenuItem(
                                          value: val,
                                          child: Text(
                                            val,
                                          ))
                                  ],
                                  onChanged: (String? val) {
                                    setState(() {
                                      dropDownValue = val!;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.w),
                                child: Table(
                                  border: TableBorder(
                                      horizontalInside: BorderSide(
                                          width: 1,
                                          color: Colors.black38,
                                          style: BorderStyle.solid)),
                                  children: <TableRow>[
                                        table.getTableHeaderWidget(),
                                      ] +
                                      table.getTableRowWidgets(
                                          convertor: (row) {
                                        if (row['Category'] == 'IDLBR')
                                          row['Category'] = '간접';
                                        else if (row['Category'] == 'DCLBR')
                                          row['Category'] = '직접';
                                        row['Money'] =
                                            '${detailPageTheme.money.format(double.parse(row['Money']))} 원';
                                        return row;
                                      }).sublist(
                                          0,
                                          min(
                                              result.length,
                                              selectOptions[dropDownValue]
                                                  as int)),
                                ),
                              )
                            ],
                          );
                        } else {
                          return ListView(children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    50.sp, 100.sp, 20.sp, 100.sp),
                                child: Text.rich(TextSpan(children: [
                                  detailPageTheme
                                      .makeHeaderText('저장된 데이터가 없습니다.'),
                                ])))
                          ]);
                        }
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else {
                        return Text('불러오는 중');
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text);

  final String x;
  final double y;
  final String text;
}

class laborData {
  laborData(this.month, this.sales);

  final String? month;
  final double sales;
}
