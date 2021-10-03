import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class contracted_price extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _contracted_price();
}

class _contracted_price extends State<contracted_price> {
  List<ChartData> chartData = <ChartData>[
    ChartData('5월', 2093000, 74185000, 78645000),
    ChartData('6월', 34436000, 12349000, 48612000),
    ChartData('7월', 4356000, 74501000, 45671000),
    ChartData('8월', 24636000, 14714000, 58258000),
    ChartData('9월', 54636000, 69312000, 65432000),
  ];

  @override
  Widget build(BuildContext context) {
    Widget textSection = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(
                  text: '이번 달 ',
                  style: TextStyle(
                      fontSize: 25.0, letterSpacing: 2.0, fontFamily: 'AppleB'),
                  children: <TextSpan>[
                    TextSpan(
                      text: '계약 금액',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                    TextSpan(
                        text: '은',
                        style: TextStyle(fontSize: 25.0, letterSpacing: 2.0)),
                  ])),
            ]));

    Widget textSection1 = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(text: '', children: <TextSpan>[
              TextSpan(
                text: '321,654,987원 ',
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
                text: '전월 대비 ',
                style: TextStyle(
                    fontSize: 25.0, letterSpacing: 2.0, fontFamily: 'AppleB'),
                children: <TextSpan>[
                  TextSpan(
                    text: '1,000원 증가 ',
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
          palette: <Color>[
            Colors.blueAccent,
            Colors.lightBlueAccent,
            Colors.teal,
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
          ),
          legend: Legend(
              isVisible: true,
              // Legend will be placed at the left
              position: LegendPosition.bottom),
          series: <ColumnSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              name: '2019년',
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y,
            ),
            ColumnSeries<ChartData, String>(
              name: '2020년',
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y1,
            ),
            ColumnSeries<ChartData, String>(
              name: '2021년',
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y2,
            ),
          ],
        ),
      ),
    );

    Widget datatableSection = Center(
      child: Container(
        width: double.infinity,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.grey),
          child: DataTable(
            showBottomBorder: true,
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.black12),
            columns: <DataColumn>[
              DataColumn(
                label: Container(
                  child: Text(
                    '',
                  ),
                ),
              ),
              DataColumn(
                label: Container(
                  alignment: Alignment.center,
                  child: Text('매출 금액 내역',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                ),
              ),
              DataColumn(
                label: Container(
                  child: Text(
                    '',
                  ),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Container(
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
                        '기업',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                          '계약 금액',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0),
                        )),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                          '수주 잔고 금액',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0),
                        )),
                  ),
                ],
              ),
              DataRow(
                color: MaterialStateColor.resolveWith(
                    (states) => Colors.black12),
                cells: <DataCell>[
                  DataCell(
                    Container(
                      child: Text(
                        'A기업',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                          '4,123,123원',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0),
                        )),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                          '456,789원',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('계약 금액', style: TextStyle(fontSize: 25.0)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107, 1),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
        child: ListView(
          children: <Widget>[
            textSection,
            textSection1,
            textSection2,
            SizedBox(
              height: 30.0,
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
  ChartData(this.x, this.y, this.y1, this.y2);

  final String? x;
  final int y;
  final int y1;
  final int y2;
}
