import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/factory/factory_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

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
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Text.rich(
              TextSpan(// default text style
                children: <TextSpan>[
                  TextSpan(text: '2021년 9월 27일의\n',
                    style:TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      fontFamily: 'applesdneob',
                    ),),
                  TextSpan(text: '설비 가동율',
                    style:TextStyle(
                      fontSize: 40.0,
                      color: Colors.blue,
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob',),),
                  TextSpan(text: '은  ',
                    style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '37% ',
                    style:TextStyle(
                      fontSize: 40.0,
                      color: Colors.blue,
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob',),),
                  TextSpan(text: '이에요',
                    style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                ],
              ),
            ),
          ],
        )
    );

    Widget chartSection=
    SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
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
                                shadowColor: Colors.black,
                                color: Colors.white)
                        )
                    ),

                    CircularChartAnnotation(
                        widget: Container(
                            child: const Text('일간\n43%',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 35,
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
                                shadowColor: Colors.black,
                                color: Colors.white
                            ))),

                    CircularChartAnnotation(
                        widget: Container(
                            child: const Text('주간\n73%',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 35,
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
                                shadowColor: Colors.black,
                                color: Colors.white
                            ))),

                    CircularChartAnnotation(
                        widget: Container(
                            child: const Text('월간\n73%',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 35,
                                    fontFamily: 'applesdneom'
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
                        radius: '60%'
                    )
                  ]
              )
            ]
        )

    );

    Widget datatableSection1=Center(
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
                          child: Text('설비 완료율',
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
                                    '최근 3개월',
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
                                  child:Text('2021.09',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontFamily: 'applesdneom'),)
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text('14',
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
                                  child: Text('2021.09',
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
                                  child:Text('84',
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
                                  child: Text('2021.10',
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
                                  child:Text('72',
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
              title: Text('설비가동율',
                style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(43, 63, 107, 1),
              leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
                Navigator.of(context).pop();
              }),
            ),
            body:SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0,15.0,15.0, 0),
                child:Center(
                  child: ListView(
                    children: [
                      textSection,
                      chartSection,
                      datatableSection1,
                    ],
                  ),
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
