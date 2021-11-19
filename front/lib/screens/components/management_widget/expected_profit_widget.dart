import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/expected_profit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:intl/intl.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app/box_widget.dart';

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
    bool isScrolling = false;
    var state = 'danger';

    final List<SalesData> chartdata = [
      SalesData('1분기', dataset1[0]+dataset1[1]+dataset1[2]),
      SalesData('2분기',dataset1[3]+dataset1[4]+dataset1[5] ),
      SalesData('3분기', dataset1[6]+dataset1[7]+dataset1[8]),
      SalesData('4분기', dataset1[9]+dataset1[10]+dataset1[11])
    ];

    Widget chartSection = Center(
      child: Container(
        child: SfCartesianChart(
            onChartTouchInteractionMove: (_Expected_Profit_Widget) {
              isScrolling = true;
            },
            onChartTouchInteractionUp: (_Expected_Profit_Widget) {
              if (isScrolling == false) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => expected_profit()));
              }
              isScrolling = false;
            },
            onChartTouchInteractionDown: (_Expected_Profit_Widget) {
              isScrolling = false;
            },
            primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              numberFormat: NumberFormat.compact(locale:"ko_KR" ),
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
    var money=dataset1[0]+dataset1[1]+dataset1[2]+
        dataset1[3]+dataset1[4]+dataset1[5]+
        dataset1[6]+dataset1[7]+dataset1[8]+
        dataset1[9]+dataset1[10]+dataset1[11];
    if(money>1600000000)
      state='safe';
    else if(money>1200000000){
      state='warning';
    }
    else {
      state='danger';
    }

    return BoxWidget('예상수익', state, 'wide').make(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => expected_profit())
          );
          //Navigator.of(context).pushNamed(,arguments: dataset);
        },
        dbRelatedContentBuilder: chartSection
    );
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
