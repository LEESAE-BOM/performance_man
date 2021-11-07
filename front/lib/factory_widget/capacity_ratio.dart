import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/detail_page.dart';
import 'package:flutter_app/theme.dart';

class capacity_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _capacity_ratio();
}

class _capacity_ratio extends State<capacity_ratio> {
  late TooltipBehavior _toolTipBehavior;
  Map<String, int> selectOptions = {
    '최근 6개월': 6,
    '최근 12개월': 12,
    '전체보기': detailPageTheme.maxTableRow,
  };
  var dropDownValue = '최근 6개월';

  void initState() {
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DetailPage().make(
      context: context,
      title: '설비가동률',
      content: FutureBuilder(
          future: conn.sendQuery('SELECT RecordedDate, Goal, Achievement FROM CompletionRate WHERE Category=\'OPRCM\' ORDER BY RecordedDate DESC;'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var result = snapshot.data as List<Map<String, dynamic>>;
              var goal = double.parse(result[0]['Goal']);
              var achievement = double.parse(result[0]['Achievement']);
              var achieveRate = (achievement / goal) * 100;
              var table = MySQLTable(snapshot.data, ['날짜', '목표치', '달성치']);

              List<ChartData> capacityData = [
                ChartData('complete', achieveRate),
                ChartData('uncomplete', 100 - achieveRate)
              ];

              return ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
                        child: Text.rich(
                            detailPageTheme.makeHeaderText('오늘까지 설비가동룰은\n[${achieveRate.round()}%] 입니다.'),
                        )
                    ),
                    SfCircularChart(
                        tooltipBehavior: _toolTipBehavior,
                        annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                              height: '140%', // Setting height and width for the circular chart annotation
                              width: '140%',
                              widget: Container(
                                  child: PhysicalModel(
                                      child: Container(),
                                      shape: BoxShape.circle,
                                      elevation: 10,
                                      shadowColor: Colors.black,
                                      color: Colors.white
                                  )
                              )
                          ),
                          CircularChartAnnotation(
                              widget: Container(
                                  child: Text(
                                      '${achieveRate.round()}%',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                          fontSize: 71.sp,
                                          fontFamily: 'applesdneob'
                                      )
                                  )
                              )
                          )
                        ],
                        series: <CircularSeries>[
                          DoughnutSeries<ChartData, String>(
                              dataSource: capacityData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              radius: '95%'
                          )
                        ]
                    ),
                    Table(
                        border: TableBorder(
                            horizontalInside: BorderSide(width: 1,
                                color: Colors.black38,
                                style: BorderStyle.solid)),
                        children: <TableRow>[
                          table.getTableHeader(),
                          TableRow(
                              children: [
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
                                        isExpanded: true,
                                      ),
                                    )
                                )
                              ]
                          )
                        ] + table.getTableRows().sublist(0, min(result.length, selectOptions[dropDownValue] as int))
                    )
                  ]
              );
            } else
              return Text('불러오는 중');
          }
      )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  String x;
  double y;
}
