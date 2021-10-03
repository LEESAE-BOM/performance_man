import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class outsourcing_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _outsourcing_ratio();
}

class _outsourcing_ratio extends State<outsourcing_ratio> {
  final List<ChartData> chartData = [
    ChartData('A사', 45),
    ChartData('B사', 55),
  ];

  @override
  Widget build(BuildContext context) {
    Widget textSection = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(
                  text: '전체 ',
                  style: TextStyle(
                      fontSize: 25.0, letterSpacing: 2.0, fontFamily: 'AppleB'),
                  children: <TextSpan>[
                    TextSpan(
                      text: '수주 비용 ',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                    TextSpan(
                        text: '중 ',
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
                text: '외주 비율',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AppleB'),
              ),
              TextSpan(
                  text: '이 차지하는 비율은 ',
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
            Text.rich(TextSpan(text: '', children: <TextSpan>[
              TextSpan(
                text: '약 45% ',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AppleB',
                    letterSpacing: 2.0),
              ),
              TextSpan(
                  text: '이에요.',
                  style: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                      fontFamily: 'AppleB')),
            ]))
          ],
        ));

    Widget chartSection = Center(
        child: Container(
            width: 500.0,
            height: 500.0,
            child: SfCircularChart(
                title: ChartTitle(
                    text: '2021',
                    textStyle:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
                legend: Legend(
                    isVisible: true,
                    // Legend will be placed at the left
                    position: LegendPosition.bottom),
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          // Positioning the data label
                          labelPosition: ChartDataLabelPosition.outside)),
                ])));

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
                    width: 100.0,
                    child: Text(
                      '',
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: 150.0,
                    alignment: Alignment.center,
                    child: Text('외주 내역',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23.0)),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: 100.0,
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
                        width: 150.0,
                        child: Text(
                          '최근 3개월',
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
                          '#,###,###',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        width: 100.0,
                      ),
                    ),
                    DataCell(
                      Container(
                          width: 150.0,
                          child: Text(
                            '##사',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.0),
                          )),
                    ),
                    DataCell(Text('')),
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
        title: Text(
          '외주 비율',
          style: TextStyle(fontSize: 25.0),
        ),
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
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
