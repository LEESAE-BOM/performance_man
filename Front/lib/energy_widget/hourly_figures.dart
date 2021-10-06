import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/energy/energy_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class hourly_figures extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _hourly_figures();
}

class _hourly_figures extends State<hourly_figures> {
  late List<Chart_Data> _chart_Data;
  late List<Chart_Data2> _chart_Data2;
  late List<Chart_Data> _chart_Data3;
  late List<Chart_Data2> _chart_Data4;

  late List<Graph_Data> _graph_Data1;
  late List<Graph_Data> _graph_Data2;
  late TooltipBehavior _toolTipBehavior;

  // index가 0인 페이지 먼저 보여줌
  final PageController pageController = PageController(
    initialPage: 0,
  );

  void initState() {
    _chart_Data = getChartData();
    _chart_Data2 = getChartData2();
    _chart_Data3 = getChartData3();
    _chart_Data4 = getChartData4();
    _graph_Data1 = getGraphData();
    _graph_Data2 = getGraphData2();
    _toolTipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }



  List<Chart_Data>  getChartData(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('24~01', 1, Color.fromRGBO(225,198,198,1)),
      Chart_Data('01~02', 1, Color.fromRGBO(225,198,198,1)),
      Chart_Data('02~03', 1, Color.fromRGBO(225,180,180,1)),
      Chart_Data('03~04', 1, Color.fromRGBO(225,180,180,1)),
      Chart_Data('04~05', 1, Color.fromRGBO(225,162,162,1)),
      Chart_Data('05~06', 1, Color.fromRGBO(225,162,162,1)),
      Chart_Data('06~07', 1, Color.fromRGBO(225,144,144,1)),
      Chart_Data('07~08', 1, Color.fromRGBO(225,144,144,1)),
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

  List<Chart_Data2>  getChartData2(){
    final List<Chart_Data2>  getChartData = [
      Chart_Data2(1, 1,1, Color.fromRGBO(225,198,198,1)),
      Chart_Data2(2, 2,1, Color.fromRGBO(226,226,226,1)),
      Chart_Data2(3, 3,1, Color.fromRGBO(226,226,226,1)),
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

  List<Chart_Data2>  getChartData4(){
    final List<Chart_Data2>  getChartData = [
      Chart_Data2(1, 1,1, Color.fromRGBO(225,198,198,1)),
      Chart_Data2(2, 2,1, Color.fromRGBO(226,226,226,1)),
      Chart_Data2(3, 3,1, Color.fromRGBO(226,226,226,1)),
    ];
    return getChartData;
  }

  List<Graph_Data> getGraphData(){
    final List<Graph_Data>  getGraphData = [
      Graph_Data( DateTime(2015, 01, 01), 1),
      Graph_Data( DateTime(2016, 01, 01), 12),
      Graph_Data( DateTime(2017, 01, 01), 13),
      Graph_Data( DateTime(2018, 01, 01), 10),
      Graph_Data( DateTime(2019, 01, 01), 21),
      Graph_Data( DateTime(2020, 01, 01), 15),
      Graph_Data( DateTime(2021, 01, 01), 19),
    ];
    return getGraphData;
  }

  List<Graph_Data>  getGraphData2(){
    final List<Graph_Data>  getGraphData2 = [
      Graph_Data( DateTime(2015, 01, 01), 1),
      Graph_Data( DateTime(2016, 01, 01), 12),
      Graph_Data( DateTime(2017, 01, 01), 13),
      Graph_Data( DateTime(2018, 01, 01), 10),
      Graph_Data( DateTime(2019, 01, 01), 21),
      Graph_Data( DateTime(2020, 01, 01), 15),
      Graph_Data( DateTime(2021, 01, 01), 19),
    ];
    return getGraphData2;
  }

  @override
  Widget build(BuildContext context) {
    Widget textSection1 = Column(
      children: [
        Text.rich(
          TextSpan(// default text style
              children: <TextSpan>[
                TextSpan(text: '최대전력 발생 시간은',
                  style:TextStyle(
                    fontSize:17.0,
                    color: Colors.black,
                    letterSpacing: 0.3,
                    fontFamily: 'applesdneob',
                  ),),
                TextSpan(text: '9시에서 10시',
                  style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),),
                TextSpan(text: ',\n최대전력은 ',
                  style:TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      fontFamily: 'applesdneob'),),
                TextSpan(text: ' 71,700MW',
                  style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 3.0,
                      fontFamily: 'applesdneob'),),
                TextSpan(text: '로 예상돼요',
                  style:TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      letterSpacing: 1.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),

              ]
          ),
        )
      ],
    );

    Widget textSection2 = Column(
      children: [
        Text.rich(
          TextSpan(// default text style
              children: <TextSpan>[
                TextSpan(text: '최대전력 발생 시간은',
                  style:TextStyle(
                    fontSize:17.0,
                    color: Colors.black,
                    letterSpacing: 0.3,
                    fontFamily: 'applesdneob',
                  ),),
                TextSpan(text: '9시에서 10시',
                  style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),),
                TextSpan(text: ',\n최대전력은 ',
                  style:TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      fontFamily: 'applesdneob'),),
                TextSpan(text: ' 71,700MW',
                  style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 3.0,
                      fontFamily: 'applesdneob'),),
                TextSpan(text: '로 예상돼요',
                  style:TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      letterSpacing: 1.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),
              ]
          ),
        )
      ],
    );
    Widget textSection3 =
                Text('월별 전력 사용량',
                  style:TextStyle(
                    fontSize:17.0,
                    color: Colors.black,
                    letterSpacing: 0.3,
                    fontFamily: 'applesdneob',
                  ),
                );

    Widget textSection4 = Text('시간대별별 전력 사용량',
     style:TextStyle(
        fontSize:17.0,
        color: Colors.black,
        letterSpacing: 0.3,
        fontFamily: 'applesdneob',
      ),
    );


    Widget chartSection1= Center(
        child:SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                      child: const Text('9시~10시',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
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
                // explode: true
              )
            ]
        )
    );

    Widget chartSection2 =Center(
        child:SfCartesianChart(
          tooltipBehavior: _toolTipBehavior,
          series: <ChartSeries>[
            StackedBar100Series<Chart_Data2,double>(
              dataSource: _chart_Data2,
              pointColorMapper:(Chart_Data2 data,  _) => data.color,
              xValueMapper: (Chart_Data2 data, _) => data.x,
              yValueMapper: (Chart_Data2 data, _) => data.y1,
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
          borderWidth: 50,
        )
    );

    Widget graphSection1 =Center(
        child:SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            series: <ChartSeries>[
              SplineSeries<Graph_Data, DateTime>(
                  dataSource: _graph_Data1,
                  // Type of spline
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 0.9,
                  xValueMapper: (Graph_Data sales, _) => sales.x,
                  yValueMapper: (Graph_Data sales, _) => sales.y
              )
            ]
        )
    );

    Widget graphSection2 =Center(
        child:SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            series: <ChartSeries>[
              SplineSeries<Graph_Data, DateTime>(
                  dataSource: _graph_Data1,
                  // Type of spline
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 0.9,
                  xValueMapper: (Graph_Data sales, _) => sales.x,
                  yValueMapper: (Graph_Data sales, _) => sales.y
              )
            ]
        )
    );

    Widget chartSection3= Container(
        height: 400,
        width: 450,
        child:SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                    child:Text(String.fromCharCode(0xe190),
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
                endAngle: 90, // Ending angle of doughnut
                //strokeWidth: 20,
                // explode: true
              )
            ]
            ,borderWidth:1
        )
    );

    Widget chartSection4 = SfCartesianChart(
      tooltipBehavior: _toolTipBehavior,
      series: <ChartSeries>[
        StackedBar100Series<Chart_Data2,double>(
          dataSource: _chart_Data4,
          pointColorMapper:(Chart_Data2 data,  _) => data.color,
          xValueMapper: (Chart_Data2 data, _) => data.x,
          yValueMapper: (Chart_Data2 data, _) => data.y1,
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
      borderWidth: 50,
      plotAreaBorderWidth: 0,
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
    Widget datatableSection2= Center(
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
                          child: Text('노동생산성',
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
                                  child:Text('2021',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontFamily: 'applesdneom'),)
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text('54',
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
                                  child: Text('2020',
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
                                  child:Text('75',
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
                                  child: Text('2019',
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
                                  child:Text('12',
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
              title: Text('시간별 전력 사용량',
                style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
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
                child:Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
                  child: PageView(
                      controller: pageController,
                      children:<Widget>[
                        ListView(
                          children: <Widget>[
                            textSection1,
                            SizedBox(
                              height: 30.0,
                            ),
                            chartSection1,
                            chartSection2,
                            SizedBox(
                              height: 40.0,
                            ),
                            textSection3,
                            graphSection1,
                          ],

                        ),
                        ListView(
                          children: <Widget>[
                            textSection2,
                            SizedBox(
                              height: 30.0,
                            ),
                            chartSection3,
                            chartSection4,
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

class Graph_Data {
  Graph_Data(this.x, this.y);
  final DateTime x;
  final double y;
}