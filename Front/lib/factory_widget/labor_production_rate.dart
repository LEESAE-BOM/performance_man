import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/factory/factory_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class labor_production_rate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_production_rate();
}

class _labor_production_rate extends State<labor_production_rate> {

  late List<Chart_Data> _chartData;
  late List<Chart_Data2> _chartData2;
  late TooltipBehavior _toolTipBehavior;
  // index가 0인 페이지 먼저 보여줌
  final PageController pageController = PageController(
    initialPage: 0,
  );

  void initState() {
    _chartData = getChartData();
    _chartData2 = getChartData2();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data> getChartData(){
    final List<Chart_Data> chartData = [
      Chart_Data(3, 151),
      Chart_Data(4, 251),
      Chart_Data(5, 51),
      Chart_Data(6, 152),
      Chart_Data(7, 202),
      Chart_Data(8, 259),
      Chart_Data(9, 500)
    ];
    return chartData;
  }


  List<Chart_Data2> getChartData2(){
    final List<Chart_Data2> chartData = [
      Chart_Data2(2018, 501),
      Chart_Data2(2019, 152),
      Chart_Data2(2020, 202),
      Chart_Data2(2021, 259),
      Chart_Data2(2022, 500)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {

    Widget textSection1 =Padding(
        padding: EdgeInsets.fromLTRB(20.sp, 100.sp, 20.sp, 50.sp),
        child:Column(
            children: [Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '2021년 9월의\n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontFamily: 'applesdneom',
                      ),
                    ),
                    TextSpan(text: '노동생산율 ',
                      style:TextStyle(
                        fontSize: 120.sp,
                        color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        letterSpacing: 3.0, //fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneom'),
                    ),
                    TextSpan(text: '은 ',
                      style:TextStyle(
                          fontSize:  60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesdneom',),
                    ),
                    TextSpan(text: '74',
                      style:TextStyle(
                          fontSize: 120.sp,
                          color: Colors.blue,
                        fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesdneom',),
                    ),
                    TextSpan(text: '이에요\n',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '전월대비',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '13 증가',
                      style:TextStyle(
                          fontSize: 120.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '했어요',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                  ],
                )
            ),
            ]

        ));

    Widget textSection2 =Padding(
        padding: EdgeInsets.fromLTRB(20.sp, 100.sp, 20.sp, 50.sp),
        child:Column(
            children: [Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '2021년 9월의\n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontFamily: 'applesneom',
                      ),
                    ),
                    TextSpan(text: '노동생산율 ',
                      style:TextStyle(
                        fontSize: 110.sp,
                        color: Colors.blue,
                        letterSpacing: 5.0, //fontWeight: FontWeight.bold,
                        fontFamily: 'applesneom',),
                    ),
                    TextSpan(text: '은 ',
                      style:TextStyle(
                          fontSize:  60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '74',
                      style:TextStyle(
                          fontSize: 120.sp,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '이에요\n',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '전년대비 ',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '13 증가',
                      style:TextStyle(
                          fontSize: 120.sp,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                    TextSpan(text: '했어요',
                      style:TextStyle(
                          fontSize:60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesneom'),
                    ),
                  ],
                )
            ),
            ]

        ));

    Widget chartSection1=
    Center(
        child:Container(
            width: 1000.w,
            height: 300,
            child:SfCartesianChart(
              tooltipBehavior: _toolTipBehavior,
              series: <ChartSeries>[
                AreaSeries<Chart_Data,double>(dataSource: _chartData,
                  xValueMapper: (Chart_Data labors, _) =>labors.year,
                  yValueMapper: (Chart_Data labors, _) =>labors.labor,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                  color: Colors.blueAccent,
                ),
              ],
              primaryXAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              plotAreaBorderWidth: 0,//  borderWidth: 0.4,
            )
        )
    );

    Widget chartSection2= Center(
        child:Container(
            width: 1000.w,
            height: 300,
            child:SfCartesianChart(
              tooltipBehavior: _toolTipBehavior,
              series: <ChartSeries>[
                BarSeries<Chart_Data2,double>(
                  dataSource: _chartData2,
                  xValueMapper: (Chart_Data2 labors, _) =>labors.year,
                  yValueMapper: (Chart_Data2 labors, _) =>labors.labor,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                  color: Colors.blueAccent,
                ),
              ],
              primaryXAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              plotAreaBorderWidth: 0,
            )
        )
    );

    Widget datatableSection1=Padding(
        padding:  EdgeInsets.fromLTRB(40.sp, 100.sp,40.sp, 0),
        child:Center(
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
                                  fontFamily: 'applesdneom'
                              ),
                            ),
                          ),
                          // numeric: true,
                        ),
                        DataColumn(
                            label:
                            Align(
                              alignment: Alignment.center,
                              child: Text('노동생산성',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    fontFamily: 'applesdneom'
                                ),
                              ),
                            )
                        ),
                        /*DataColumn(
          label: Center(
              widthFactor: 4.0,
              child: Text('지수', style: TextStyle(fontSize: 15, fontFamily: 'applesdneom'),)
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
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),
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
                                      child:Text('2021.09',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),)
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('14',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),
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
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'
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
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),))
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
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'
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
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),))
                              ),
                            ]
                        )
                      ],
                    )
                )
            )
        )
    );

    Widget datatableSection2=Padding(
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
                            Text('년도',
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  fontFamily: 'applesdneom'
                              ),
                            ),
                          ),
                          // numeric: true,
                        ),
                        DataColumn(
                            label:
                            Align(
                              alignment: Alignment.center,
                              child: Text('노동생산성',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    fontFamily: 'applesdneom'
                                ),
                              ),
                            )
                        ),
                        /*DataColumn(
          label: Center(
              widthFactor: 4.0,
              child: Text('지수', style: TextStyle(fontSize: 15, fontFamily: 'applesdneom'),)
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
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),
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
                                      child:Text('2021',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),)
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('54',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),
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
                                      child: Text('2020',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'
                                        ),
                                      )
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('75',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),))
                              ),
                            ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('2019',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'
                                        ),
                                      )
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('12',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black,
                                            fontFamily: 'applesdneom'),))
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
            title: Text('노동 생산율',
              style: TextStyle(fontSize: 67.sp,
                  color: Colors.white,
                  letterSpacing: 1.0,
                  fontFamily: 'applesdneom'),),
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
            child: PageView(
                controller: pageController,
                children:<Widget>[
                  Center(
                      child:ListView(
                          children: <Widget>[
                            textSection1,
                            chartSection1,
                            datatableSection1
                          ]
                      )),
                  Center(
                      child:ListView(
                          children: <Widget>[
                            textSection2,
                            chartSection2,
                            datatableSection2
                          ]
                      ))
                ]
            ),
          ),

        )
    );

  }
}

class Chart_Data{
  Chart_Data(this.year,this.labor);
  final double year;
  final double labor;
}
class Chart_Data2{
  Chart_Data2(this.year,this.labor);
  final double year;
  final double labor;
}