import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class labor_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_ratio();
}

class _labor_ratio extends State<labor_ratio> {
  final List<String> _valueList =['최근 1개월','최근 3개월','최근 6개월'];
  String? _selectedValue='최근 3개월';
  late TooltipBehavior _tooltipBehavior;
  var today=DateTime.now();
  DateFormat formatter=DateFormat('yyyy년 MM월');

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
  List<ChartData> laborRate = [
    ChartData('간접인건비', 0),
    ChartData('직접인건비', 0)
  ];

  @override
  Widget build(BuildContext context) {
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
                ]
            )
        )
    );

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
                  if(_selectedValue=='최근 1개월')
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
                  if(_selectedValue=='최근 3개월')
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
                  if(_selectedValue=='최근 3개월')
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
                  if(_selectedValue=='최근 3개월')
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
                  if(_selectedValue=='최근 6개월')
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
                  if(_selectedValue=='최근 6개월')
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
                  if(_selectedValue=='최근 6개월')
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
                  if(_selectedValue=='최근 6개월')
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
                  if(_selectedValue=='최근 6개월')
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
                  if(_selectedValue=='최근 6개월')
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
        title: Text(
            '인건비율',
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
              Center(
                child: FutureBuilder(
                    future: conn.sendQuery('SELECT MoneyDate, MoneyCategory, Money * 1000 as Money FROM Money WHERE MoneyCategory like \'%LBR\' ORDER BY MoneyDate DESC;'),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        var result = snapshot.data as List<Map<String, dynamic>>;
                        var table = MySQLTable(result, ['날짜', '분류', '금액']);
                        double totalDCLBR = 0;
                        double totalIDLBR = 0;
                        double IDLBRRate = 0;
                        double DCLBRRate = 0;
                        int diff = 0;

                        int thisYear = DateTime.parse(result[0]['MoneyDate']).year;
                        int thisMonth = DateTime.parse(result[0]['MoneyDate']).month;

                        for(int i=0; i<result.length; i++) {
                          int year = DateTime.parse(result[i]['MoneyDate']).year;
                          int month = DateTime.parse(result[i]['MoneyDate']).month;
                          if(thisYear == year && thisMonth == month)
                            if (result[i]['MoneyCategory'] == 'DCLBR')
                              totalDCLBR += double.parse(result[i]['Money']);
                            else if (result[i]['MoneyCategory'] == 'IDLBR')
                              totalIDLBR += double.parse(result[i]['Money']);
                        }

                        IDLBRRate = (totalIDLBR / (totalIDLBR + totalDCLBR)) * 100;
                        DCLBRRate = (totalDCLBR / (totalIDLBR + totalDCLBR)) * 100;
                        diff = max(IDLBRRate.round(), DCLBRRate.round()) - min(IDLBRRate.round(), DCLBRRate.round());

                        laborRate[0].y = IDLBRRate;
                        laborRate[1].y = DCLBRRate;

                        return ListView(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 20.sp, 100.sp),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          detailPageTheme.makeHeaderText('$thisYear년 $thisMonth월은\n'),
                                          if(IDLBRRate > DCLBRRate)
                                            detailPageTheme.makeHeaderText('[간접인건비]가 '),
                                          if(IDLBRRate <= DCLBRRate)
                                            detailPageTheme.makeHeaderText('[직접인건비]가 '),
                                          detailPageTheme.makeHeaderText('[$diff%p] 높아요.'),
                                        ]
                                    )
                                )
                            ),
                            Container(
                                width: 1000.w,
                                height: 300,
                                child: SfCircularChart(
                                    palette: <Color>[
                                      Colors.indigo,
                                      Colors.lightBlueAccent,
                                    ],
                                    title: ChartTitle(
                                        text: '$thisYear',
                                        textStyle:
                                        TextStyle(fontSize: 100.sp, fontWeight: FontWeight.bold)),
                                    legend: Legend(
                                        isVisible: true,
                                        position: LegendPosition.bottom,
                                        isResponsive: false
                                    ),
                                    series: <CircularSeries>[
                                      // Render pie chart
                                      PieSeries<ChartData, String>(
                                          dataSource: laborRate,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y,
                                          dataLabelSettings: DataLabelSettings(
                                              isVisible: true,
                                              // Positioning the data label
                                              labelPosition: ChartDataLabelPosition.outside),
                                          radius: '100%'
                                      ),
                                    ]
                                )
                            ),
                            Table(
                              border: TableBorder(
                                  horizontalInside: BorderSide(width: 1,
                                      color: Colors.black38,
                                      style: BorderStyle.solid)),
                              children: <TableRow>[
                                table.getTableHeader()
                              ] + table.getTableRows(
                                  convertor: (row){
                                    if(row['MoneyCategory'] == 'IDLBR') row['MoneyCategory'] = '간접';
                                    else if(row['MoneyCategory'] == 'DCLBR') row['MoneyCategory'] = '직접';
                                    return row;
                                  }
                              ),
                            )
                          ],
                        );
                      } else if(snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else {
                        return Text('불러오는 중');
                      }
                    }
                ),
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
              ),
              ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        chartSection,
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
  double y;
}

class laborData {
  laborData(this.month, this.sales);

  final String? month;
  final double sales;
}
