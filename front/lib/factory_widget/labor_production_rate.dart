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
  final List<String> _valueList =['최근 1개월','최근 3개월','최근 6개월','최근 12개월'];
  String? _selectedValue='최근 3개월';

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
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '2021년 9월의\n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(text: '노동생산율',
                      style:TextStyle(
                        fontSize: 110.sp,
                        color: Colors.blue,
                        letterSpacing: 3.0, //fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(text: '은 ',
                      style:TextStyle(
                          fontSize:  60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(text: '74',
                      style:TextStyle(
                          fontSize: 120.sp,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(text: '이에요\n',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(text: '전월대비',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(text: '13 증가',
                      style:TextStyle(
                          fontSize: 110.sp,
                          color: Colors.blue,
                          letterSpacing: 4.0,
                        fontFamily: 'applesdneoeb',),
                    ),
                    TextSpan(text: '했어요',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                        fontFamily: 'applesdneoeb',),
                    ),
                  ],
                )
            ),
            ]

        ));

    Widget textSection2 =Padding(
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '2021년 9월의\n',
                      style:TextStyle(
                        fontSize: 60.sp,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(text: '노동생산율',
                      style:TextStyle(
                        fontSize: 110.sp,
                        color: Colors.blue,
                        letterSpacing: 3.0,
                        fontFamily: 'applesdneoeb',),
                    ),
                    TextSpan(text: '은 ',
                      style:TextStyle(
                          fontSize:  60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          fontFamily: 'applesdneoeb'),
                    ),
                    TextSpan(text: '74',
                      style:TextStyle(
                          fontSize: 120.sp,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                          fontFamily: 'applesdneoeb'),
                    ),
                    TextSpan(text: '이에요\n',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesdneoeb'),
                    ),
                    TextSpan(text: '전년대비 ',
                      style:TextStyle(
                          fontSize: 60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesdneoeb'),
                    ),
                    TextSpan(text: '13 증가',
                      style:TextStyle(
                          fontSize: 110.sp,
                          color: Colors.blue,
                          letterSpacing: 4.0,
                          fontFamily: 'applesdneoeb'),
                    ),
                    TextSpan(text: '했어요',
                      style:TextStyle(
                          fontSize:60.sp,
                          color: Colors.black,
                          letterSpacing: 5.0,
                          fontFamily: 'applesdneoeb'),
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
        padding:  EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
        child:Center(
            child: Container(
                width: 1020.w,
                child: Theme(
                    data: Theme.of(context).copyWith(
                        dividerColor: Colors.black12
                    ),
                    child: DataTable(
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black12),
                      columns: [
                        DataColumn(
                          label:Container(
                            alignment: Alignment.center,
                            width: 1020.w * .3,
                              child:DropdownButton(
                                value:_selectedValue,
                                items: _valueList.map(
                                      (String value){
                                    return DropdownMenuItem(
                                        value:value,
                                        child: Text(value)
                                    );
                                  },
                                ).toList(),
                                onChanged: (String? value){
                                  setState((){
                                    _selectedValue=value;
                                  });
                                },
                              )
                          ),
                          // numeric: true,
                        ),
                        DataColumn(
                            label:
                            Container(
                              width: 1020.w * .7,
                              alignment: Alignment.center,
                              child: Text('노동생산성',
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'
                                ),
                              ),
                            )
                        ),
                      ],
                      rows: [
                        DataRow(
                            cells: [
                              DataCell(Text('')),
                              DataCell(
                                  Container(
                                      width: 1020.w * .6,
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
                                      alignment: Alignment.center,
                                      child:Text('2021.09',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),)
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.center,
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
                                      alignment: Alignment.center,
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
                                      alignment: Alignment.center,
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
                                      alignment: Alignment.center,
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
                                      alignment: Alignment.center,
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

    Widget datatableSection2=Padding(
        padding:  EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
        child: Center(
            child: Container(
                width: 1020.w,
                child: Theme(
                    data: Theme.of(context).copyWith(
                        dividerColor: Colors.black12
                    ),
                    child: DataTable(
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black12),
                      columns: [
                        DataColumn(
                          label: Container(
                            width: 1020.w * .3,
                            alignment: Alignment.center,
                            child:
                            Text('년도',
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
                            Container(
                              width: 1020.w * .7,
                              alignment: Alignment.center,
                              child: Text('노동생산성',
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
                                  Container(
                                      width: 1020.w * .6,
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
                                      alignment: Alignment.center,
                                      child:Text('2021',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),)
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.center,
                                      child:Text('54',
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
                                      alignment: Alignment.center,
                                      child: Text('2020',
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
                                      alignment: Alignment.center,
                                      child:Text('75',
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
                                      alignment: Alignment.center,
                                      child: Text('2019',
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
                                      alignment: Alignment.center,
                                      child:Text('12',
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
            title: Text('노동 생산율',
              style: TextStyle(fontSize: 67.sp,
                  color: Colors.white,
                  letterSpacing: 1.0,
                  fontFamily: 'applesdneoeb'),),
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