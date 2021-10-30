
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';

class cash_reserve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _cash_reserve();
}

class _cash_reserve extends State<cash_reserve> {
  final List<String> _valueList =['최근 1년','최근 3년','최근 5년'];
  String? _selectedValue='최근 3년';
  final List<String> _valueList2 =['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
  String? _selectedValue2='10월';

  Map<String, int> selectOptions = {
    '최근 3개년': 3,
    '최근 6개년': 6,
    '전체보기': -1,
  };
  var dropDownValue = '최근 3개년';
  List<ChartData> cashData = [];
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
                  if(_selectedValue=='최근 1년')
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
                                '253,654,977원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              )),
                        ),
                      ],
                    ),
                  if(_selectedValue=='최근 3년')
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
                  if(_selectedValue=='최근 3년')
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
                                '253,654,978원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              )),
                        ),
                      ],
                    ) ,
                  if(_selectedValue=='최근 3년')
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
                                '253,654,978원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              )),
                        ),
                      ],
                    ) ,
                  if(_selectedValue=='최근 5년')
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Container(
                            width: 1020.w * .3,
                            alignment: Alignment.center,
                            child: Text(
                              '2017',
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
                                '253,654,979원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              )),
                        ),
                      ],
                    ),
                  if(_selectedValue=='최근 5년')
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Container(
                            width: 1020.w * .3,
                            alignment: Alignment.center,
                            child: Text(
                              '2018',
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
                                '253,654,979원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              )),
                        ),
                      ],
                    ),
                  if(_selectedValue=='최근 5년')
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
                                '253,654,979원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              )),
                        ),
                      ],
                    ),
                  if(_selectedValue=='최근 5년')
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
                                '253,654,979원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.black54,
                                    fontFamily: 'applesdneoeb'),
                              )),
                        ),
                      ],
                    ),
                  if(_selectedValue=='최근 5년')
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
                                '253,654,979원',
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
                          child:DropdownButton(
                            value:_selectedValue2,
                            items: _valueList2.map(
                                  (String value){
                                return DropdownMenuItem(
                                    value:value,
                                    child: Text(value)
                                );
                              },
                            ).toList(),
                            onChanged: (String? value){
                              setState((){
                                _selectedValue2=value;
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
              FutureBuilder(
                  future: conn.sendQuery('SELECT YEAR(MoneyDate) as Year, SUM(Money) * 1000 as Money FROM Money WHERE MoneyCategory=\'MONEY\' GROUP BY Year ORDER BY Year DESC;'),
                  builder: (context, snapshot){
                    if(snapshot.hasData) {
                      var result = snapshot.data as List<Map<String, dynamic>>;
                      var year = '';
                      var thisYearPrice = '0.00';
                      var previousYearPrice = '0.00';
                      var table = MySQLTable(snapshot.data, ['연도', '금액']);

                      if(result.length > 0){
                        year = result[0]['Year'];
                        thisYearPrice = result[0]['Money'];
                      }
                      if(result.length > 1) previousYearPrice = result[1]['Money'];

                      int diff = int.parse(thisYearPrice.substring(0, thisYearPrice.length - 3)) - int.parse(previousYearPrice.substring(0, previousYearPrice.length - 3));
                      double incrementRate = 0;
                      if(previousYearPrice != '0.00')
                        incrementRate = ( diff / int.parse(previousYearPrice.substring(0, previousYearPrice.length - 3))) * 100;
                      if(incrementRate < 0) incrementRate *= -1;

                      for(int i=0; i<min(result.length, 3); i++)
                        cashData.insert(0, ChartData(double.parse(result[i]['Year']), double.parse(result[i]['Money'])));

                      TableRow header = table.getTableHeader(TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          color: Colors.black87));
                      List<TableRow> rows = table.getTableRows(TextStyle(fontSize: 40.sp, color: Colors.black38));
                      selectOptions['전체보기'] = table.rows.length;

                      return ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 20.sp, 100.sp),
                            child: Text.rich(
                                TextSpan(
                                    children: [
                                      HeaderTheme().makeHeaderText('$year년 [현금 보유액]은\n[${thisYearPrice.substring(0, thisYearPrice.length - 3)}]원 입니다.'),
                                      if(previousYearPrice != '0.00')
                                        HeaderTheme().makeHeaderText('\n전년대비 [${incrementRate.round()}%]'),
                                      if(diff < 0)
                                        HeaderTheme().makeHeaderText('[감소]했어요.'),
                                      if(diff >= 0)
                                        HeaderTheme().makeHeaderText('[상승]했어요.'),
                                    ]
                                )
                            ),
                          ),
                          Center(
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
                                        dataSource: cashData,
                                        xValueMapper: (ChartData sales, _) => sales.x,
                                        yValueMapper: (ChartData sales, _) => sales.y,
                                        dataLabelSettings: DataLabelSettings(
                                          // Renders the data label
                                            isVisible: true),
                                        width: 0.6,
                                        spacing: 0.2,
                                      ),
                                    ])),
                          ),
                          Table(
                            border: TableBorder(
                                horizontalInside: BorderSide(width: 1,
                                    color: Colors.black38,
                                    style: BorderStyle.solid)),
                            children: [
                              header,
                              TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(''),
                                    ),
                                    TableCell(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50.sp),
                                          child: DropdownButton(
                                            value: dropDownValue,
                                            items: <DropdownMenuItem<String>>[
                                              for(var val in selectOptions.keys)
                                                DropdownMenuItem(value: val,
                                                    child: Text(val))
                                            ],
                                            onChanged: (String? val) {
                                              setState(() {
                                                dropDownValue = val!;
                                              });
                                            },
                                            isExpanded: true,
                                          ),
                                        )
                                    )
                                  ]
                              )
                            ] + rows.sublist(0, min(selectOptions[dropDownValue] as int, table.rows.length)),
                          )
                        ],
                      );
                    }else{
                      return Text('...');
                    }
                  }
              ),
              ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
