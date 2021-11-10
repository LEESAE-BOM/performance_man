import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/expected_profit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:flutter/services.dart' show rootBundle;

late List<double> dataset1=[0,0,0,0,0,0,0,0,0,0,0,0];
//큰 위젯
class Expected_Profit_Widget extends StatefulWidget {
  @override
  _Expected_Profit_Widget createState() => _Expected_Profit_Widget();
}

class _Expected_Profit_Widget extends State<Expected_Profit_Widget> {

  void initState(){
    machine().then((val) {
      setState(() {});
    }).catchError((error, stackTrace) {
      print("outer: $error");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartdata = [
      SalesData('1분기', dataset1[0]+dataset1[1]+dataset1[2]),
      SalesData('2분기',dataset1[3]+dataset1[4]+dataset1[5] ),
      SalesData('3분기', dataset1[6]+dataset1[7]+dataset1[8]),
      SalesData('4분기', dataset1[9]+dataset1[10]+dataset1[11])
    ];

    Widget chartSection = Center(
      child: Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            plotAreaBorderWidth: 0,
            series: <CartesianSeries>[
              FastLineSeries<SalesData, String>(
                  name: '2021',
                  dataSource: chartdata,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(
                      // Renders the data label
                      isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
            ]),
      ),
    );

    return GestureDetector(
        onTap: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => expected_profit()));
          //Navigator.of(context).pushNamed(,arguments: dataset);
        },
        child: Container(
            width: 1040.w,
            height: 400.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.w, bottom: 10.w, left: 35.w),
                child: Row(
                  children: [
                    Text(
                      '추정수익률',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 35.w,
                          fontFamily: 'applesdneom'),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'image/danger.png',
                      width: 20.w,
                      height: 20.w,
                    ),
                  ],
                ),
              ),
              Container(width: 1060.w, height: 310.w, child: chartSection)
            ])));
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
    dataset1[k] = double.parse(i.substring(1, i.length - 1));
  }
}
