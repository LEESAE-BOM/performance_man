import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../tabbar/factory.dart';
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

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
            '2021년 9월의 노동 생산성 74입니다 '
            '전월 대비 13 증가하였습니다.',
        softWrap: true,
        style: TextStyle(fontSize: 25, fontFamily: 'DoHyeonRegular'),
        textAlign: TextAlign.center,
      ),
    );

    Widget chartSection= Center(
        child: Container(
            child: SfCartesianChart(
              tooltipBehavior: _toolTipBehavior,
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
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                labelFormat: '{value}월'
              ),
              primaryYAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift
              ),
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
                  child: Text('월', style: TextStyle(fontSize: 15, fontFamily: 'DoHyeonRegular'),
                  ),

              ),
         // numeric: true,
        ),
        DataColumn(
            label:
            Align(
              alignment: Alignment.centerLeft,
              child: Text('지수', style: TextStyle(fontSize: 15, fontFamily: 'DoHyeonRegular'),
              ),
            )
        ),
        /*DataColumn(
          label: Center(
              widthFactor: 4.0,
              child: Text('지수', style: TextStyle(fontSize: 15, fontFamily: 'DoHyeonRegular'),)
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
           style: TextStyle(fontSize: 25, fontFamily: 'DoHyeonRegular'),),
           centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
            leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
              factory_main();
            }),
        ),
        body: SafeArea(
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

class labor_data{
  labor_data(this.year,this.labor);
  final double year;
  final double labor;
}