import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/factory/factory_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class capacity_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _capacity_ratio();
}

class _capacity_ratio extends State<capacity_ratio> {

  late List<Chart_Data>? _chart_Data;
  late List<Chart_Data>? _chart_Data2;
  late List<Chart_Data>? _chart_Data3;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _chart_Data = getChartData();
    _chart_Data2 = getChartData2();
    _chart_Data3 = getChartData3();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data>  getChartData(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('Completed', 43, Colors.lightBlue),
      Chart_Data('unCompleted', 57,  Colors.lightBlueAccent),
    ];
    return getChartData;
  }

  List<Chart_Data>  getChartData2(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('Completed', 74, Colors.lightBlue),
      Chart_Data('unCompleted', 26, Colors.lightBlueAccent),
    ];
    return getChartData;
  }

  List<Chart_Data>  getChartData3(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('Completed', 74, Colors.lightBlue),
      Chart_Data('unCompleted', 26, Colors.lightBlueAccent),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {

    Widget textSection = Padding(
            padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 0, 50.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(// default text style
                    children: <TextSpan>[
                      TextSpan(text: '2021년 9월 27일의\n',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 4.0,
                            fontFamily: 'applesdneoeb'
                        ),),
                      TextSpan(text: '설비 가동율',
                        style:TextStyle(
                          fontSize:110.sp,
                          color: Colors.blue,
                          letterSpacing: 3.0,
                          fontFamily: 'applesdneoeb',),),
                      TextSpan(text: '은 ',
                        style:TextStyle(
                            fontSize: 40.sp,
                            color: Colors.black,
                            letterSpacing: 5.0,
                            fontFamily: 'applesdneoeb'),),
                      TextSpan(text: '37%',
                        style:TextStyle(
                            fontSize:110.sp,
                            color: Colors.blue,
                            letterSpacing: 3.0,
                            fontFamily: 'applesdneoeb'),),
                      TextSpan(text: ' 이에요',
                        style:TextStyle(
                            fontSize: 40.sp,
                            color: Colors.black,
                            letterSpacing: 1.0,
                            fontFamily: 'applesdneoeb'),),
                    ],
                  ),
                ),
              ],
            ));

    Widget chartSection=
    Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 360.w,
                  height: 200,
                  child:
                  Center(
                      child: SfCircularChart(
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
                                        color: Colors.white)
                                )
                            ),

                            CircularChartAnnotation(
                                widget: Container(
                                    child: Text('일간\n43%',
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 0.5),
                                            fontSize: 65.sp,
                                            fontFamily: 'applesdneoeb'
                                        )
                                    )
                                )
                            ),
                          ],

                          series: <CircularSeries>[
                            DoughnutSeries<Chart_Data, String>(
                                dataSource: _chart_Data,
                                xValueMapper: (Chart_Data data, _) => data.x,
                                yValueMapper: (Chart_Data data, _) => data.y,
                                pointColorMapper:(Chart_Data data,  _) => data.color,
                                // Radius of doughnut
                                radius: '95%'
                            )
                          ]
                      ))),
              Container(
                  width: 360.w,
                  height: 200,
                  child: Center(child:
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
                                ))),

                        CircularChartAnnotation(
                            widget: Container(
                                child: Text('주간\n73%',
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontSize: 65.sp,
                                        fontFamily: 'applesdneoeb'
                                    )
                                )
                            )
                        )
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<Chart_Data, String>(
                            dataSource: _chart_Data2,
                            xValueMapper: (Chart_Data data, _) => data.x,
                            yValueMapper: (Chart_Data data, _) => data.y,
                            pointColorMapper:(Chart_Data data,  _) => data.color,
                            // Radius of doughnut
                            radius: '95%'
                        )
                      ]
                  )
                  )
              ),
              Container(
                  width: 360.w,
                  height: 200,
                  child: Center(child:
                  SfCircularChart(
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
                                ))),

                        CircularChartAnnotation(
                            widget: Container(
                                child: Text('월간\n73%',
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontSize: 65.sp,
                                        fontFamily: 'applesdneoeb'
                                    )
                                )
                            )
                        )
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<Chart_Data, String>(
                            dataSource: _chart_Data3,
                            xValueMapper: (Chart_Data data, _) => data.x,
                            yValueMapper: (Chart_Data data, _) => data.y,
                            pointColorMapper:(Chart_Data data,  _) => data.color,
                            // Radius of doughnut
                            radius: '95%'
                        )
                      ]
                  )))

            ]
        )

    );

    Widget datatableSection1= Padding(
        padding:  EdgeInsets.fromLTRB(40.sp, 100.sp,40.sp, 0),
        child: Center(
            child: Container(
                width: double.infinity,
                child: Theme(
                    data: Theme.of(context).copyWith(
                        dividerColor: Colors.black12
                    ),
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black12),
                      columns: [
                        DataColumn(
                          label: Align(
                            alignment: Alignment.center,
                            child:
                            Text('월',
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'
                              ),
                            ),
                          ),
                          // numeric: true,
                        ),
                        DataColumn(
                            label:
                            Align(
                              alignment: Alignment.center,
                              child: Text('설비 완료율',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'
                                ),
                              ),
                            )
                        ),
                        /*DataColumn(
          label: Center(
              widthFactor: 4.0,
              child: Text('지수', style: TextStyle(fontSize: 15, fontFamily: 'applesdneoeb'),)
          ),
        ),*/
                      ],
                      rows: [
                        DataRow(
                            cells: [
                              DataCell(Text('')),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child:Text(
                                        '최근 3개월',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 48.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),
                                      )
                                  )
                              )
                            ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('2021.08',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),)
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('14',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),
                                      )
                                  )
                              ),
                            ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('2021.09',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'
                                        ),
                                      )
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('84',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),))
                              ),
                            ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('2021.10',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'
                                        ),
                                      )
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('72',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),))
                              ),
                            ]
                        )
                      ],
                    )
                )
            )
        )
    );

    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('설비가동율',
                style: TextStyle(fontSize: 67.sp,
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontFamily: 'applesdneoeb'),),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(43, 63, 107, 1),
              leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
                Navigator.of(context).pop();
              }),
            ),
            body:SafeArea(
              child:Center(
                child: ListView(
                  children: [
                    textSection,
                    chartSection,
                    datatableSection1,
                  ],
                ),
              ),
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
