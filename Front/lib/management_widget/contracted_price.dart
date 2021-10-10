import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class contracted_price extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _contracted_price();
}

class _contracted_price extends State<contracted_price> {
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming : true
    );
    super.initState();
  }

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
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: '이번 달 ',
                        style: TextStyle(
                            fontSize: 67.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black)),
                    TextSpan(
                      text: '계약 금액',
                      style: TextStyle(
                        fontSize: 85.sp,
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                        text: '은\n',
                        style: TextStyle(
                            fontSize: 67.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black)),
                    TextSpan(
                        text: '321,654,987원',
                        style: TextStyle(
                          fontSize: 85.sp,
                          color: Colors.blue,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    TextSpan(
                        text: ' 이에요.\n',
                        style: TextStyle(
                            fontSize: 67.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black)),
                    TextSpan(
                        text: '전월 대비 ',
                        style: TextStyle(
                            fontSize: 67.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black)
                    ),
                    TextSpan(
                      text: '1,000원 증가',
                      style: TextStyle(
                        fontSize: 85.sp,
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                        text: ' 했어요.',
                        style: TextStyle(
                            fontSize: 67.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black)),
                  ])
              ),
            ]));


    Widget chartSection = Center(
      child: Container(
        width: 1000.w,
        height: 300,
        child: SfCartesianChart(
          palette: <Color>[
            Colors.blueAccent,
            Colors.lightBlueAccent,
            Colors.teal,
          ],
          zoomPanBehavior: _zoomPanBehavior,
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              numberFormat: NumberFormat.compact()
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

    Widget datatableSection = Padding(
        padding: EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
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
                      width: 1020.w * .2,
                      child: Text(
                        '',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .4,
                      alignment: Alignment.center,
                      child: Text('매출 금액 내역',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 41.sp,
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
                                fontSize: 40.sp,
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
                            '기업',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 39.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '계약 금액',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 39.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '수주 잔고금액',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 39.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                    ],
                  ),
                  DataRow(
                    color:
                    MaterialStateColor.resolveWith((states) => Colors.black12),
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'A기업',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 39.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '4,123,123원',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 39.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                      DataCell(
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '456,789원',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 39.sp,
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
        title: Text('계약 금액',
            style: TextStyle(fontSize: 67.sp, color: Colors.white)),
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
