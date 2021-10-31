import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/labor_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';

//작은 위젯
class Labor_Ratio_Widget extends StatefulWidget {
  @override
  _Labor_Ratio_Widget createState() => _Labor_Ratio_Widget();
}

class _Labor_Ratio_Widget extends State<Labor_Ratio_Widget> {
  @override
  Widget build(BuildContext context) {
    List<ChartData> laborData = [];

    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => labor_ratio()));
        },
        child: Container(
            width: 520.w,
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
                      '인건비율',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 35.w,
                          fontFamily: 'applesdneom'),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'image/warning.png',
                      width: 20.w,
                      height: 20.w,
                    ),
                  ],
                ),
              ),
              Container(
                width: 520.w,
                height: 310.w,
                child: FutureBuilder(
                    future: conn.sendQuery('SELECT MoneyDate, MoneyCategory, Money * 1000 as Money FROM Money WHERE MoneyCategory like \'%LBR\' ORDER BY MoneyDate DESC;'),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        var result = snapshot.data as List<Map<String, dynamic>>;
                        double totalDCLBR = 0;
                        double totalIDLBR = 0;
                        double IDLBRRate = 0;
                        double DCLBRRate = 0;

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

                        laborData.add(ChartData('직접인건비', DCLBRRate, '${DCLBRRate.round()}%'));
                        laborData.add(ChartData('간접인건비', IDLBRRate, '${IDLBRRate.round()}%'));

                        return SfCircularChart(
                            onChartTouchInteractionDown: (_Labor_Ratio_Widget) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) => labor_ratio()));
                            },
                            palette: <Color>[
                              Colors.indigo,
                              Colors.lightBlueAccent,
                            ],
                            series: <CircularSeries>[
                              PieSeries<ChartData, String>(
                                  radius: '100%',
                                  dataSource: laborData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  dataLabelMapper: (ChartData data, _) => data.text,
                                  dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      textStyle: TextStyle(fontSize: 50.w, fontFamily: 'applesdneob'))),
                            ]
                        );
                      }else{
                        return Text.rich(TextSpan(text: '불러오는 중...'));
                      }
                    }
                ),
              )
            ])));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text);

  final String x;
  final double y;
  final String text;
}
