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

  late List<Chart_Data> _chart_Data;
  late List<Chart_Data> _chart_Data2;
  late TooltipBehavior _toolTipBehavior;

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
    Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                                color: Colors.white))),

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
                    )
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

    Widget datatableSection=
    DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black12),
      columns: [
        DataColumn(
          label:
          Align(
            alignment: Alignment.centerRight,
            child: Text('월', style: TextStyle(fontSize: 15, fontFamily: 'applesdneom'),
            ),

          ),
          // numeric: true,
        ),
        DataColumn(
            label:
            Align(
              alignment: Alignment.centerLeft,
              child: Text('지수', style: TextStyle(fontSize: 15, fontFamily: 'applesdneom'),
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
            cells: [ DataCell(Text('A1')), DataCell(Text('B1')), ] ),
        DataRow(
            cells: [ DataCell(Text('A2')), DataCell(Text('B2')), ] ),
      ],
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
            Factory_Screen();
          }),
        ),
        body: Center(
          child: ListView(
            children: [
              textSection,
              chartSection,
              datatableSection,
            ],
          ),
        ),
      ),
    );

  }

}

class Chart_Data {
  Chart_Data(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}