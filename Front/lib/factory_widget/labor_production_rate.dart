import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/factory/factory_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class labor_production_rate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_production_rate();
}

class _labor_production_rate extends State<labor_production_rate> {

  late List<Chart_Data> _chartData;
  late TooltipBehavior _toolTipBehavior;
  // index가 0인 페이지 먼저 보여줌
  final PageController pageController = PageController(
    initialPage: 0,
  );
  void initState() {
    _chartData = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data> getChartData(){
    final List<Chart_Data> chartData = [
      Chart_Data(5, 51),
      Chart_Data(6, 152),
      Chart_Data(7, 202),
      Chart_Data(8, 259),
      Chart_Data(9, 500)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {

    Widget textSection1 =
    Column(
        children: [Text.rich(
            TextSpan(// default text style
              children: <TextSpan>[
                TextSpan(text: '2021년 9월의\n',
                  style:TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    letterSpacing: 5.0,
                    fontFamily: 'applesdneob',
                  ),
                ),
                TextSpan(text: '노동생산율 ',
                  style:TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue,
                    letterSpacing: 5.0, //fontWeight: FontWeight.bold,
                    fontFamily: 'applesdneob',),
                ),
                TextSpan(text: '은 ',
                  style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(text: '74',
                  style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(text: '이에요\n',
                  style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(text: '전월대비',
                  style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(text: '13 증가',
                  style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(text: '했어요',
                  style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob'),
                ),
              ],
            )
        ),
        ]

    );



    Widget textSection2 =
    Column(
        children: [
          Text.rich(
              TextSpan(// default text style
                children: <TextSpan>[
                  TextSpan(text: '2021년 9월의\n',
                    style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      fontFamily: 'applesdneob',
                    ),
                  ),
                  TextSpan(text: '노동생산율 ',
                    style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 5.0, //fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob',),
                  ),
                  TextSpan(text: '은 ',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),
                  ),
                  TextSpan(text: '74',
                    style:TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),
                  ),
                  TextSpan(text: '이에요\n',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),
                  ),
                  TextSpan(text: '전년대비 ',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),
                  ),
                  TextSpan(text: '2 증가',
                    style:TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),
                  ),
                  TextSpan(text: '했어요',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),
                  ),
                ],
              )
          ),
        ]

    );
    Widget chartSection1=
    Center(
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
            //edgeLabelPlacement: EdgeLabelPlacement.shift,
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
              labelFormat: '{value}월',
              isVisible: false
          ),
          primaryYAxis: NumericAxis(
              isVisible: false
            // edgeLabelPlacement: EdgeLabelPlacement.shift
          ), //  borderWidth: 0.4,
        )
    );

    Widget chartSection2= Center(
        child:SfCartesianChart(
          tooltipBehavior: _toolTipBehavior,
          series: <ChartSeries>[
            BarSeries<Chart_Data,double>(dataSource: _chartData,
              xValueMapper: (Chart_Data labors, _) =>labors.year,
              yValueMapper: (Chart_Data labors, _) =>labors.labor,
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



    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('노동 생산율',
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
                            SizedBox(
                              height: 40.0,
                            ),
                            datatableSection1
                          ]
                      ),
                      ListView(
                          children: <Widget>[
                            textSection2,
                            SizedBox(
                              height: 30.0,
                            ),
                            chartSection2,
                            SizedBox(
                              height: 40.0,
                            ),
                            datatableSection2
                          ]
                      )
                    ]
                ),
              ),
            )
        )
    );

  }
}

class Chart_Data{
  Chart_Data(this.year,this.labor);
  final double year;
  final double labor;
}