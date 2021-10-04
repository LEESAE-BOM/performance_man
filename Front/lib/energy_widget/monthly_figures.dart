import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/energy/energy_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class monthly_figures extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _monthly_figures();
}

class _monthly_figures extends State<monthly_figures> {
  late List<monthly_data> _monthly_data;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _monthly_data = get_data();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<monthly_data> get_data(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 51),
      monthly_data('6월',214,  152),
      monthly_data('7월',124, 202),
      monthly_data('8월',224, 259),
      monthly_data('9월',244, 500)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '9월의 전력 사용량은 13,488kWh'
            '전월 대비 2,000만큼 감소 했어요.',
        softWrap: true,
        style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),
        textAlign: TextAlign.center,
      ),
    );
    Widget chartSection= Center(
        child: Container(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
                // Render column series
                ColumnSeries<monthly_data, String>(
                    dataSource: _monthly_data,
                    xValueMapper: (monthly_data data, _) => data.x,
                    yValueMapper: (monthly_data data, _) => data.y
                ),
                // Render line series
                LineSeries<monthly_data, String>(
                    dataSource: _monthly_data,
                    xValueMapper: (monthly_data data, _) => data.x,
                    yValueMapper: (monthly_data data, _) => data.y1
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
              datatableSection
            ],
          ),
        ),
      ),
    );

  }
}

class monthly_data {
  monthly_data(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double? y1;
}