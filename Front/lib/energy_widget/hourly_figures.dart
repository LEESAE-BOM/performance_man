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
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _chart_Data = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }



  List<Chart_Data>  getChartData(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('David', 25, Color.fromRGBO(9,0,136,1)),
      Chart_Data('Steve', 38, Color.fromRGBO(147,0,119,1)),
      Chart_Data('Jack', 34, Color.fromRGBO(228,0,124,1)),
      Chart_Data('Others', 52, Color.fromRGBO(255,189,57,1))
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '최대 전력 발생 시간은 9시에서 10시'
            '최대 전력은 71,700MW 로 예상돼요' ,
        softWrap: true,
        style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),
        textAlign: TextAlign.center,
      ),
    );

    Widget chartSection= Center(
        child: Container(
          child: SfCircularChart(
              series: <CircularSeries>[
                // Renders doughnut chart
                DoughnutSeries<Chart_Data, String>(
                    dataSource: _chart_Data,
                    pointColorMapper:(Chart_Data data,  _) => data.color,
                    xValueMapper: (Chart_Data data, _) => data.x,
                    yValueMapper: (Chart_Data data, _) => data.y
                )
              ]
          ),
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
          title: Text('노동 생산율',
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