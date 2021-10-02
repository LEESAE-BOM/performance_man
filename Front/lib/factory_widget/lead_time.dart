import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../tabbar/factory.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class lead_time extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _lead_time();
}

class _lead_time extends State<lead_time> {
  late List<lead_data> _chartData;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _chartData = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<lead_data> getChartData(){
    final List<lead_data> chartData = [
      lead_data(5, 51)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
          'Lead-time은'
              '총 9일 소요되었습니다.'
        '예정일까지 3일 남았어요.',
        softWrap: true,
        style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),
        textAlign: TextAlign.center,
      ),
    );

    Widget daySection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '9 Days',
        softWrap: true,
        style: TextStyle(fontSize: 35, fontFamily: 'applesdneom'),
        textAlign: TextAlign.center,
      ),
    );
    Widget chartSection= Center(
        child: Container(
          child: SfCartesianChart(
            tooltipBehavior: _toolTipBehavior,
            series: <ChartSeries>[
              BarSeries<lead_data,double>(dataSource: _chartData,
                xValueMapper: (dataset, _) =>dataset.year,
                yValueMapper: (dataset, _) =>dataset.labor,
                //dataLabelSettings: DataLabelSettings(isVisible: true),
                //enableTooltip: true,
                color: Colors.blueAccent,
              ),
            ],
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



    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('노동 생산율',
            style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
          leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
            factory_main();
          }),
        ),
        body: SafeArea(
         //child: Padding(padding: const EdgeInsets.all(36.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textSection,
                daySection,
                chartSection,
                datatableSection
            ],

            )
         // )
        ),
      ),
    );
  }
}

class lead_data{
  lead_data(this.year,this.labor);
  final double year;
  final double labor;
}