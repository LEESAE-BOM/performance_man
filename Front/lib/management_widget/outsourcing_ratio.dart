import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '전체 ',
                        style: TextStyle(
                          fontSize: 65.sp,
                          letterSpacing: 2.0,
                          fontFamily: 'applesdneoeb',
                          color: Colors.black,
                        )),
                    TextSpan(
                      text: '수주 비용 ',
                      style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                          fontFamily: 'applesdneoeb',
                          letterSpacing: 2.0),
                    ),
                    TextSpan(
                      text: '중\n',
                      style: TextStyle(
                        fontSize: 65.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '외주 비율',
                      style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                          fontFamily: 'applesdneoeb',
                          letterSpacing: 2.0),
                    ),
                    TextSpan(
                      text: '이 차지하는 비율은\n',
                      style: TextStyle(
                        fontSize: 65.sp,
                        letterSpacing: 2.0,
                        fontFamily: 'applesdneoeb',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '약 45% ',
                      style: TextStyle(
                          fontSize: 90.sp,
                          color: Colors.blue,
                          fontFamily: 'applesdneoeb',
                          letterSpacing: 2.0),
                    ),
                    TextSpan(
                        text: '이에요.',
                        style: TextStyle(
                          fontSize: 65.sp,
                          letterSpacing: 2.0,
                          fontFamily: 'applesdneoeb',
                          color: Colors.black,
                        )),

                  ]))
            ]));

    Widget chartSection = Center(
        child: Container(
            width: 1000.w,
            height: 300,
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
                          labelPosition: ChartDataLabelPosition.outside)
                      ,radius: '90%'
                  )
                ])));

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
                        '',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      alignment: Alignment.center,
                      child: Text('외주 내역',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 43.sp,
                              color: Colors.black54,
                              fontFamily: 'applesdneoeb')),
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
                            '최근 3개월',
                            textAlign: TextAlign.right,
                            style:
                            TextStyle(
                                fontSize: 43.sp,
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
                            '#,###,###',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 43.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            child: Text(
                              '##사',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 43.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                      DataCell(Text('')),
                    ],
                  ),
                ],
              ),
            ),
          ),)
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '외주 비율',
          style: TextStyle(fontSize: 67.sp, color: Colors.white),
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
          )),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
