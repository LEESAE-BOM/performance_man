import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/development_completion_rate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Developmentcompletion_Rate_Widget extends StatefulWidget {
  @override
  _Developmentcompletion_Rate_Widget createState() =>
      _Developmentcompletion_Rate_Widget();
}

class _Developmentcompletion_Rate_Widget extends State<Developmentcompletion_Rate_Widget> {
  late List<Sales_Data> _sales_Data;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    _sales_Data = getSalesData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Sales_Data> getSalesData(){
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

    Widget chartSection= SfCartesianChart(
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
                color:  Colors.teal,
                borderColor: Colors.white
            )
        ),
      ]

      ,primaryXAxis: CategoryAxis(
      majorGridLines: MajorGridLines(width: 0),
    ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      plotAreaBorderWidth:0,

    );
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => development_completion_rate()));
        },
        child: Container(
            width: ScreenUtil().setWidth(360),
            height: ScreenUtil().setHeight(200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            //margin: EdgeInsets.all(30),
            child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    child: Row(
                      children: [
                        Text(
                          '개발완료율',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                        Image.asset(
                          'image/safe.png',
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(140),
                      child:chartSection
                  )
                ]
            )
        )
    );
  }
}

class Sales_Data {
  Sales_Data(this.month, this.datas);
  final String month;
  final double datas;
}