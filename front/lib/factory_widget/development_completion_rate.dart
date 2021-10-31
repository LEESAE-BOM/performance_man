import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/factory/factory_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class development_completion_rate extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _development_completion_rate();
}

class _development_completion_rate extends State<development_completion_rate>{
  final List<String> _valueList =['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
  String? _selectedValue='11월';
  late List<Chart_Data> _chart_Data;
  late List<Chart_Data> _chart_Data2;
  late TooltipBehavior _toolTipBehavior;
  var today=DateTime.now();
  DateFormat formatter=DateFormat('yyyy.MM.dd');

  void initState() {
    _chart_Data = getChartData();
    _chart_Data2 = getChartData2();
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


  @override

  Widget build(BuildContext context) {

    Widget textSection = Padding(
            padding: EdgeInsets.fromLTRB(100.sp, 100.sp, 0, 50.sp),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(// default text style
                    children: <TextSpan>[
                      TextSpan(text: '현재(',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb'
                        ),
                      ),
                      TextSpan(text:formatter.format(today),
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb'
                        ),
                      ),
                      TextSpan(text: ') 개발 완료율은\n',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb'
                        ),
                      ),
                      TextSpan(text: '37% ',
                        style:TextStyle(
                          fontSize:150.sp,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                          fontFamily: 'applesdneoeb',),
                      ),
                      TextSpan(text: '이에요',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 5.0,
                            fontFamily:'applesdneoeb'),
                      ),
                    ],
                  ),
                ),
              ],
            )
        );

    Widget textSection2= Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 540.w,
              height: 50,
              child:Center(
                  child: Text('1) 부품개발',
                      textScaleFactor: 1.0,
                      style:TextStyle(
                        fontSize: 50.sp,
                        color: Colors.black,
                        letterSpacing: 3.0,
                        fontFamily: 'applesdneol',
                      )))),
          Container(
              width: 540.w,
              height: 50,
              child: Center(
                  child: Text('2) 장치개발',style:TextStyle(
                    fontSize: 50.sp,
                    color: Colors.black,
                    letterSpacing: 3.0,
                    fontFamily: 'applesdneol',
                  )
                  ))
          ),
        ]
    );

    Widget chartSection=
    Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 540.w,
                height: 200,
                child: Center(child:
                SfCircularChart(
                    tooltipBehavior: _toolTipBehavior,
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                          height: '90%', // Setting height and width for the circular chart annotation
                          width: '90%',
                          widget: Container(
                              child: PhysicalModel(
                                  child: Container(),
                                  shape: BoxShape.circle,
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  color: Colors.white))),

                      CircularChartAnnotation(
                          widget: Container(
                              child:Text('43%',
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
                      DoughnutSeries<Chart_Data, String>(
                          dataSource: _chart_Data,
                          xValueMapper: (Chart_Data data, _) => data.x,
                          yValueMapper: (Chart_Data data, _) => data.y,
                          pointColorMapper:(Chart_Data data,  _) => data.color,
                          // Radius of doughnut
                          radius: '70%'
                      )
                    ]
                )
                ),
              ),
              Container(
                  width: 540.w,
                  height: 200,
                  child:Center(
                      child:SfCircularChart(
                          tooltipBehavior: _toolTipBehavior,
                          annotations: <CircularChartAnnotation>[
                            CircularChartAnnotation(
                                height: '90%', // Setting height and width for the circular chart annotation
                                width: '90%',
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
                                    child: Text('73%',
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
                            DoughnutSeries<Chart_Data, String>(
                                dataSource: _chart_Data2,
                                xValueMapper: (Chart_Data data, _) => data.x,
                                yValueMapper: (Chart_Data data, _) => data.y,
                                pointColorMapper:(Chart_Data data,  _) => data.color,
                                // Radius of doughnut
                                radius: '70%'
                            )
                          ]
                      )
                  )
              )
            ]
        )
    );

    Widget datatableSection1=
    Padding(
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
                          label: Container(
                              alignment: Alignment.center,
                              width: 1020.w * .3,
                              child:Text('월',
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'
                              ),
                            ),
                          ), // numeric: true,
                        ),
                        DataColumn(
                            label: Container(
                              width: 1020.w * .7,
                                  alignment: Alignment.center,
                                  child: Text('개발 완료율',
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
                                  )
                              )
                            ]
                        ),
                        DataRow(
                            cells: [
                              DataCell(
                                  Align(
                                      alignment: Alignment.center,
                                      child:Text('부품 개발',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),)
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.center,
                                      child:Text('14%',
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
                                      child: Text('장치 개발',
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
                                      child:Text('84%',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),))
                              ),
                            ]
                        ),
                      ],
                    )
                )
            )
        )
    );


    //Widget chartSection= const ();

    //Widget dataSection=();

    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('개발 완료율',
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
            body:
            SafeArea(
              child:Center(
                child: ListView(
                  children: [
                    textSection,
                    textSection2,
                    chartSection,
                    datatableSection1,
                  ],
                ),
              ),)
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
