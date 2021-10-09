import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class expected_profit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _expected_profit();
}

class _expected_profit extends State<expected_profit> {
  late List<SalesData> chartdata;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;


  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      activationMode: ActivationMode.longPress,
    );
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming : true
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget textSection = Padding(
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                  TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '2021년 ',
                      style: TextStyle(
                        fontSize: 65.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      )),
                    TextSpan(
                      text: '예상 수익',
                      style: TextStyle(
                        fontSize: 90.sp,
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(
                      text: '은\n',
                      style: TextStyle(
                        fontSize: 65.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '303,650,990원 ',
                      style: TextStyle(
                        fontSize: 90.sp,
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(
                      text: '이에요.\n',
                      style: TextStyle(
                        fontSize: 65.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      ),
                    ),
                  TextSpan(
                      text: '전월 대비 ',
                      style: TextStyle(
                        fontSize: 65.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      )
                  ),
                    TextSpan(
                      text: '14% 하락',
                      style: TextStyle(
                        fontSize: 90.sp,
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                      ),
                    ),
                    TextSpan(
                        text: '했어요.',
                        style: TextStyle(
                          fontSize: 65.sp,
                          letterSpacing: 2.0,
                          color: Colors.black,
                          fontFamily: 'applesdneoeb',
                        )),
                  ]))
            ]));


    Widget chartSection = Center(
      child: Container(
        width: 1000.w,
        height: 300,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: _tooltipBehavior,
            zoomPanBehavior: _zoomPanBehavior,
            legend: Legend(
                isVisible: true,
                // Legend will be placed at the left
                position: LegendPosition.bottom),
            series: <CartesianSeries>[
              FastLineSeries<SalesData, String>(
                  name: '2019',
                  dataSource: [
                    SalesData('1월', 3.5),
                    SalesData('2월', 2.8),
                    SalesData('3월', 3.4),
                    SalesData('4월', 3.2),
                    SalesData('5월', 4.0),
                    SalesData('6월', 4.4),
                    SalesData('7월', 3.8),
                    SalesData('8월', 4.9),
                    SalesData('9월', 5.2),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(
                    // Renders the data label
                      isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<SalesData, String>(
                  name: '2020',
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
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(
                    // Renders the data label
                      isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<SalesData, String>(
                  name: '2021',
                  dataSource: [
                    // Bind data source
                    SalesData('1월', 2.0),
                    SalesData('2월', 2.8),
                    SalesData('3월', 3.6),
                    SalesData('4월', 3.0),
                    SalesData('5월', 4.5),
                    SalesData('6월', 4.0),
                    SalesData('7월', 4.2),
                    SalesData('8월', 3.8),
                    SalesData('9월', 3.9)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(
                    // Renders the data label
                      isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
            ]),
      ),
    );

    Widget datatableSection = Padding(
      padding:  EdgeInsets.fromLTRB(40.sp, 100.sp,40.sp, 0),
      child:Center(
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
                        fontSize: 45.sp,
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
                      child: Text(
                        '최근 1개월',
                        textAlign: TextAlign.right,
                        style:
                        TextStyle(
                            fontSize: 45.sp,
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
                        child: Text(
                          '',
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
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 45.sp),
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
                        style: TextStyle(
                            fontSize: 45.sp,
                            color: Colors.black54,
                            fontFamily: 'applesdneoeb'),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        child: Text(
                          '',
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
    )
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '추정수익률',
            style: TextStyle(color: Colors.white,fontSize: 67.sp,),
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
              child: ListView(
                children: <Widget>[
                  textSection,
                  chartSection,
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
