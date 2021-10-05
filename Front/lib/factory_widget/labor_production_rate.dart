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

  late List<labor_data> _chartData;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _chartData = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<labor_data> getChartData(){
    final List<labor_data> chartData = [
      labor_data(5, 51),
      labor_data(6, 152),
      labor_data(7, 202),
      labor_data(8, 259),
      labor_data(9, 500)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {

    Widget textSection =
       SingleChildScrollView(
            scrollDirection: Axis.horizontal,
           child: Row(
            children:[
              Padding(
                  padding: EdgeInsets.all(40), child: Column(
                  children: [Text.rich(
                      TextSpan(// default text style
                children: <TextSpan>[
                  TextSpan(text: '2021년 9월의\n',
                    style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      letterSpacing: 5.0,
                      fontFamily: 'applesdneob',
                    ),),
                  TextSpan(text: '노동생산율 ',
                    style:TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 5.0, //fontWeight: FontWeight.bold,
                      fontFamily: 'applesdneob',),),
                  TextSpan(text: '은 ',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '74',
                    style:TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '이에요\n',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '전월대비',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '13 증가',
                    style:TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '했어요',
                    style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                ],)
                  ),
                  ]
              )
              ),
              Padding(
                  padding: EdgeInsets.all(40),
                  child:Column(
                  children: [Text.rich(
                      TextSpan(// default text style
                        children: <TextSpan>[
                          TextSpan(text: '2021년 9월의\n',
                            style:TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              letterSpacing: 5.0,
                              fontFamily: 'applesdneob',
                            ),),
                          TextSpan(text: '노동생산율 ',
                            style:TextStyle(
                              fontSize: 30.0,
                              color: Colors.blue,
                              letterSpacing: 5.0, //fontWeight: FontWeight.bold,
                              fontFamily: 'applesdneob',),),
                          TextSpan(text: '은 ',
                            style:TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                letterSpacing: 5.0,
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'applesdneob'),),
                          TextSpan(text: '74',
                            style:TextStyle(
                                fontSize: 30.0,
                                color: Colors.blue,
                                letterSpacing: 5.0,
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'applesdneob'),),
                          TextSpan(text: '이에요\n',
                            style:TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                letterSpacing: 5.0,
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'applesdneob'),),
                          TextSpan(text: '전년대비 ',
                            style:TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                letterSpacing: 5.0,
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'applesdneob'),),
                          TextSpan(text: '2 증가',
                            style:TextStyle(
                                fontSize: 30.0,
                                color: Colors.blue,
                                letterSpacing: 5.0,
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'applesdneob'),),
                          TextSpan(text: '했어요',
                            style:TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                letterSpacing: 5.0,
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'applesdneob'),),
                        ],)
                  ),
                  ]
                  )
              )

            ],
            )
    );

    Widget chartSection=
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            SizedBox(width: 60,),
            Center(
                child:SfCartesianChart(
              //tooltipBehavior: _toolTipBehavior,
              series: <ChartSeries>[
                AreaSeries<labor_data,double>(dataSource: _chartData,
                  xValueMapper: (labor_data labors, _) =>labors.year,
                  yValueMapper: (labor_data labors, _) =>labors.labor,
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
              ),
            //  borderWidth: 0.4,
            )
            ),
            SizedBox(width: 60,),
            Center(
                child:SfCartesianChart(
              tooltipBehavior: _toolTipBehavior,
              series: <ChartSeries>[
                BarSeries<labor_data,double>(dataSource: _chartData,
                  xValueMapper: (labor_data labors, _) =>labors.year,
                  yValueMapper: (labor_data labors, _) =>labors.labor,
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
            SizedBox(width: 60,),
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



    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
         title: Text('노동 생산율',
           style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
           centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
            leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,),
                onPressed: (){
                  Navigator.of(context).pop();
            }),
        ),
        body: SafeArea(
           child:ListView(
             children: [
               textSection,
                  chartSection,
               SizedBox(height: 60,),
                 datatableSection,
             ],
           ),
      ),
      ),
    );

  }
}

class labor_data{
  labor_data(this.year,this.labor);
  final double year;
  final double labor;
}