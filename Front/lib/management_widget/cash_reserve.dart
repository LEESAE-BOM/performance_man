import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class cash_reserve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _cash_reserve();
}

class _cash_reserve extends State<cash_reserve> {
  late List<ChartData> chartdata;

  void initState() {
    chartdata = getChartData();
    super.initState();
  }

  List<ChartData> getChartData() {
    final List<ChartData> chartdata = [
      ChartData(2019, 253654978),
      ChartData(2020, 323456789),
      ChartData(2021, 450340890)
    ];
    return chartdata;
  }

  @override
  Widget build(BuildContext context) {
    Widget textSection = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(
                  text: '2021년 ',
                  style: TextStyle(
                      fontSize: 25.0, letterSpacing: 2.0, fontFamily: 'AppleB'),
                  children: <TextSpan>[
                    TextSpan(
                      text: '현금 보유액 ',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                    TextSpan(
                        text: '은',
                        style: TextStyle(fontSize: 25.0, letterSpacing: 2.0)),
                  ]))
            ]));

    Widget textSection1 = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(text: '', children: <TextSpan>[
              TextSpan(
                text: '230,340,890원 ',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AppleB'),
              ),
              TextSpan(
                  text: '이에요.',
                  style: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                      color: Colors.black,
                      fontFamily: 'AppleB')),
            ]))
          ],
        ));

    Widget textSection2 = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(
                text: '전년 대비 ',
                style: TextStyle(
                    fontSize: 25.0, letterSpacing: 2.0, fontFamily: 'AppleB'),
                children: <TextSpan>[
                  TextSpan(
                    text: '33% 상승 ',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                  TextSpan(
                      text: '했어요.',
                      style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                      )),
                ]))
          ],
        ));

    Widget chartSection = Center(
      child: Container(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
              ),
              series: <ChartSeries>[
            BarSeries<ChartData, double>(
                dataSource: chartdata,
                xValueMapper: (ChartData sales, _) => sales.x,
                yValueMapper: (ChartData sales, _) => sales.y,
                dataLabelSettings: DataLabelSettings(
                    // Renders the data label
                    isVisible: true),
                width: 0.6,
                spacing: 0.2),
          ])),
    );

    Widget datatableSection = Center(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.grey),
            child: DataTable(
              showBottomBorder: true,
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.black12),
              columns: <DataColumn>[
                DataColumn(
                  label: Container(
                    width: 150.0,
                    child: Text(
                      '연도',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          color: Colors.black),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: 300.0,
                    child: Text('금액',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23.0)),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('')),
                    DataCell(Container(
                        width: 300.0,
                        child: Text(
                          '최근 1개월',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        )))
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Container(
                        child: Text(
                          '2019',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        width: 150.0,
                      ),
                    ),
                    DataCell(
                      Container(
                          width: 300.0,
                          child: Text(
                            '45,600원',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          )),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Container(
                        child: Text(
                          '2020',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        width: 150.0,
                      ),
                    ),
                    DataCell(
                      Container(
                          width: 300.0,
                          child: Text(
                            '41,500원',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          )),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Container(
                        child: Text(
                          '2021',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        width: 150.0,
                      ),
                    ),
                    DataCell(
                      Container(
                          width: 300.0,
                          child: Text(
                            '62,300원',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('현금 보유액',style: TextStyle(fontSize: 25.0),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107, 1),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
        child: ListView(
          children: <Widget>[
            textSection,
            textSection1,
            textSection2,
            SizedBox(
              height: 15.0,
            ),
            chartSection,
            SizedBox(
              height: 30.0,
            ),
            datatableSection
          ],
        ),
      )),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}
