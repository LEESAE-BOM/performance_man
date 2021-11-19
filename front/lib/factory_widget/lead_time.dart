import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class lead_time extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _lead_time();
}

class _lead_time extends State<lead_time> {
  late List<Chart_Data> chartData;
  late TooltipBehavior _toolTipBehavior;

  Map<String, int> selectOptions = {
    '진행중': 1,
    '전체보기': 300,
  };
  var dropDownValue = '진행중';
  List<ChartData> salesData = [];

  void initState() {
    chartData = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data> getChartData() {
    final List<Chart_Data> getChartData = [
      Chart_Data('LeadTIME', 2, 3, 4),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('제조 Lead-time',
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
                        'SELECT ProductName, ProductTime, CumulativeTime, DeliveryTime, StartDate, DueDate FROM LeadTime ORDER BY DueDate ASC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;
                        var table = ResultSet(snapshot.data,
                            ['이름', '소요', '누적', '납기', '시작', '예정']);

                        var today = DateTime.now();
                        int dif = int.parse(today
                            .difference(DateTime.parse(result[0]['DueDate']))
                            .inDays
                            .toString());
                        dif *= -1;

                        //Chart_Data('LeadTIME', double.parse(result[0]['ProductTime']), double.parse(result[0]['CumulativeTime']), double.parse(result[0]['DeliveryTime']));
                        chartData.clear();
                        chartData.add(Chart_Data(
                            'LeadTIME',
                            double.parse(result[0]['ProductTime']),
                            double.parse(result[0]['CumulativeTime']),
                            double.parse(result[0]['DeliveryTime'])));

                        return ListView(children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  50.sp, 100.sp, 20.sp, 100.sp),
                              child: Text.rich(TextSpan(children: [
                                detailPageTheme.makeHeaderText(
                                    '[${result[0]['ProductName']}] 제조에\n총 [${result[0]['CumulativeTime']}]일 소요되었어요.\n예정일까지 [${dif}]일 남았어요.'),
                              ]))),
                          SfCartesianChart(
                            palette: <Color>[
                              Colors.indigo,
                              Colors.blue,
                              Colors.lightBlueAccent,
                            ],
                            tooltipBehavior: _toolTipBehavior,
                            primaryXAxis: CategoryAxis(
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                                isVisible: false),
                            //backgroundColor: Colors.white,
                            primaryYAxis: NumericAxis(
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                              isVisible: false,
                            ),
                            legend: Legend(
                              isVisible: true,
                              position: LegendPosition.bottom,
                            ),
                            series: <ChartSeries>[
                              StackedBar100Series<Chart_Data, String>(
                                name: '제품 소요시간',
                                dataSource: chartData,
                                xValueMapper: (Chart_Data sales, _) => sales.x,
                                yValueMapper: (Chart_Data sales, _) => sales.y1,
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                      fontSize: 100.sp,
                                      color: Colors.white,
                                      fontFamily: 'applesdneob',
                                    ),
                                    labelAlignment:
                                        ChartDataLabelAlignment.middle),
                              ),
                              StackedBar100Series<Chart_Data, String>(
                                  name: '누적 소요시간',
                                  dataSource: chartData,
                                  xValueMapper: (Chart_Data sales, _) =>
                                      sales.x,
                                  yValueMapper: (Chart_Data sales, _) =>
                                      sales.y2,
                                  dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      textStyle: TextStyle(
                                        fontSize: 100.sp,
                                        color: Colors.white,
                                        fontFamily: 'applesdneob',
                                      ),
                                      labelAlignment:
                                          ChartDataLabelAlignment.middle)),
                              StackedBar100Series<Chart_Data, String>(
                                name: '납기 소요시간',
                                dataSource: chartData,
                                xValueMapper: (Chart_Data sales, _) => sales.x,
                                yValueMapper: (Chart_Data sales, _) => sales.y3,
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                      fontSize: 100.sp,
                                      color: Colors.white,
                                      fontFamily: 'applesdneob',
                                    ),
                                    labelAlignment:
                                        ChartDataLabelAlignment.middle),
                              )
                            ],
                            plotAreaBorderWidth: 0,
                            //chart 테두리 삭제
                            borderWidth: 30,
                          ),
                          Table(
                              border: TableBorder(
                                  horizontalInside: BorderSide(
                                      width: 1,
                                      color: Colors.black38,
                                      style: BorderStyle.solid)),

                              children: <TableRow>[
                                    table.getTableHeaderWidget(),
                                  ] +
                                  table.getTableRowWidgets(convertor: (row) {
                                    row['StartDate']=DateFormat('yy/MM/dd').format(DateTime.parse(row['StartDate'])).toString();
                                    row['DueDate']=DateFormat('yy/MM/dd').format(DateTime.parse(row['DueDate'])).toString();
                                    return row;
                                  }))
                        ]);
                      } else
                        return Text('불러오는 중');
                    }))));
  }
}

class Chart_Data {
  Chart_Data(this.x, this.y1, this.y2, this.y3);

  final String x;
  final double y1;
  final double y2;
  final double y3;
}

class ChartData {
  ChartData(this.x, this.y, this.y2, this.y3);

  String? x;
  int y;
  int y2;
  int y3;
}
