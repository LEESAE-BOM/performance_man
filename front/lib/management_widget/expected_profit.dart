import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';


late List<double> dataset=[0,0,0,0,0,0,0,0,0,0,0,0];

class expected_profit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _expected_profit();
}


class _expected_profit extends State<expected_profit> {
  final List<String> _valueList =['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
  String? _selectedValue='10월';
  late List<SalesData> chartdata;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

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

    machine().then((val) {
      setState(() {});
    }).catchError((error, stackTrace) {
      print("outer: $error");
    });

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
                      SalesData('1월',112055324),
                      SalesData('2월', 144332877),
                      SalesData('3월',169684265 ),
                      SalesData('4월', 190801135),
                      SalesData('5월', 180346212),
                      SalesData('6월',158219214 ),
                      SalesData('7월', 149806721),
                      SalesData('8월',128057382 ),
                      SalesData('9월', 122655578),
                      SalesData('10월',144528087),
                      SalesData('11월',154452175 ),
                      SalesData('12월',171232146 )
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
                      SalesData('1월',100049203),
                      SalesData('2월', 134537682),
                      SalesData('3월', 159208312),
                      SalesData('4월', 143136461),
                      SalesData('5월', 163892124),
                      SalesData('6월', 166342516),
                      SalesData('7월', 139849054),
                      SalesData('8월', 130964543),
                      SalesData('9월',128758433 ),
                      SalesData('10월',137845232 ),
                      SalesData('11월',149234798 ),
                      SalesData('12월',157564323 )
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
                      SalesData('1월',dataset[0]),
                      SalesData('2월', dataset[1]),
                      SalesData('3월', dataset[2]),
                      SalesData('4월', dataset[3]),
                      SalesData('5월', dataset[4]),
                      SalesData('6월', dataset[5]),
                      SalesData('7월', dataset[6]),
                      SalesData('8월', dataset[7]),
                      SalesData('9월', dataset[8]),
                      SalesData('10월', dataset[9]),
                      SalesData('11월', dataset[10]),
                      SalesData('12월', dataset[11])
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

Future<void> machine() async {
  final unlabel = DataFrame(<Iterable>[
    ['month', 'profit'],
    [1,],
    [2,],
    [3,],
    [4,],
    [5,],
    [6,],
    [7,],
    [8,],
    [9,],
    [10,],
    [11,],
    [12,],
  ], headerExists: true);

  //final samples = DataFrame(data, headerExists: true);
  final rawCsvContent = await rootBundle.loadString(
      'dataset/machine_sample_2016.csv');
  final samples_2016 = DataFrame.fromRawCsv(rawCsvContent, headerExists: true);

  final rawCsvContent2 = await rootBundle.loadString(
      'dataset/machine_sample_2017.csv');
  final samples_2017 = DataFrame.fromRawCsv(rawCsvContent2, headerExists: true);

  final rawCsvContent3 = await rootBundle.loadString(
      'dataset/machine_sample_2018.csv');
  final samples_2018 = DataFrame.fromRawCsv(rawCsvContent3, headerExists: true);

  final rawCsvContent4 = await rootBundle.loadString(
      'dataset/machine_sample_2019.csv');
  final samples_2019 = DataFrame.fromRawCsv(rawCsvContent4, headerExists: true);

  final rawCsvContent5 = await rootBundle.loadString(
      'dataset/machine_sample_2020.csv');
  final samples_2020 = DataFrame.fromRawCsv(rawCsvContent5, headerExists: true);

  final targetName = 'profit';
  final knnregressor= KnnRegressor(samples_2016, targetName, 3);

  final regressor_2 = knnregressor.retrain(samples_2017);
  //print('Regression coefficients: ${regressor_2.coefficients}');

  final regressor_3 = regressor_2.retrain(samples_2018);
  //print('Regression coefficients: ${regressor_3.coefficients}');

  final regressor_4 = regressor_3.retrain(samples_2019);
  //print('Regression coefficients: ${regressor_4.coefficients}');

  final regressor_5 = regressor_4.retrain(samples_2020);
  //print('Regression coefficients: ${regressor_5.coefficients}');

  final kprediction = regressor_5.predict(unlabel);
  print(kprediction);
  print(kprediction.rows);

  for(int k=0;k<12;k++) {
    String i = kprediction.rows.elementAt(k).toString();
    dataset[k] = double.parse(i.substring(1, i.length - 1));
  }
}
