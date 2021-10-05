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
  late List<monthly_data> _monthly_data2;
  late List<monthly_data> _monthly_data3;
  late List<monthly_data> _monthly_data4;

  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _monthly_data = get_data();
    _monthly_data2 = get_data2();
    _monthly_data3 = get_data3();
    _monthly_data4 = get_data4();

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
  List<monthly_data> get_data2(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 531),
      monthly_data('6월',214, 12),
      monthly_data('7월',124, 02),
      monthly_data('8월',224, 259),
      monthly_data('9월',244, 540)
    ];
    return chartData;
  }
  List<monthly_data> get_data3(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 51),
      monthly_data('6월',324,  152),
      monthly_data('7월',12, 20),
      monthly_data('8월',424, 59),
      monthly_data('9월',24, 50)
    ];
    return chartData;
  }
  List<monthly_data> get_data4(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 192),
      monthly_data('6월',214,  152),
      monthly_data('7월',124, 202),
      monthly_data('8월',224, 259),
      monthly_data('9월',244, 500)
    ];
    return chartData;
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
                  TextSpan(text: '9월의 전력 사용량은',
                    style:TextStyle(
                      fontSize:17.0,
                      color: Colors.black,
                      letterSpacing: 0.3,
                      fontFamily: 'applesdneob',
                    ),),
                  TextSpan(text: '13,588 kWh\n',
                    style:TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '전월대비 ',
                    style:TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: ' 2000만큼 감소',
                    style:TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        letterSpacing: 3.0,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: ' 했어요',
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
          child: SfCartesianChart(
              legend: Legend(
                  isVisible: true,
                  // Legend will be placed at the left
                  position: LegendPosition.top)
              ,
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
                // Render column series
                ColumnSeries<monthly_data, String>(
                  name:'전 년도 전력사용량',
                    dataSource: _monthly_data,
                    xValueMapper: (monthly_data data, _) => data.x,
                    yValueMapper: (monthly_data data, _) => data.y
                ),
                ColumnSeries<monthly_data, String>(
                    name:'현 년도 전력사용량',
                    dataSource: _monthly_data2,
                    xValueMapper: (monthly_data data, _) => data.x,
                    yValueMapper: (monthly_data data, _) => data.y
                ),
                // Render line series
                LineSeries<monthly_data, String>(
                    name:'전 년도 최대전력',
                    dataSource: _monthly_data3,
                    xValueMapper: (monthly_data data, _) => data.x,
                    yValueMapper: (monthly_data data, _) => data.y1
                ),
                LineSeries<monthly_data, String>(
                    name:'현 년도 최대전력',
                    dataSource: _monthly_data4,
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
          title: Text('월별 전력 사용량',
            style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
          leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
            Navigator.of(context).pop();
          }),
        ),
        body: Center(
          child: ListView(
            children: [
              SizedBox(height:35),
              textSection,
              SizedBox(height:35),
              chartSection,
              SizedBox(height:35),
              datatableSection,
              SizedBox(height:15)
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