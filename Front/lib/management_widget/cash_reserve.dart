import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class cash_reserve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _cash_reserve();
}

class _cash_reserve extends State<cash_reserve> {
  late List<ChartData> chartdata;

  PageController pageController = PageController(
    initialPage: 0,
  );

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
    final List<ChartData1> chartData = [
      ChartData1('현금', 25),
      ChartData1('현금성 자산', 38),
      ChartData1('단기 금융 상품', 34),
    ];

    Widget textSection =Padding(
        padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 20.sp, 100.sp),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text.rich(TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '2021년 ',
                    style: TextStyle(
                        fontSize:  65.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black)),
                TextSpan(
                  text: '현금 보유액 ',
                  style: TextStyle(
                      fontSize: 90.sp,
                      color: Colors.blue,
                      fontFamily: 'applesdneoeb',
                      letterSpacing: 2.0),
                ),
                TextSpan(
                    text: '은\n',
                    style: TextStyle(
                      fontSize:  65.sp,
                      letterSpacing: 2.0,
                      fontFamily: 'applesdneoeb',
                      color: Colors.black,
                    )
                ),
                TextSpan(
                  text: '230,340,890원 ',
                  style: TextStyle(
                      fontSize: 90.sp,
                      color: Colors.blue,
                      letterSpacing: 2.0,
                      fontFamily: 'applesdneoeb'),
                ),
                TextSpan(
                    text: '이에요\n',
                    style: TextStyle(
                        fontSize: 65.sp,
                        letterSpacing: 2.0,
                        color: Colors.black,
                        fontFamily: 'applesdneoeb')),
                TextSpan(
                    text: '전년 대비 ',
                    style: TextStyle(
                      fontSize: 65.sp,
                      letterSpacing: 2.0,
                      fontFamily: 'applesdneoeb',
                      color: Colors.black,
                    )),
                TextSpan(
                  text: '33% 상승 ',
                  style: TextStyle(
                      fontSize: 90.sp,
                      color: Colors.blue,
                      fontFamily: 'applesdneoeb',
                      letterSpacing: 2.0),
                ),
                TextSpan(
                    text: '했어요\n',
                    style: TextStyle(
                      fontSize: 65.sp,
                      letterSpacing: 2.0,
                      color: Colors.black,
                      fontFamily: 'applesdneoeb',
                    )),
              ]))
        ]));

    Widget textSection3 =Padding(
        padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 20.sp, 100.sp),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text.rich(
              TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '2021년 ',
                        style: TextStyle(
                            fontSize: 65.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black)),
                    TextSpan(
                      text: '현금 보유액 ',
                      style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                          fontFamily: 'applesdneoeb',
                          letterSpacing: 2.0),
                    ),
                    TextSpan(
                        text: '은\n',
                        style: TextStyle(
                          fontSize: 65.sp,
                          letterSpacing: 2.0,
                          fontFamily: 'applesdneoeb',
                          color: Colors.black,
                        )
                    ),
                    TextSpan(
                      text: '18% ',
                      style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                          fontFamily: 'applesdneoeb',
                          letterSpacing: 2.0),),
                    TextSpan(
                        text: '에 달해요',
                        style: TextStyle(
                          fontSize: 65.sp,
                          letterSpacing: 2.0,
                          fontFamily: 'applesdneoeb',
                          color: Colors.black,
                        )),
                  ]))
        ])
    );

    Widget chartSection = Center(
      child: Container(
          width: 1000.w,
          height: 300,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  numberFormat: NumberFormat.compact()
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
                  spacing: 0.2,
                ),
              ])),
    );

    Widget chartSection1 = Center(
        child: Container(
            width: 1000.w,
            height: 400,
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
                  // Renders doughnut chart
                  DoughnutSeries<ChartData1, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData1 data, _) => data.x,
                      yValueMapper: (ChartData1 data, _) => data.y,
                      dataLabelSettings: DataLabelSettings(
                        // Renders the data label
                          isVisible: true),
                      radius: '95%'
                  )
                ])));

    Widget datatableSection =Padding(
        padding:  EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
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
                      alignment: Alignment.center,
                      child: Text('연도',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 45.sp,
                              fontFamily: 'applesdneoeb')),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .7,
                      alignment: Alignment.center,
                      child: Text('금액',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.sp,
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
                          width: 1020.w ,
                          alignment: Alignment.center,
                          child: Text(
                            '최근 3 년',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 45.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          )))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          width: 1020.w * .3,
                          alignment: Alignment.center,
                          child: Text(
                            '2019',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            width: 1020.w * .7,
                            alignment: Alignment.center,
                            child: Text(
                              '253,654,978원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
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
                          width: 1020.w * .3,
                          alignment: Alignment.center,
                          child: Text(
                            '2020',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            width: 1020.w * .7,
                            alignment: Alignment.center,
                            child: Text(
                              '323,456,789원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
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
                          width: 1020.w * .3,
                          alignment: Alignment.center,
                          child: Text(
                            '2021',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            width: 1020.w * .7,
                            alignment: Alignment.center,
                            child: Text(
                              '450,340,890원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
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
        ));

    Widget datatableSection1 = Padding(
        padding:  EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
        child:Center(
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
                      alignment: Alignment.center,
                      child: Text(
                        '종류',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 45.sp,
                            fontFamily: 'applesdneoeb'),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .7,
                      alignment: Alignment.center,
                      child: Text('금액',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 45.sp,
                              fontFamily: 'applesdneoeb')),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('')),
                      DataCell(Container(
                        width: 1020.w *.6,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '최근 1개월',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 45.sp,
                                fontWeight: FontWeight.bold,
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
                            '현금',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '253,654,978원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
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
                          alignment: Alignment.center,
                          child: Text(
                            '현금성 자산',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '323,456,789원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
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
                          alignment: Alignment.center,
                          child: Text(
                            '단기 금융 상품',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '450,340,890원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
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
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '현금 보유액',
          style: TextStyle(
              fontSize: 67.sp, color: Colors.white),
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
                        textSection3,
                        chartSection1,
                        datatableSection1,
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

  final double x;
  final double y;
}

class ChartData1 {
  ChartData1(this.x, this.y);

  final String x;
  final double y;
}
