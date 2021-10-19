import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/energy/energy_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class monthly_figures extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _monthly_figures();
}

class _monthly_figures extends State<monthly_figures> {
  late ZoomPanBehavior _zoomPanBehavior;
  late List<monthly_data> _monthly_data;
  late List<monthly_data> _monthly_data2;
  late List<monthly_data> _monthly_data3;
  late List<monthly_data> _monthly_data4;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
        enablePinching: true,
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enableMouseWheelZooming : true
    );
    _monthly_data = get_data();
    _monthly_data2 = get_data2();
    _monthly_data3 = get_data3();
    _monthly_data4 = get_data4();

    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<monthly_data> get_data(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 51),
      monthly_data('6월',214,  152),
      monthly_data('7월',124, 202),
      monthly_data('8월',224, 259),
      monthly_data('9월',244, 500)
    ];
    return chartData;
  }
  List<monthly_data> get_data2(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 531),
      monthly_data('6월',214, 12),
      monthly_data('7월',124, 02),
      monthly_data('8월',224, 259),
      monthly_data('9월',244, 540)
    ];
    return chartData;
  }
  List<monthly_data> get_data3(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 51),
      monthly_data('6월',324,  152),
      monthly_data('7월',12, 20),
      monthly_data('8월',424, 59),
      monthly_data('9월',24, 50)
    ];
    return chartData;
  }
  List<monthly_data> get_data4(){
    final List<monthly_data> chartData = [
      monthly_data('5월',24, 192),
      monthly_data('6월',214,  152),
      monthly_data('7월',124, 202),
      monthly_data('8월',224, 259),
      monthly_data('9월',244, 500)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    Widget textSection = Padding(
        padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 0, 50.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '9월의 전력 사용량은\n',
                      style:TextStyle(
                        fontSize: 58.sp,
                        color: Colors.black,
                        fontFamily: 'applesdneoeb',
                      ),),
                    TextSpan(text: '13,588 kWh\n',
                      style:TextStyle(
                          fontSize: 110.sp,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesdneoeb'),),
                    TextSpan(text: '전월대비 ',
                      style:TextStyle(
                          fontSize: 45.sp,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneoeb'),),
                    TextSpan(text: ' 2000만큼 감소',
                      style:TextStyle(
                          fontSize: 100.sp,
                          color: Colors.blue,
                          letterSpacing: 3.0,
                          fontFamily: 'applesdneoeb'),),
                    TextSpan(text: ' 했어요',
                      style:TextStyle(
                          fontSize:45.sp,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'applesdneoeb'),
                    ),

                  ]
              ),
            )
          ],
        )
    );

    Widget chartSection= Center(
        child: Container(
          width: 1000.w,
          height: 300,
          child: SfCartesianChart(
            zoomPanBehavior: _zoomPanBehavior,
            tooltipBehavior: _toolTipBehavior,
            palette: <Color>[
              Colors.blueAccent,
              Colors.cyan,
              Colors.orangeAccent,
              Colors.amberAccent
            ],
            legend: Legend(
                isVisible: true, // Legend will be placed at the left
                position: LegendPosition.top)
            ,
            primaryXAxis: CategoryAxis(),
            series: <CartesianSeries>[
              // Render column series
              ColumnSeries<monthly_data, String>(
                  name:'전 년도 전력사용량',
                  dataSource: _monthly_data,
                  xValueMapper: (monthly_data data, _) => data.x,
                  yValueMapper: (monthly_data data, _) => data.y
              ),
              ColumnSeries<monthly_data, String>(
                  name:'현 년도 전력사용량',
                  dataSource: _monthly_data2,
                  xValueMapper: (monthly_data data, _) => data.x,
                  yValueMapper: (monthly_data data, _) => data.y
              ),
              // Render line series
              LineSeries<monthly_data, String>(
                  name:'전 년도 최대전력',
                  dataSource: _monthly_data3,
                  xValueMapper: (monthly_data data, _) => data.x,
                  yValueMapper: (monthly_data data, _) => data.y1
              ),
              LineSeries<monthly_data, String>(
                  name:'현 년도 최대전력',
                  dataSource: _monthly_data4,
                  xValueMapper: (monthly_data data, _) => data.x,
                  yValueMapper: (monthly_data data, _) => data.y1
              )
            ]
            ,
          ),
        )
    );

    Widget datatableSection1= Padding(
        padding: EdgeInsets.fromLTRB(30.w, 100.sp,30.w, 0),
      child:Center(
        child: Container(
            width: 1020.w,
            child: Theme(
                data: Theme.of(context).copyWith(
                    dividerColor: Colors.black12
                ),
                child: DataTable(
                  columnSpacing:  0,
                  horizontalMargin: 0,
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black12),
                  columns: [
                    DataColumn(
                      label: Container(
                        width: 1020.w * .2,
                        alignment: Alignment.center,
                        child:
                        Text('구분',
                          style: TextStyle(
                              fontSize: 45.sp,
                              color: Colors.black54,
                              fontFamily: 'applesdneoeb'
                          ),
                        ),
                      ),
                      // numeric: true,
                    ),
                    DataColumn(
                        label:
                        Container(
                          width: 1020.w * .2666,
                          alignment: Alignment.center,
                          child: Text('8월',
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'
                            ),
                          ),
                        )
                    ),
                    DataColumn(
                        label:
                        Container(
                          width: 1020.w * .2666,
                          alignment: Alignment.center,
                          child: Text('9월',
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'
                            ),
                          ),
                        )
                    ),
                    DataColumn(
                        label:
                        Container(
                          width: 1020.w * .2666,
                          alignment: Alignment.center,
                          child: Text('10월',
                            style: TextStyle(
                                fontSize: 45.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'
                            ),
                          ),
                        )
                    )
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('2021년\n전력사용량',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),)
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('14,000',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),
                                  )
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('12,980',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('10,290',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text('2020년\n전력사용량',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'
                                    ),
                                  )
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('120,84',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('11,980',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('11,980',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text('2021년\n최대전력',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'
                                    ),
                                  )
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('11,980',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('85,780',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('70,122',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('2020년\n최대전력',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),)
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('14,000',
                                    style: TextStyle(
                                        fontSize: 3.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),
                                  )
                              )
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('11,980',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),
                          DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child:Text('11,980',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        color: Colors.black54,
                                        fontFamily: 'applesdneoeb'),))
                          ),

                        ]
                    ),
                  ],

                )
            )
        )
    )
    );


    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text('월별 전력 사용량',
                style: TextStyle(fontSize: 67.sp,
                    fontFamily: 'applesdneom'),),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(43, 63, 107, 1),
              leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
                Navigator.of(context).pop();
              }),
            ),
            body: SafeArea(
              child: Center(
                  child: ListView(
                    children: [
                      textSection,
                      chartSection,
                      datatableSection1,
                    ],
                  ),

              ),
            )
        )
    );

  }
}

class monthly_data {
  monthly_data(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double? y1;
}