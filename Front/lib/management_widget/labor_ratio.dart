import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '.././screens/management/management_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class labor_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_ratio();
}

class _labor_ratio extends State<labor_ratio> {
  late TooltipBehavior _tooltipBehavior;

  PageController pageController = PageController(
    initialPage: 0,
  );

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
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '2021년 10월은\n',
                        style: TextStyle(
                          fontSize: 70.sp,
                          letterSpacing: 2.0,
                          fontFamily: 'applesdneoeb',
                          color: Colors.black,
                        )
                    ),
                    TextSpan(
                        text: '간접인건비가 ',
                        style: TextStyle(
                          fontSize: 70.sp,
                          letterSpacing: 2.0,
                          fontFamily: 'applesdneoeb',
                          color: Colors.black,
                        )),
                    TextSpan(
                      text: '12% ',
                      style: TextStyle(
                        fontSize: 100.sp,
                        color: Colors.blue,
                        letterSpacing: 3.0,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(
                        text: '높아요. ',
                        style: TextStyle(
                          fontSize: 70.sp,
                          letterSpacing: 2.0,
                          fontFamily: 'applesdneoeb',
                          color: Colors.black,
                        )
                    ),
                  ]))
            ]));

    Widget textSection2 = Padding(
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '간접인건비율은\n',
                      style: TextStyle(
                        fontSize: 70.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      )
                  ),
                  TextSpan(
                      text: '점차 ',
                      style: TextStyle(
                        fontSize: 70.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      )),
                  TextSpan(
                    text: '상승 ',
                    style: TextStyle(
                      fontSize: 90.sp,
                      color: Colors.blue,
                      letterSpacing: 2.0,
                      fontFamily: 'applesdneoeb',
                    ),
                  ),
                  TextSpan(
                      text: '하고 있어요. ',
                      style: TextStyle(
                        fontSize: 70.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      )),

                ]))
          ],
        ));

    Widget chartSection = Center(
        child: Container(
            width: 1000.w,
            height: 300,
            child: SfCircularChart(
                palette: <Color>[
                  Colors.indigo,
                  Colors.lightBlueAccent,
                ],
                title: ChartTitle(
                    text: '2021',
                    textStyle:
                    TextStyle(fontSize: 100.sp, fontWeight: FontWeight.bold)),
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
                          labelPosition: ChartDataLabelPosition.outside),
                      radius: '100%'

                  ),
                ])));

    Widget chartSection1 = Center(
      child: Container(
        width: 1000.w,
        height: 300,
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

    Widget datatableSection =Padding(
        padding: EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
        child: Center(
          child: Container(
            width: 1020.w,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.grey),
              child: DataTable(
                columnSpacing:  0,
                horizontalMargin: 0,
                showBottomBorder: true,
                headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.black12),
                columns: <DataColumn>[
                  DataColumn(
                    label: Container(
                      width: 1020.w * .3,
                      child: Text(
                        '',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .3,
                      alignment: Alignment.center,
                      child: Text('인건비 내역',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.sp,
                              color: Colors.black54,
                              fontFamily: 'applesdneoeb')),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .4,
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
                          alignment: Alignment.center,
                          child: Text(
                            '최근 1개월',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 41.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          )))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '####.##.##',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 41.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '???',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 41.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '#,##,###원',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 41.sp,
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
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('인건 비율',
            style: TextStyle(fontSize:67.sp, color: Colors.white)),
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
        child:Center(
          child: PageView(
            controller: pageController,
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        textSection,
                        chartSection,
                        datatableSection,
                      ],
                    ),
                  ),
                ],
              ),
              ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        textSection2,
                        chartSection1,
                        datatableSection,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
