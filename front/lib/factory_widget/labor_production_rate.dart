import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'dart:math';

class labor_production_rate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_production_rate();
}

class _labor_production_rate extends State<labor_production_rate> {
  late ZoomPanBehavior _zoomPanBehavior;
  Map<String, int> selectOptions = {
    '최근 6개월': 6,
    '최근 12개월': 12,
    '전체보기': 300,
  };
  var dropDownValue = '최근 6개월';
  List<ChartData> laborData = [];

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming: true);
    for (int i = 1; i <= 12; i++) laborData.add(ChartData('$i월', 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('노동생산성',
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
                        'SELECT RecordedDate, Productivity FROM Productivity ORDER BY RecordedDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                        snapshot.data as List<Map<String, dynamic>>;
                        var thisMonthProductivity =
                        double.parse(result[0]['Productivity']);
                        var previousMonthProductivity =
                        double.parse(result[1]['Productivity']);
                        var table = ResultSet(snapshot.data, ['날짜', '노동생산성']);

                        int diff = thisMonthProductivity.round() -
                            previousMonthProductivity.round();

                        int thisYear =
                            DateTime.parse(result[0]['RecordedDate']).year;

                        for (var row in result) {
                          DateTime toDate = DateTime.parse(row['RecordedDate']);
                          int term = thisYear - toDate.year;
                          String moneyStr = row['Productivity'];

                          if (term == 0)
                            laborData[toDate.month - 1].y = int.parse(
                                moneyStr.substring(0, moneyStr.length - 3));
                        }

                        return ListView(children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  50.sp, 100.sp, 20.sp, 100.sp),
                              child: Text.rich(TextSpan(children: [
                                detailPageTheme.makeHeaderText(
                                    '이번 달 노동생산성은\n[${thisMonthProductivity}] 입니다.\n전월 대비\n'),
                                if (diff < 0)
                                  detailPageTheme
                                      .makeHeaderText('[${diff * -1}] 감소했어요.'),
                                if (diff >= 0)
                                  detailPageTheme
                                      .makeHeaderText('[$diff] 증가했어요.')
                              ]))),
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
                                  dataSource: laborData,
                                  xValueMapper: (ChartData labors, _) =>
                                  labors.x,
                                  yValueMapper: (ChartData labors, _) =>
                                  labors.y,
                                  dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                                ),
                              ]),
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
                                            for (var val in selectOptions.keys)
                                              DropdownMenuItem(
                                                  value: val, child: Text(val))
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
                                    row['Productivity'] =
                                    '${detailPageTheme.money.format(double.parse(row['Productivity']))}';
                                    return row;
                                  }).sublist(
                                      0,
                                      min(result.length,
                                          selectOptions[dropDownValue] as int)))
                        ]);
                      } else
                        return Text('불러오는 중');
                    }))));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String? x;
  int y;
}
