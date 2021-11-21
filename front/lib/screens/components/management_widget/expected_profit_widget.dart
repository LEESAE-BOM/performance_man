import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/expected_profit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:intl/intl.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/screens/management/management_screen.dart';

late List<double> dataset1=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
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

    final List<SalesData> chartdata = [
      SalesData('1분기', dataset1[0]+dataset1[1]+dataset1[2]),
      SalesData('2분기',dataset1[3]+dataset1[4]+dataset1[5]),
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => expected_profit()));
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
            markerSettings: MarkerSettings(
                isVisible: true,
                color: Colors.blueAccent,
                borderColor: Colors.white),
            color: Colors.blueAccent),
        ]),
    ),
    );
    var money=dataset1[0]+dataset1[1]+dataset1[2]+
        dataset1[3]+dataset1[4]+dataset1[5]+
        dataset1[6]+dataset1[7]+dataset1[8]+
        dataset1[9]+dataset1[10]+dataset1[11];
    if(money>1600000000)
      state[2]='safe';
    else if(money>1200000000){
      state[2]='warning';
    }
    else {
      state[2]='danger';
    }

    return BoxWidget('예상수익', state[2], 'wide').make(
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
  int thisYear = DateTime.now().year;

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

  final samples = [
    for(int i=1; i<6; i++)
      await conn.getSalesData(thisYear - i)
  ];

  print(samples.length);

  final targetName = 'profit';
  final knnregressor= KnnRegressor(samples[0], targetName, 3);
  var regressor = knnregressor.retrain(samples[1]);
  for(int i=2; i<samples.length; i++) {
    if(samples[i].rows.length != 12) break;
    regressor = regressor.retrain(samples[i]);
  }

  final kprediction = regressor.predict(unlabel);

  for(int k=0;k<12;k++) {
    String i = kprediction.rows.elementAt(k).toString();
    dataset1[k] = double.parse(i.substring(1, i.length - 1));
  }
}
