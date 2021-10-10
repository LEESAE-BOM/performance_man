import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/energy/energy_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;


class hourly_figures extends StatefulWidget {



  @override
  State<StatefulWidget> createState() => _hourly_figures();
}

class _hourly_figures extends State<hourly_figures> {
  late List<Chart_Data> _chart_Data;
  late List<Chart_Data3> _chart_Data2;
  late List<Chart_Data> _chart_Data3;

  late List<_SplineAreaData> _graph_Data1;
  late List<_SplineAreaData> _graph_Data2;
  late TooltipBehavior _toolTipBehavior;



  // index가 0인 페이지 먼저 보여줌
  final PageController pageController = PageController(
    initialPage: 0,
  );

  void initState() {
    _chart_Data = getChartData();
    _chart_Data2 = getChartData2();

    _chart_Data3 = getChartData3();

    _graph_Data1 = getGraphData();
    _graph_Data2 = getGraphData2();
    _toolTipBehavior = TooltipBehavior(enable: true);


    super.initState();
  }

  List<Chart_Data>  getChartData(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('24~01', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('01~02', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('02~03', 1,Color.fromRGBO(226,226,226,1)),
      Chart_Data('03~04', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('04~05', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('05~06', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('06~07', 1,Color.fromRGBO(226,226,226,1)),
      Chart_Data('07~08', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('08~09', 1, Color.fromRGBO(225,72,72,1)),
      Chart_Data('09~10', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('11~12', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('12~13', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('13~14', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('14~15', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('15~16', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('17~18', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('18~19', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('19~20', 1,Color.fromRGBO(226,226,226,1)),
      Chart_Data('15~16', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('17~18', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('18~19', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('20~21', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('21~22', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('22~23', 1, Color.fromRGBO(226,226,226,1)),
      Chart_Data('23~24', 1, Color.fromRGBO(226,226,226,1))
    ];
    return getChartData;
  }

  List<Chart_Data3>  getChartData2(){
    final List<Chart_Data3>  getChartData = [
      Chart_Data3('운영예비(율)',18113,Colors.teal),
      Chart_Data3('공급예비(율)',17216,Colors.amberAccent),
      Chart_Data3('최대부하',21700,Colors.red),
    ];
    return getChartData;
  }

  List<Chart_Data>  getChartData3(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('1', 1, Color.fromRGBO(153,153,153,1)),
      Chart_Data('2', 1, Color.fromRGBO(051,153,051,1)),
      Chart_Data('3', 1, Color.fromRGBO(051,255,051,1)),
      Chart_Data('4', 1, Color.fromRGBO(255,255,051,1)),
      Chart_Data('5', 1, Color.fromRGBO(255,153,000,1)),
      Chart_Data('6', 1, Color.fromRGBO(255,051,000,1)),

    ];
    return getChartData;
  }


  List<_SplineAreaData> getGraphData(){
    final List<_SplineAreaData>  getGraphData = [
      _SplineAreaData(2010, 10.53 ),
      _SplineAreaData(2011, 9.5),
      _SplineAreaData(2012, 10),
      _SplineAreaData(2013, 9.4),
      _SplineAreaData(2014, 5.8),
      _SplineAreaData(2015, 4.9),
      _SplineAreaData(2016, 4.5),
      _SplineAreaData(2017, 3.6 ),
      _SplineAreaData(2018, 3.43),
    ];
    return getGraphData;
  }

  List<_SplineAreaData> getGraphData2(){
    final List<_SplineAreaData>  getGraphData2 = [
      _SplineAreaData(1, 7.53),
      _SplineAreaData(3, 10),
      _SplineAreaData(5, 5.8),
      _SplineAreaData(7, 4.5),
      _SplineAreaData(9, 3.43),
      _SplineAreaData(11, 10),
      _SplineAreaData(13, 9.4),
      _SplineAreaData(15, 5.8),
      _SplineAreaData(17, 15.5),
      _SplineAreaData(19, 3.43),
      _SplineAreaData(21, 10),
      _SplineAreaData(23, 9.4),
    ];
    return getGraphData2;
  }


  @override
  Widget build(BuildContext context) {
    Widget textSection1 = Padding(
        padding:  EdgeInsets.fromLTRB(100.sp, 100.sp,40.sp, 100.sp),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '최대전력 발생 시간은 \n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5,
                        fontFamily: 'applesdneoeb',
                      ),),
                    TextSpan(text: '9시~10시',
                      style:TextStyle(
                        fontSize: 110.sp,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneoeb',
                      ),),
                    TextSpan(text: ',\n최대전력은 \n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontFamily: 'applesdneoeb',),),
                    TextSpan(text: ' 71,700MW',
                      style:TextStyle(
                        fontSize: 110.sp,
                        color: Colors.blue,
                        letterSpacing: 3.0,
                        fontFamily: 'applesdneoeb',),),
                    TextSpan(text: '로 예상돼요',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',),
                    ),

                  ]
              ),
            )
          ],
        )
    );
    Widget textSection2 =Padding(
        padding:  EdgeInsets.fromLTRB(40.sp, 100.sp,40.sp, 100.sp),
        child:Column(
          children: [
            Text.rich(
              TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '최대전력 발생 시간은 \n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5,
                        fontFamily: 'applesdneoeb',
                      ),),
                    TextSpan(text: '9시~10시',
                      style:TextStyle(
                        fontSize: 110.sp,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneoeb',
                      ),),
                    TextSpan(text: ',\n최대전력은 \n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontFamily: 'applesdneoeb',),),
                    TextSpan(text: ' 71,700MW',
                      style:TextStyle(
                        fontSize: 110.sp,
                        color: Colors.blue,
                        letterSpacing: 3.0,
                        fontFamily: 'applesdneoeb',),),
                    TextSpan(text: '로 예상돼요',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',),
                    ),

                  ]
              ),
            )
          ],
        )
    );
    Widget textSection3 =Padding(
        padding:  EdgeInsets.fromLTRB(40.sp, 100.sp,40.sp, 40.sp),
        child:Text('월별 전력 사용량',
          style:TextStyle(
            fontSize:55.sp,
            color: Colors.black,
            letterSpacing: 1,
            fontFamily: 'applesdneoeb',
          ),
        )
    );

    Widget textSection4 = Padding(
        padding:  EdgeInsets.fromLTRB(40.sp, 100.sp,40.sp, 40.sp),
        child:Text('시간대별 전력 사용량',
          style:TextStyle(
            fontSize:55.sp,
            color: Colors.black,
            letterSpacing: 1,
            fontFamily: 'applesdneoeb',
          ),
        )
    );

    Widget chartSection1= Center(
        child: Container(
            width: 1000.w,
            height: 250,
            child:SfCircularChart(
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                      widget: Container(
                          child: Text('9시~10시',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 60.sp,
                                  fontFamily: 'applesdneom'
                              )
                          )
                      )
                  )
                ],
                series: <CircularSeries>[
                  // Renders doughnut chart
                  DoughnutSeries<Chart_Data, String>(
                      dataSource: _chart_Data,
                      pointColorMapper:(Chart_Data data,  _) => data.color,
                      xValueMapper: (Chart_Data data, _) => data.x,
                      yValueMapper: (Chart_Data data, _) => data.y,
                      radius:'100%'
                    // explode: true
                  )
                ]
            )
        )
    );

    Widget chartSection2 =Center(
        child: Container(
            width: 1000.w,
            height: 120,
            child:SfCartesianChart(
              primaryXAxis: CategoryAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(width: 0),
                  isVisible: true
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
              ),
              tooltipBehavior: _toolTipBehavior,
              series: <ChartSeries>[
                BarSeries<Chart_Data3,String>(
                    dataSource: _chart_Data2,
                    isTrackVisible: true,
                    pointColorMapper:(Chart_Data3 data,  _) => data.color,
                    xValueMapper: (Chart_Data3 data, _) => data.x,
                    yValueMapper: (Chart_Data3 data, _) => data.y1,
                    dataLabelSettings: DataLabelSettings(isVisible: true,
                      textStyle: TextStyle(color: Colors.white,fontSize: 35.sp),
                      labelAlignment: ChartDataLabelAlignment.top,
                    ),
                    enableTooltip: true,
                    borderRadius: BorderRadius.circular(5)
                ),

              ],
              plotAreaBorderWidth: 0,
            )
        )
    );

    Widget graphSection1 =Container(
        width: 980.w,
        height: 300,
        child:SfCartesianChart(
            palette: [Colors.amber],
            series: <ChartSeries>[
              SplineAreaSeries<_SplineAreaData, double>(
                  dataSource: _graph_Data1, // Type of spline
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 0.9,
                  xValueMapper: (_SplineAreaData sales, _) => sales.year,
                  yValueMapper: (_SplineAreaData sales, _) => sales.y1
              )
            ],
            primaryXAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            ),
            primaryYAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            )
        )
    );

    Widget graphSection2 =Container(
        width: 980.w,
        height: 300,
        child:SfCartesianChart(
            palette: [Colors.amber],
            series: <ChartSeries>[
              SplineAreaSeries<_SplineAreaData, double>(
                  dataSource: _graph_Data2, // Type of spline
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 0.9,
                  xValueMapper: (_SplineAreaData sales, _) => sales.year,
                  yValueMapper: (_SplineAreaData sales, _) => sales.y1
              )
            ],
            primaryXAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            ),
            primaryYAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            )
        )
    );

    Widget chartSection3= Container(
        width: 1000.w,
        height: 250,
        child:SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                    child:Text(
                      String.fromCharCode(0xe190),
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesdneob'),)
                    ,)
              )
            ],
            series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<Chart_Data, String>(
                  dataSource: _chart_Data3,
                  pointColorMapper:(Chart_Data data,  _) => data.color,
                  xValueMapper: (Chart_Data data, _) => data.x,
                  yValueMapper: (Chart_Data data, _) => data.y,
                  startAngle: 270, // Starting angle of doughnut
                  endAngle: 90,
                  radius: '110%'// Ending angle of doughnut
                //strokeWidth: 20,
                // explode: true
              )
            ]
            ,borderWidth:1
        )
    );


    Widget legendSection=Padding(
        padding:  EdgeInsets.fromLTRB(30.sp, 0,100.sp, 0),
        child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3), //모서리를 둥글게
                          color: Colors.black12
                      ), //테두리
                    ),
                    Text(' 정상')
                  ]
              ),
              Row(
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3), //모서리를 둥글게
                          color: Colors.green
                      ), //테두리
                    ),
                    Text(' 준비 (4,500이상 ~ 5,500미만)')
                  ]
              ),
              Row(
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3), //모서리를 둥글게
                          color: Colors.lightGreen
                      ), //테두리
                    ),
                    Text(' 관심 (3,500이상 ~ 4,500미만)')
                  ]
              ),
              Row(
                  children: <Widget>[
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3), //모서리를 둥글게
                          color: Colors.amberAccent
                      ), //테두리
                    ),
                    Text(' 주의 (2,500이상 ~ 3,500미만)')
                  ]
              ),
              Row( children: <Widget>[
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3), //모서리를 둥글게
                      color: Colors.orange
                  ), //테두리
                ),
                Text(' 경계 (1,500이상 ~ 2,500미만)')
              ]),
              Row( children: <Widget>[
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3), //모서리를 둥글게
                      color: Colors.red
                  ), //테두리
                ),
                Text(' 심각 (1,500미만)')
              ]),
            ]
        )
    );

    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('시간별 전력 사용량',
                style: TextStyle(fontSize:67.sp, fontFamily: 'applesdneom'),),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(43, 63, 107, 1),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color:Colors.white,
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }),
            ),
            body: SafeArea(
                child:Center(
                  child: PageView(
                      controller: pageController,
                      children:<Widget>[
                        ListView(
                          children: <Widget>[
                            textSection1,
                            chartSection1,
                            chartSection2,
                            textSection3,
                            graphSection1,
                          ],
                        ),
                        ListView(
                          children: <Widget>[
                            textSection2,
                            Container(
                                child:Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'image/energy_chart.jpg',
                                        width: 1080.w,
                                        height: 200,
                                      ),
                                      Column(
                                          children:[
                                            SizedBox(height:60),
                                            Transform.rotate(
                                                angle: 360,
                                                child:
                                                Icon(
                                                  Icons.west,
                                                  color: Colors.black54,
                                                  size: 35.0,
                                                )
                                            )
                                          ]
                                      )
                                    ]
                                )
                            ),
                            legendSection,
                            textSection4,
                            graphSection2,
                          ],

                        ),
                      ]
                  ),
                )
            )
        )
    );

  }

}

class Chart_Data {
  Chart_Data(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class Chart_Data2{
  Chart_Data2(this.x,this.y1,this.y2,this.color);
  final double x;
  final double y1;
  final double y2;
  final Color color;
}

class _SplineAreaData {
  _SplineAreaData(this.year, this.y1);
  final double year;
  final double y1;
}

class Chart_Data3{
  Chart_Data3(this.x,this.y1, this.color);
  final String? x;
  final double y1;
  final Color color;
}