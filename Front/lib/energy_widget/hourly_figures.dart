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
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _chart_Data = getChartData();
    _chart_Data2 = getChartData2();
    _toolTipBehavior = TooltipBehavior();
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

  @override
  Widget build(BuildContext context) {

    Widget textSection = Padding(
        padding: EdgeInsets.all(20),
        child: Column(
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
        )
    );

    Widget chartSection= Center(
        child: Container(
          child: Column(
            children:[
              SfCircularChart(
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
              ]),
              Center(
                  child:
                  SfCartesianChart(
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
                  )
              ),
              SizedBox(width: 60,),

            ]
        )
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
          title: Text('시간별 전력 사용량',
            style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
          leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
            Energy_Screen();
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

class Chart_Data2{
  Chart_Data2(this.x,this.y1,this.y2,this.color);
  final double x;
  final double y1;
  final double y2;
  final Color color;

}