import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flow_project/tabbar/management.dart';
import 'package:intl/intl.dart';



class labor_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_ratio();
}

class _labor_ratio extends State<labor_ratio> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      activationMode: ActivationMode.longPress,
    );
    super.initState();
  }

  final List<ChartData> chartData = [
    ChartData('간접인건비', 202031684),
    ChartData('직접인건비', 275146845),
  ];

  @override
  Widget build(BuildContext context) {
    Widget textSection = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(text: '', children: <TextSpan>[
                TextSpan(
                  text: '2021년 10월은 ',
                  style: TextStyle(
                      fontSize: 25.0, letterSpacing: 2.0, fontFamily: 'AppleB'),
                ),
              ]))
            ]));

    Widget textSection1 = Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(
                text: '간접 인건비가 ',
                style: TextStyle(
                    fontSize: 25.0, letterSpacing: 2.0, fontFamily: 'AppleB'),
                children: <TextSpan>[
                  TextSpan(
                    text: '12% ',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                      text: '높아요. ',
                      style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                          color: Colors.black)),
                ]))
          ],
        ));

    Widget chartSection = Center(
        child: Container(
            width: 500.0,
            height: 500.0,
            child: SfCircularChart(
                palette: <Color>[
                  Colors.indigo,
                  Colors.lightBlueAccent,
                ],
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

    Widget chartSection2 = Center(
      child: Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: _tooltipBehavior,
            legend: Legend(
                isVisible: true,
                // Legend will be placed at the left
                position: LegendPosition.bottom),
            series: <CartesianSeries>[
              LineSeries<laborData, String>(
                name: '직접인건비',
                  dataSource: [
                    // Bind data source
                    laborData('2018년', 2.6),
                    laborData('2019년', 2.0),
                    laborData('2020년', 1.8),
                    laborData('2021년', 2.5),
                  ],
                  xValueMapper: (laborData sales, _) => sales.month,
                  yValueMapper: (laborData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(
                      // Renders the data label
                      isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              LineSeries<laborData, String>(
                name: '간접인건비',
                  dataSource: [
                    // Bind data source
                    laborData('2018년', 2.2),
                    laborData('2019년', 2.9),
                    laborData('2020년', 2.0),
                    laborData('2021년', 3.2),
                  ],
                  xValueMapper: (laborData sales, _) => sales.month,
                  yValueMapper: (laborData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(
                      // Renders the data label
                      isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true))
            ]),
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
                  child: Text('인건비 내역',
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
                        '####.##.##',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                          '???',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0),
                        )),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                          '#,##,###원',
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
        title: Text('인건 비율', style: TextStyle(fontSize: 25.0)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107, 1),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              management_main();
            }),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
        child: ListView(
          children: <Widget>[
            textSection,
            textSection1,
            SizedBox(
              height: 30.0,
            ),
            chartSection,
            SizedBox(
              height: 30.0,
            ),
            chartSection2,
            SizedBox(
              height: 30.0,
            ),
            datatableSection,
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

class laborData {
  laborData(this.month, this.sales);

  final String? month;
  final double sales;
}
