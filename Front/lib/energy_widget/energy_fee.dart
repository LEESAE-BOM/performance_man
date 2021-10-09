import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/energy/energy_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class energy_fee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _energy_fee();
}

class _energy_fee extends State<energy_fee> {
  late List<Chart_Data>? _chart_Data;
  late List<Chart_Data>? _chart_Data2;
  late List<Chart_Data3> _chart_Data3;
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
      Chart_Data('Completed', 43, Color.fromRGBO(43, 63, 107,1)),
      Chart_Data('unCompleted', 57,  Colors.grey),
    ];
    return getChartData;
  }

  List<Chart_Data>  getChartData2(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('Completed', 74, Color.fromRGBO(43, 63, 107,1)),
      Chart_Data('unCompleted', 26, Colors.grey),
    ];
    return getChartData;
  }
  List<Chart_Data3>  getChartData3(){
    final List<Chart_Data3>  getChartData = [
      Chart_Data3(1, 1,1, Color.fromRGBO(225,198,198,1)),
      Chart_Data3(2, 2,1, Color.fromRGBO(226,226,226,1)),
      Chart_Data3(3, 3,1, Color.fromRGBO(226,226,226,1)),
    ];
    return getChartData;
  }
  @override
  Widget build(BuildContext context) {

    Widget textSection = Padding(
        padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 0, 50.sp),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(// default text style
                children: <TextSpan>[
              TextSpan(text: '이번 달 전기요금 현황은\n',
                style:TextStyle(
                  fontSize: 65.sp,
                  color: Colors.black,
                  letterSpacing: 3,
                  fontFamily: 'applesdneoeb',
                ),),
              TextSpan(text: '2,289,982원',
                style:TextStyle(
                    fontSize:110.sp,
                    color: Colors.blue,
                    letterSpacing: 5.0,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'applesdneoeb'),
              ),
              TextSpan(text: '이에요',
                  style:TextStyle(
                      fontSize: 65.sp,
                      color: Colors.black,
                      letterSpacing: 3.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneoeb'),
              )
                  ]
              ),
            )
          ],
        )
    );

    Widget chartSection= Container(
        child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 540.w,
                  height: 200,
                  child: SfCircularChart(
                      tooltipBehavior: _toolTipBehavior,
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                            height: '110%', // Setting height and width for the circular chart annotation
                            width: '110%',
                            widget: Container(
                                child: PhysicalModel(
                                    child: Container(),
                                    shape: BoxShape.circle,
                                    elevation: 10,
                                    color: Colors.white))),

                        CircularChartAnnotation(
                            widget: Container(
                                child:
                                Text('43000\n /63000',
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontSize: 45.sp,
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
                            radius: '80%'
                        )
                      ]
                  )),
              Container(
                  width: 540.w,
                  height: 200,
                  child:SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                            height: '110%', // Setting height and width for the circular chart annotation
                            width: '110%',
                            widget: Container(
                                child: PhysicalModel(
                                    child: Container(),
                                    shape: BoxShape.circle,
                                    elevation: 10,
                                    // shadowColor: Colors.black,
                                    color: Colors.white
                                ))),

                        CircularChartAnnotation(
                            widget: Container(
                                child:Text('18250kwh\n/50000kwh',
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontSize: 43.sp,
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
                            radius: '80%'
                        )
                      ]
                  ))
            ]
        )
    );

    Widget chartSection2=Container(
      width: 800.w,
      height: 200,
      child:Center(
          child: SfCartesianChart(
            tooltipBehavior: _toolTipBehavior,
            series: <ChartSeries>[
              StackedBar100Series<Chart_Data3,double>(
                dataSource: _chart_Data3,
                pointColorMapper:(Chart_Data3 data,  _) => data.color,
                xValueMapper: (Chart_Data3 data, _) => data.x,
                yValueMapper: (Chart_Data3 data, _) => data.y1,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
                color: Colors.blueAccent,
              ),
            ],
            primaryXAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                labelFormat: '{value}월',
                isVisible: false
            ),
            primaryYAxis: NumericAxis(
                isVisible: false
              // edgeLabelPlacement: EdgeLabelPlacement.shift
            ),
            plotAreaBorderWidth: 0,
          )
      ),
    );

    Widget datatableSection1=
    Padding(
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
                            Text('구분',
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
                              child: Text('요금현황',
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
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child:Text(
                                        '9월',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 45.sp,
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
                                      child:Text('전월요금',
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),)
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('54,000원',
                                        style: TextStyle(
                                            fontSize:45.sp,
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
                                      child: Text('당월누적요금',
                                        style: TextStyle(
                                            fontSize:45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'
                                        ),
                                      )
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('165,000원',
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
                                      child: Text('당일 누적요금',
                                        style: TextStyle(
                                            fontSize:45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'
                                        ),
                                      )
                                  )
                              ),
                              DataCell(
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text('125,000원',
                                        style: TextStyle(
                                            fontSize:45.sp,
                                            color: Colors.black54,
                                            fontFamily: 'applesdneoeb'),))
                              ),
                            ]
                        )
                      ],
                    )
                )
            )
        ));


    //Widget chartSection= const ();

    //Widget dataSection=();

    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('요금 현황',
                style: TextStyle(fontSize: 67.sp, fontFamily: 'applesdneom'),),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(43, 63, 107, 1),
              leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
                Navigator.of(context).pop();
              }),
            ),
            body: SafeArea(
              child:Center(
                child: ListView(
                  children: [
                    textSection,
                    chartSection,
                    chartSection2,
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
class Chart_Data3{
  Chart_Data3(this.x,this.y1,this.y2,this.color);
  final double x;
  final double y1;
  final double y2;
  final Color color;

}