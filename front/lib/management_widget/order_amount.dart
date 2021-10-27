import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class order_amount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _order_amount();
}

class _order_amount extends State<order_amount> {
  final List<String> _valueList =['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
  String? _selectedValue='10월';

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('수금', 40000, '40%'),
      ChartData('미수금', 50000, '50%'),
      ChartData('채권', 10000, '10%'),
    ];

    Widget textSection =
       Padding(
            padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 0, 100.sp),
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
                                )
                            ),
                            TextSpan(
                              text: '수주 금액',
                              style: TextStyle(
                                fontSize:90.sp,
                                color: Colors.blue,
                                letterSpacing: 2.0,
                                fontFamily: 'applesdneoeb',
                              ),
                            ),
                            TextSpan(
                              text: ' 은\n',
                              style: TextStyle(
                                fontSize: 65.sp,
                                letterSpacing: 2.0,
                                fontFamily: 'applesdneoeb',
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: '45,650,890원 ',
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
                              text: '전체 비율 중 ',
                              style: TextStyle(
                                fontSize: 65.sp,
                                letterSpacing: 2.0,
                                fontFamily: 'applesdneoeb',
                                color: Colors.black,
                              ),),
                            TextSpan(
                              text: '37% ',
                              style: TextStyle(
                                fontSize: 90.sp,
                                color: Colors.blue,
                                letterSpacing: 2.0,
                                fontFamily: 'applesdneoeb',
                              ),
                            ),
                            TextSpan(
                              text: '에 달해요.',
                              style: TextStyle(
                                fontSize: 65.sp,
                                letterSpacing: 2.0,
                                fontFamily: 'applesdneoeb',
                                color: Colors.black,
                              ),
                            ),
                          ]
                      )
                  )
                ]));

    Widget chartSection = Center(
        child: Container(
            width: 1000.w,
            height: 490,
            child: SfCircularChart(
                title: ChartTitle(
                    text: '2021',
                    textStyle: TextStyle(
                      fontSize: 90.sp,
                      fontWeight: FontWeight.bold,
                    )),
                legend: Legend(
                    isVisible: true, // Legend will be placed at the left
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
                        textStyle:  TextStyle(
                            fontSize: 50.sp,
                            fontFamily: 'applesdneom'
                        )
                    ),

                  ),
                ])));

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
                      width: 1020.w * .3,
                      alignment: Alignment.center,
                      child: Text(
                        '종류',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 43.sp,
                            color: Colors.black54,
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
                              fontSize: 43.sp,
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
                          alignment: Alignment.center,
                          width: 1020.w * 1.0,
                          child:DropdownButton(
                            value:_selectedValue,
                            items: _valueList.map(
                                  (String value){
                                return DropdownMenuItem(
                                    value:value,
                                    child: Text(value)
                                );
                              },
                            ).toList(),
                            onChanged: (String? value){
                              setState((){
                                _selectedValue=value;
                              });
                            },
                          )))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '수금 금액',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 43.sp,
                                color: Colors.black54,
                                fontFamily: 'applesdneoeb'),
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                            width: 1020.w * 0.7,
                            alignment: Alignment.center,
                            child: Text(
                              '40,000원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 43.sp,
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
                            '미수금 금액',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 43.sp,
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
                              '50,000원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 43.sp,
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
                            '채권 금액',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 43.sp,
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
                              '10,000원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 43.sp,
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
            '수주 금액',
            style: TextStyle(fontSize: 67.sp,color: Colors.white),
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
                )
            )
        )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text);

  final String x;
  final double y;
  final String text;
}