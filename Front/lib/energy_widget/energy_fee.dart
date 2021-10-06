import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/energy/energy_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

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

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '이번 달 전기요금 현황은'
            '2,289,982원 이에요',
        softWrap: true,
        style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),
        textAlign: TextAlign.center,
      ),
    );

    Widget chartSection=SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SfCircularChart(
                  tooltipBehavior: _toolTipBehavior,
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                        height: '80%', // Setting height and width for the circular chart annotation
                        width: '80%',
                        widget: Container(
                            child: PhysicalModel(
                                child: Container(),
                                shape: BoxShape.circle,
                                elevation: 10,
                                color: Colors.white))),

                    CircularChartAnnotation(
                        widget: Container(
                            child: const Text('43000\n /63000',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 15,
                                    fontFamily: 'applesdneom'
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
                        radius: '60%'
                    )
                  ]
              ),
              SfCircularChart(
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                        height: '80%', // Setting height and width for the circular chart annotation
                        width: '80%',
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
                            child: const Text('18250kwh\n/50000kwh',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 15,
                                    fontFamily: 'applesdneom'
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
                        radius: '60%'
                    )
                  ]
              )
            ]
        )
    );

    Widget chartSection2=Container(
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
          )
      ),
    );

    Widget datatableSection1= Center(
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
                              fontSize: 15,
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
                          child: Text('요금현황',
                            style: TextStyle(
                                fontSize: 15,
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
                                    '9월',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 17.0,
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
                                  child:Text('전월요금',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontFamily: 'applesdneom'),)
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text('54,000원',
                                    style: TextStyle(
                                        fontSize: 16.0,
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
                                  child: Text('당월누적요금',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontFamily: 'applesdneom'
                                    ),
                                  )
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text('165,000원',
                                    style: TextStyle(
                                        fontSize: 16.0,
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
                                  child: Text('당일 누적요금',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontFamily: 'applesdneom'
                                    ),
                                  )
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text('125,000원',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontFamily: 'applesdneom'),))
                          ),
                        ]
                    )
                  ],
                )
            )
        )
    );


    //Widget chartSection= const ();

    //Widget dataSection=();

    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('요금 현황',
                style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(43, 63, 107, 1),
              leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
                Navigator.of(context).pop();
              }),
            ),
            body: SafeArea(
              child:Padding(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
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