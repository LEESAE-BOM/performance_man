import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

class sales extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _sales();
}

class _sales extends State<sales> {
  late ZoomPanBehavior _zoomPanBehavior;
  String price = '...';

  Future<String> _get_sales_data() async {
    var _today = DateTime.now();
    String YearAndMonthForm = DateFormat('yyyy-MM').format(_today).toString() + '-01';

    var query = FormData.fromMap({
      "qry": "SELECT * FROM MONEYFLOW WHERE DATE(RecordedDate) = \'$YearAndMonthForm\'"
    });
    print('aa');
    var result = await Dio().post('http://teamflow.dothome.co.kr/doQuery.php', data:query);
    if(result.data[0] == 'F') return "ConnectError";
    print(result.data[1]);
    return result.data[1]['Price'].toString();
  }

  Widget _make_textSection(String text){
    return Padding(
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: '이번 달 ',
                          style: TextStyle(
                              fontSize: 65.sp,
                              letterSpacing: 2.0,
                              fontFamily: 'applesdneoeb',
                              color: Colors.black)),
                      TextSpan(
                          text: '매출 금액',
                          style: TextStyle(
                              fontSize:90.sp,
                              color: Colors.blue,
                              fontFamily: 'applesdneoeb',
                              letterSpacing: 2.0)),
                      TextSpan(
                        text: '은\n',
                        style: TextStyle(
                            fontSize: 65.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: '$text 원 ',
                        style: TextStyle(
                            fontSize:90.sp,
                            color: Colors.blue,
                            fontFamily: 'applesdneoeb',
                            letterSpacing: 2.0),
                      ),
                      TextSpan(
                        text: '이에요\n',
                        style: TextStyle(
                            fontSize: 65.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black),
                      ),
                      TextSpan(
                          text: '전월 대비 ',
                          style: TextStyle(
                              fontSize: 65.sp,
                              letterSpacing: 2.0,
                              fontFamily: 'applesdneoeb',
                              color: Colors.black)),

                      TextSpan(
                          text: '1,000원 증가 ',
                          style: TextStyle(
                              fontSize:90.sp,
                              color: Colors.blue,
                              fontFamily: 'applesdneoeb',
                              letterSpacing: 2.0)),
                      TextSpan(
                        text: '했어요',
                        style: TextStyle(
                            fontSize: 65.sp,
                            letterSpacing: 2.0,
                            fontFamily: 'applesdneoeb',
                            color: Colors.black),)
                    ]),
              )
            ]));
  }

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
    ChartData('1월', 2456000, 59765000, 78645000),
    ChartData('2월', 2789000, 74185000, 74545000),
    ChartData('3월', 3456000, 53695000, 47845000),
    ChartData('4월', 24753000, 74685000, 43685000),
    ChartData('5월', 2093000, 74185000, 78645000),
    ChartData('6월', 34436000, 12349000, 48612000),
    ChartData('7월', 4356000, 74501000, 45671000),
    ChartData('8월', 24636000, 14714000, 58258000),
    ChartData('9월', 54636000, 69312000, 65432000),
    ChartData('10월', 46536000, 57612000, 56432000),
    ChartData('11월', 34636000, 60512000, 67532000),
    ChartData('12월', 44636000, 67512000, 62932000),
  ];

  @override
  Widget build(BuildContext context) {
    Widget chartSection = Container(
      width: 1000.w,
      height: 300,
      child: Center(
        child: SfCartesianChart(
          zoomPanBehavior: _zoomPanBehavior,
          palette: <Color>[
            Colors.blueAccent,
            Colors.lightBlueAccent,
            Colors.teal,
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            // Y axis labels will be rendered with currency format
              numberFormat: NumberFormat.compact()),
          legend: Legend(
              isVisible: true,
              // Legend will be placed at the left
              position: LegendPosition.bottom),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
              name: '2019',
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y,
            ),
            ColumnSeries<ChartData, String>(
              name: '2020',
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y1,
            ),
            ColumnSeries<ChartData, String>(
              name: '2021',
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y2,
            ),
            LineSeries<ChartData, String>(
                name: '2021',
                color: Colors.teal,
                dataSource: chartData,
                xValueMapper: (ChartData sales, _) => sales.x,
                yValueMapper: (ChartData sales, _) => sales.y2,
                dataLabelSettings: DataLabelSettings(
                  // Renders the data label
                    isVisible: true),
                markerSettings: MarkerSettings(isVisible: true))
          ],
        ),
      ),
    );

    Widget datatableSection = Padding(
        padding:  EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
        child:Center(
          child: Container(
            width: 1020.w,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.grey),
              child: DataTable(
                columnSpacing: 0,
                horizontalMargin: 0,
                showBottomBorder: true,
                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black12),
                columns: <DataColumn>[
                  DataColumn(
                    label: Container(
                      width: 1020.w * .333,
                      child: Text(
                        '',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .333,
                      alignment: Alignment.center,
                      child: Text('매출 금액 내역',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 45.sp,
                              color: Colors.black54,
                              fontFamily: 'applesdneoeb')),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 1020.w * .333,
                      child: Text(
                        '',
                      ),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                          Text('')),
                      DataCell(Text('')),
                      DataCell(Container(
                          alignment: Alignment.center,
                          child: Text(
                            '최근 1개월',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 555.sp,
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
                            '월',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 40.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(Container(
                        child: Text(''),
                      )),
                      DataCell(
                        Container(
                            width: 1020.w * .333,
                            alignment: Alignment.center,
                            child: Text(
                              '45,600원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40.sp,
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
                          width: 1020.w * .333,
                          alignment: Alignment.center,
                          child: Text(
                            '10월',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 40.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(Container(
                        child: Text(''),
                      )),
                      DataCell(
                        Container(
                            width: 1020.w * .333,
                            alignment: Alignment.center,
                            child: Text(
                              '123,123,568원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40.sp,
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
          title: Text('매출 금액',
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
                  FutureBuilder(
                      future: _get_sales_data(),
                      builder: (context, snapshot){
                        if(snapshot.hasData) return _make_textSection(snapshot.data.toString());
                        else return _make_textSection('...');
                      }
                  ),
                  chartSection,
                  datatableSection
                ],
              )
          ),
        )
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
