import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'style.dart' as predefinedStyle;

main() => runApp(MaterialApp(home: HorizontalScrollableBoxes()));

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2);

  final String? x;
  final int y;
  final int y1;
  final int y2;
}

class HorizontalScrollableBoxes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HorizontalScrollableBoxes();

}

class _HorizontalScrollableBoxes extends State<HorizontalScrollableBoxes> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1080, 1920),
        builder: (){
          predefinedStyle.TextTheme theme =  predefinedStyle.TextTheme();
          return Scaffold(
            appBar: AppBar(
              title: Text('예제!'),
            ),
            body: _buildPage(context, theme),
          );
        }
    );
  }

  Widget _buildPage(BuildContext context,  predefinedStyle.TextTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              theme.text('이번 달 매출금액은\n[1000]원이에요')
            ]
          )
        ),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 350,
          child: PageView(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 1),
            children: [_firstBox(context), _secondBox(context)],
          )
        ),
        Text('이건 안움직이지...')
      ],
    );
  }

  Widget _firstBox(BuildContext context){
    final List<SalesData> chartData = [
      SalesData(2010, 35, 23),
      SalesData(2011, 38, 49),
      SalesData(2012, 34, 12),
      SalesData(2013, 52, 33),
      SalesData(2014, 40, 30)
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                  child: SfCartesianChart(
                      series: <ChartSeries>[ 
                        // Renders column chart
                      ColumnSeries<SalesData, double>(
                      dataSource: chartData,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales
                      )
                      ]
                  )
              ), 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
            ),
          ]
        )
    );
  }

  Widget _secondBox(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
      child: Container(
        child: Center(
            child: Text('두 번째')
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
  }
}

class SalesData{
  double year;
  int sales;
  int y;

  SalesData(this.year, this.sales, this.y);
}