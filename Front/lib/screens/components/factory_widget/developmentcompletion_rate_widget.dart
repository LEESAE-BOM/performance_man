import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/development_completion_rate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//큰 위젯
class Developmentcompletion_Rate_Widget extends StatefulWidget {
  @override
  _Developmentcompletion_Rate_Widget createState() =>
      _Developmentcompletion_Rate_Widget();
}

class _Developmentcompletion_Rate_Widget
    extends State<Developmentcompletion_Rate_Widget> {
  late List<Sales_Data> _sales_Data;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _sales_Data = getSalesData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Sales_Data> getSalesData() {
    final List<Sales_Data> getSalesData = [
      Sales_Data('1월', 5),
      Sales_Data('2월', 10),
      Sales_Data('3월', 15),
      Sales_Data('4월', 33),
      Sales_Data('5월', 38),
      Sales_Data('6월', 53),
      Sales_Data('7월', 56),
      Sales_Data('8월', 58),
      Sales_Data('9월', 73),
    ];
    return getSalesData;
  }

  @override
  Widget build(BuildContext context) {
    Widget chartSection = SfCartesianChart(
      palette: <Color>[
        Colors.teal,
      ],
      series: <ChartSeries>[
        LineSeries<Sales_Data, String>(
            dataSource: _sales_Data,
            xValueMapper: (Sales_Data sales, _) => sales.month,
            yValueMapper: (Sales_Data sales, _) => sales.datas,
            dataLabelSettings: DataLabelSettings(
                // Renders the data label
                isVisible: true),
            markerSettings: MarkerSettings(
                isVisible: true,
                color: Colors.teal,
                borderColor: Colors.white)),
      ],
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      plotAreaBorderWidth: 0,
    );
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => development_completion_rate()));
        },
        child: Container(
            width: 1060.w,
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
                      '개발완료율',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 35.w,
                          fontFamily: 'applesdneom'),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'image/safe.png',
                      width: 20.w,
                      height: 20.w,
                    ),
                  ],
                ),
              ),
              Container(width: 1060.w, height: 320.w, child: chartSection)
            ])));
  }
}

class Sales_Data {
  Sales_Data(this.month, this.datas);

  final String month;
  final double datas;
}
