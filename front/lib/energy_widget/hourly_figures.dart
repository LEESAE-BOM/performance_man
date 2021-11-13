import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class hourly_figures extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _hourly_figures();
}

class _hourly_figures extends State<hourly_figures> {
  late List<Chart_Data3> _chart_Data2;

  late ZoomPanBehavior _zoomPanBehavior;

  List<Chart_Data> _chart_Data = [];
  List<_SplineAreaData> Energyusage = [];
  List<_SplineAreaData1> Energyusage_time = [];

  List<String> imageList=[
    'image/energychart01.png',
    'image/energychart02.png',
    'image/energychart03.png',
    'image/energychart04.png',
    'image/energychart05.png',
    'image/energychart06.png',
  ];

  void initState() {
    _chart_Data2 = getChartData2();

    _zoomPanBehavior = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming: true);
    for (double i = 1; i <= 12; i++)
      Energyusage.add(_SplineAreaData('$i월', 0, 0, 0));

    for (double i = 1; i <= 24; i++)
      Energyusage_time.add(_SplineAreaData1('$i시', 0, 0));

    for (double i = 1; i < 24; i += 2)
      _chart_Data.add(
          Chart_Data('$i시~${i + 1}시', 1, Color.fromRGBO(226, 226, 226, 1)));

    super.initState();
  }

  List<Chart_Data3> getChartData2() {
    final List<Chart_Data3> getChartData = [
      Chart_Data3('운영예비(율)', 18113, Colors.teal),
      Chart_Data3('공급예비(율)', 17216, Colors.amberAccent),
      Chart_Data3('최대부하', 21700, Colors.red),
    ];
    return getChartData;
  }

  List<Chart_Data> getChartData3() {
    final List<Chart_Data> getChartData = [
      Chart_Data('1', 1, Color.fromRGBO(153, 153, 153, 1)),
      Chart_Data('2', 1, Color.fromRGBO(051, 153, 051, 1)),
      Chart_Data('3', 1, Color.fromRGBO(051, 255, 051, 1)),
      Chart_Data('4', 1, Color.fromRGBO(255, 255, 051, 1)),
      Chart_Data('5', 1, Color.fromRGBO(255, 153, 000, 1)),
      Chart_Data('6', 1, Color.fromRGBO(255, 051, 000, 1)),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '시간별 전력 사용량',
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
                        'SELECT UseDate,HOUR(UseTime) as UseTime,Amount * 1000 as Amount FROM EnergyUse ORDER BY UseDate DESC;;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;
                        var thisYear =
                            DateTime.parse(result[0]['UseDate']).year; //2019년

                        String chart_image='';

                        for (var row in result) {
                          DateTime toDate = DateTime.parse(row['UseDate']);
                          int toDate1 = int.parse(row['UseTime']);
                          int term = thisYear - toDate.year;
                          String energyStr = row['Amount'];
                          energyStr =
                              energyStr.substring(0, energyStr.length - 3);

                          String energyStr1 = row['Amount'];
                          energyStr1 =
                              energyStr1.substring(0, energyStr1.length - 3);

                          Energyusage_time[toDate1 - 1].y1 =
                              double.parse(energyStr);
                          Energyusage_time[toDate1 - 1].y2 =
                              double.parse(energyStr1);
                          if (term == 0) {
                            Energyusage[toDate.month - 1].y1 =
                                double.parse(energyStr);
                          } else if (term == 1) {
                            Energyusage[toDate.month - 1].y2 =
                                double.parse(energyStr);
                          } else if (term == 2) {
                            Energyusage[toDate.month - 1].y3 =
                                double.parse(energyStr);
                          } else if (term <= 3) break;
                        }

                        int max = 0;
                        for (int i = 1; i < 24; i++) {
                          if (Energyusage_time[max].y2 <
                              Energyusage_time[i].y2) {
                            max = i;
                          }
                        }
                        _chart_Data[(max / 2).round() - 3].color =
                            Color.fromRGBO(225, 72, 72, 1);

                        if(Energyusage_time[max].y2<1000){
                          chart_image=imageList[0];
                        }else if(Energyusage_time[max].y2<2000){
                          chart_image=imageList[1];}
                        else if(Energyusage_time[max].y2<3000){
                          chart_image=imageList[2];}
                        else if(Energyusage_time[max].y2<4000){
                          chart_image=imageList[3];}
                        else if(Energyusage_time[max].y2<5000){
                          chart_image=imageList[4];}
                        else{
                          chart_image=imageList[5];}



                        return ListView(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  50.sp, 100.sp, 20.sp, 100.sp),
                              child: Text.rich(TextSpan(children: [
                                detailPageTheme.makeHeaderText(
                                    '최대 전력 발생시간은 [${max}시~${max + 1}시]'),
                              ]))),
                          Column(children: <Widget>[
                            CarouselSlider(
                                options: CarouselOptions(
                                  height: 400,
                                  autoPlay: false,
                                  aspectRatio: 3.0,
                                  initialPage: 0,
                                ),
                                items: [
                                  ListView(children: <Widget>[
                                    Container(
                                        width: 1080.w,
                                        height: 250,
                                        child: SfCircularChart(annotations: <
                                            CircularChartAnnotation>[
                                          CircularChartAnnotation(
                                              widget: Container(
                                                  child: Text(
                                                      '${max}시~${max + 1}시',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 60.sp,
                                                          fontFamily:
                                                              'applesdneom'))))
                                        ], series: <CircularSeries>[
                                          // Renders doughnut chart
                                          DoughnutSeries<Chart_Data, String>(
                                              dataSource: _chart_Data,
                                              pointColorMapper:
                                                  (Chart_Data data, _) =>
                                                      data.color,
                                              xValueMapper:
                                                  (Chart_Data data, _) =>
                                                      data.x,
                                              yValueMapper:
                                                  (Chart_Data data, _) =>
                                                      data.y,
                                              radius: '100%'
                                              // explode: true
                                              )
                                        ])),
                                    Center(
                                        child: Container(
                                            width: 1080.w,
                                            height: 120,
                                            child: SfCartesianChart(
                                              primaryXAxis: CategoryAxis(
                                                  edgeLabelPlacement:
                                                      EdgeLabelPlacement.shift,
                                                  majorGridLines:
                                                      MajorGridLines(width: 0),
                                                  axisLine: AxisLine(width: 0),
                                                  majorTickLines:
                                                      MajorTickLines(width: 0),
                                                  isVisible: true),
                                              primaryYAxis: NumericAxis(
                                                isVisible: false,
                                                majorGridLines:
                                                    MajorGridLines(width: 0),
                                                axisLine: AxisLine(width: 0),
                                              ),
                                              series: <ChartSeries>[
                                                BarSeries<Chart_Data3, String>(
                                                    dataSource: _chart_Data2,
                                                    isTrackVisible: true,
                                                    trackColor: Colors.black12,
                                                    pointColorMapper:
                                                        (Chart_Data3 data, _) =>
                                                            data.color,
                                                    xValueMapper:
                                                        (Chart_Data3 data, _) =>
                                                            data.x,
                                                    yValueMapper:
                                                        (Chart_Data3 data, _) =>
                                                            data.y1,
                                                    dataLabelSettings:
                                                        DataLabelSettings(
                                                      isVisible: true,
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 35.sp),
                                                      labelAlignment:
                                                          ChartDataLabelAlignment
                                                              .top,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              ],
                                              plotAreaBorderWidth: 0,
                                            )))
                                  ]),
                                  ListView(children: <Widget>[
                                    Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            chart_image,
                                            width: 1080.w,
                                            height: 200,
                                          )

                                        ]),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            100.sp, 0, 100.sp, 0),
                                        child: Column(children: <Widget>[
                                          Row(children: <Widget>[
                                            Container(
                                              width: 17,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3), //모서리를 둥글게
                                                  color: Colors.black12), //테두리
                                            ),
                                            Text(' 정상')
                                          ]),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(children: <Widget>[
                                            Container(
                                              width: 17,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3), //모서리를 둥글게
                                                  color: Colors.green), //테두리
                                            ),
                                            Text(' 준비 (4,500이상 ~ 5,500미만)')
                                          ]),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(children: <Widget>[
                                            Container(
                                              width: 17,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3), //모서리를 둥글게
                                                  color:
                                                      Colors.lightGreen), //테두리
                                            ),
                                            Text(' 관심 (3,500이상 ~ 4,500미만)')
                                          ]),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(children: <Widget>[
                                            Container(
                                              width: 17,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3), //모서리를 둥글게
                                                  color:
                                                      Colors.amberAccent), //테두리
                                            ),
                                            Text(' 주의 (2,500이상 ~ 3,500미만)')
                                          ]),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(children: <Widget>[
                                            Container(
                                              width: 17,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3), //모서리를 둥글게
                                                  color: Colors.orange), //테두리
                                            ),
                                            Text(' 경계 (1,500이상 ~ 2,500미만)')
                                          ]),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(children: <Widget>[
                                            Container(
                                              width: 17,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3), //모서리를 둥글게
                                                  color: Colors.red), //테두리
                                            ),
                                            Text(' 심각 (1,500미만)')
                                          ]),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                        ])),
                                  ]),
                                ]),
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    40.sp, 100.sp, 40.sp, 40.sp),
                                child: Text(
                                  '시간대별 전력 사용량',
                                  style: TextStyle(
                                    fontSize: 55.sp,
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    fontFamily: 'applesdneoeb',
                                  ),
                                )),
                            Container(
                                width: 1080.w,
                                height: 300,
                                child: SfCartesianChart(
                                    palette: [Colors.indigo],
                                    zoomPanBehavior: _zoomPanBehavior,
                                    series: <ChartSeries>[
                                      SplineAreaSeries<_SplineAreaData1,
                                              String>(
                                          dataSource: Energyusage_time,
                                          // Type of spline
                                          splineType: SplineType.cardinal,
                                          cardinalSplineTension: 0.9,
                                          xValueMapper:
                                              (_SplineAreaData1 energy, _) =>
                                                  energy.x,
                                          yValueMapper:
                                              (_SplineAreaData1 energy, _) =>
                                                  energy.y1)
                                    ],
                                    primaryXAxis: CategoryAxis(
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.shift,
                                    ),
                                    primaryYAxis: NumericAxis(
                                        edgeLabelPlacement:
                                            EdgeLabelPlacement.shift,
                                        numberFormat: NumberFormat.compact())))
                          ])
                        ]);
                      } else
                        return Text('불러오는 중');
                    }))));
  }
}

class Chart_Data {
  Chart_Data(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}

class Chart_Data2 {
  Chart_Data2(this.x, this.y1, this.y2, this.color);

  final double x;
  final double y1;
  final double y2;
  final Color color;
}

class _SplineAreaData {
  _SplineAreaData(this.month, this.y1, this.y2, this.y3);

  String? month;
  double y1;
  double y2;
  double y3;
}

class _SplineAreaData1 {
  _SplineAreaData1(this.x, this.y1, this.y2);

  String? x;
  double y1;
  double y2;
}

class Chart_Data3 {
  Chart_Data3(this.x, this.y1, this.color);

  final String? x;
  final double y1;
  final Color color;
}
