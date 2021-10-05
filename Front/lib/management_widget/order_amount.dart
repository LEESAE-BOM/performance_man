import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class order_amount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _order_amount();
}

class _order_amount extends State<order_amount> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('수금', 40000, '40%'),
      ChartData('미수금', 50000, '50%'),
      ChartData('채권', 10000, '10%'),
    ];
    Widget textSection = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(
                  text: '2021년 ',
                  style: TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 2.0,
                    fontFamily: 'applesdneoeb',
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '수주 금액',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '은',
                      style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      ),
                    ),
                  ]))
            ]));

    Widget textSection1 = Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(text: '', children: <TextSpan>[
            TextSpan(
              text: '45,650,890원 ',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '이에요.',
              style: TextStyle(
                fontSize: 25.0,
                letterSpacing: 2.0,
                fontFamily: 'applesdneoeb',
                color: Colors.black,
              ),
            ),
          ]))
        ],
      ),
    );

    Widget textSection2 = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(
                text: '전체 비율 중 ',
                style: TextStyle(
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                  fontFamily: 'applesdneoeb',
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '37% ',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '에 달해요.',
                    style: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                      fontFamily: 'applesdneoeb',
                      color: Colors.black,
                    ),
                  ),
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
                    textStyle: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    )),
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
                      dataLabelMapper: (ChartData data, _) => data.text,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      )),
                ])));

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
                    '종류',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black54,
                        fontFamily: 'applesdneoeb'),
                  ),
                ),
              ),
              DataColumn(
                label: Container(
                  child: Text('금액',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                          fontFamily: 'applesdneoeb')),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('')),
                  DataCell(Container(
                      child: Text(
                    '최근 1개월',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black54,
                        fontFamily: 'applesdneoeb'),
                  )))
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Container(
                      child: Text(
                        '수금 금액',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black54,
                            fontFamily: 'applesdneoeb'),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                      '40,000원',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                          fontFamily: 'applesdneoeb'),
                    )),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Container(
                      child: Text(
                        '미수금 금액',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black54,
                            fontFamily: 'applesdneoeb'),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                      '50,000원',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                          fontFamily: 'applesdneoeb'),
                    )),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Container(
                      child: Text(
                        '채권 금액',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black54,
                            fontFamily: 'applesdneoeb'),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                      '10,000원',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                          fontFamily: 'applesdneoeb'),
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
        title: Text(
          '수주 금액',
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107, 1),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
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
  ChartData(this.x, this.y, this.text);

  final String x;
  final double y;
  final String text;
}
