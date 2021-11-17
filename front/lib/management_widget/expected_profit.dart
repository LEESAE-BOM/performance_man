import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:flutter_app/screens/components/management_widget/expected_profit_widget.dart';


late List<double> dataset=dataset1;

class expected_profit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _expected_profit();
}


class _expected_profit extends State<expected_profit> {

  // final List<double> machine = ModalRoute.of(context).settings.arguments as List<double>;

  final List<String> _valueList =['1분기','2분기','3분기','4분기'];
  final List<String> _monthList =['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
  String? _selectedValue='1분기';
  late List<SalesData> chartdata;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  var row1=0; var row2=1; var row3=2;

  @override
  void initState(){
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
  var f = NumberFormat("###,###,###,#### 만원");

  @override
  Widget build(BuildContext context) {
    var result=dataset[0]+dataset[1]+dataset[2]+dataset[3]+dataset[4]+dataset[5]+dataset[6]+dataset[7]+dataset[8]+dataset[9]+dataset[10]+dataset[11];

    Widget textSection = Padding(
        padding: EdgeInsets.fromLTRB(50.sp, 100.sp, 20.sp, 100.sp),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                  TextSpan(
                      children: [
                        detailPageTheme.makeHeaderText('이번년도 [예상수익]은 \n [${detailPageTheme.money.format(result)}원] 입니다.'),
                           ]
                  )
              )
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
            primaryYAxis: NumericAxis(numberFormat: NumberFormat.compact(locale:"ko_KR" ),),
            series: <CartesianSeries>[
              FastLineSeries<SalesData, String>(
                  name: '2019',
                  dataSource: [
                    SalesData('1분기',112055324+144332877+169684265),
                    SalesData('2분기',190801135+180346212+158219214 ),
                    SalesData('3분기', 149806721+128057382+122655578),
                    SalesData('4분기', 144528087+154452175+171232146)
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
                    SalesData('1분기',100049203+134537682+159208312),
                    SalesData('2분기', 143136461+163892124+166342516 ),
                    SalesData('3분기', 139849054+ 130964543+128758433),
                    SalesData('4분기', 137845232+149234798+157564323 )
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
                    SalesData('1분기', dataset[0]+dataset[1]+dataset[2]),
                    SalesData('2분기',dataset[3]+dataset[4]+dataset[5] ),
                    SalesData('3분기', dataset[6]+dataset[7]+dataset[8]),
                    SalesData('4분기', dataset[9]+dataset[10]+dataset[11])
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
        padding: EdgeInsets.fromLTRB(10.w, 0,10.w, 0),
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
                        '월',
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
                      width: 1020.w * .7,
                      alignment: Alignment.center,
                      child: Text('예상 수익',
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
                          width: 1020.w * 0.6,
                          alignment: Alignment.centerRight,
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
                                if(value=='1분기'){
                                  row1=0;row2=1;row3=2;
                                }
                                else if(value=='2분기'){
                                  row1=3;row2=4;row3=5;
                                }
                                else if(value=='3분기'){
                                  row1=6;row2=7;row3=8;
                                }
                                else if(value=='4분기'){
                                  row1=9;row2=10;row3=11;
                                }
                              });
                            },
                          )
                      )
                      )
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            _monthList[row1],
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
                              '${detailPageTheme.money.format(double.parse(dataset[row1].toString()))}원',
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
                            _monthList[row2],
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
                              '${detailPageTheme.money.format(double.parse(dataset[row2].toString()))}원',
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
                            _monthList[row3],
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
                              '${detailPageTheme.money.format(double.parse(dataset[row3].toString()))}원',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 45.sp,
                                  color: Colors.black54,
                                  fontFamily: 'applesdneoeb'),
                            )),
                      ),
                    ],
                  ),DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            _selectedValue.toString(),
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
                              '${detailPageTheme.money.format(double.parse((dataset[row1]+dataset[row2]+dataset[row3]).toString()))}원',
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
            '예상수익',
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
                  Padding(padding: EdgeInsets.fromLTRB(70.w, 0, 0, 30.w),
                      child:Text("인공지능을 사용하여 예측한 결과입니다.",
                        style: TextStyle(color: Colors.grey,fontSize: 35.sp,fontFamily: 'applesdneoeb'),)
                  ),
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
