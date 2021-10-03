import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class expected_profit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _expected_profit();
}

class _expected_profit extends State<expected_profit> {
  late List<SalesData> chartdata;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    chartdata = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      activationMode: ActivationMode.longPress,
    );
    super.initState();
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartdata = [
      SalesData('1월', 3.5),
      SalesData('2월', 2.8),
      SalesData('3월', 3.4),
      SalesData('4월', 3.2),
      SalesData('5월', 4.0),
      SalesData('6월', 4.4),
      SalesData('7월', 3.8),
      SalesData('8월', 4.9),
      SalesData('9월', 5.2),
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
                      text: '예상 수익',
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
                text: '303,650,990원 ',
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
                    text: '14% ',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                  TextSpan(
                      text: '하락했어요.',
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
            tooltipBehavior: _tooltipBehavior,
            legend: Legend(
                isVisible: true,
                // Legend will be placed at the left
                position: LegendPosition.bottom),
            series: <CartesianSeries>[
              FastLineSeries<SalesData, String>(
                dataSource: chartdata,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
              FastLineSeries<SalesData, String>(
                  dataSource: [
                    // Bind data source
                    SalesData('1월', 2.6),
                    SalesData('2월', 2.0),
                    SalesData('3월', 1.8),
                    SalesData('4월', 2.5),
                    SalesData('5월', 1.6),
                    SalesData('6월', 2.3),
                    SalesData('7월', 2.0),
                    SalesData('8월', 2.4),
                    SalesData('9월', 1.9)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales),
              FastLineSeries<SalesData, String>(
                  dataSource: [
                    // Bind data source
                    SalesData('1월', 2.0),
                    SalesData('2월' ,2.8),
                    SalesData('3월', 3.6),
                    SalesData('4월', 3.0),
                    SalesData('5월', 4.5),
                    SalesData('6월', 4.0),
                    SalesData('7월', 4.2),
                    SalesData('8월', 3.8),
                    SalesData('8월', 3.9)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales),
            ]),
      ),
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
                      '종류',
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
                          '현금',
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
                            '',
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
                          '현금성 자산',
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
                            '',
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
                          '단기 금융 상품',
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
                            '',
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
          title: Text('예상 수익'),
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
        )));
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String? month;
  final double sales;
}
