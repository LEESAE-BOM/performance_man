import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/outsourcing_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';

//작은 위젯
class Outsourcing_Ratio_Widget extends StatefulWidget {
  @override
  _Outsourcing_Ratio_Widget createState() => _Outsourcing_Ratio_Widget();
}

class _Outsourcing_Ratio_Widget extends State<Outsourcing_Ratio_Widget> {
  List<ChartData> outsourcingData = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => outsourcing_ratio()));
        },
        child: Container(
            width: 510.w,
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
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20.w, bottom: 10.w, left: 35.w),
                    child: Row(
                      children: [
                        Text(
                          '외주비율',
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
                  Container(
                      width: 510.w,
                      height: 310.w,
                      child: Center(
                        child: FutureBuilder(
                            future: conn.sendQuery('SELECT ContractDate, Company, Price * 1000 as Money, Outsourcing * 1000 as OS FROM Contract ORDER BY ContractDate DESC;'),
                            builder: (context, snapshot){
                              if(snapshot.hasData){
                                var result = snapshot.data as List<Map<String, dynamic>>;
                                int thisYear = DateTime.now().year;
                                double contractPrice = 0;
                                double outsourcePrice = 0;
                                double rate = 0;

                                for(var row in result) {
                                  int year = DateTime.parse(row['ContractDate']).year;
                                  if(thisYear > year) break;
                                  contractPrice += double.parse(row['Money']);
                                  outsourcePrice += double.parse(row['OS']);
                                }

                                rate = (outsourcePrice / contractPrice) * 100;

                                outsourcingData.clear();
                                outsourcingData.add(ChartData('외주비용', rate.round()));
                                outsourcingData.add(ChartData(' ', 100 - rate.round()));

                                return SfCircularChart(
                                    onChartTouchInteractionDown: (_Outsourcing_Ratio_Widget) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (context) => outsourcing_ratio()));
                                    },
                                    palette: <Color>[
                                      Colors.blue,
                                      Colors.grey,
                                    ],
                                    series: <CircularSeries>[
                                      PieSeries<ChartData, String>(
                                          radius: '100%',
                                          dataSource: outsourcingData,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y,
                                          dataLabelMapper: (ChartData data, _) => '${data.y}%',
                                          dataLabelSettings: DataLabelSettings(
                                              isVisible: true,
                                              textStyle: TextStyle(fontSize: 50.w, fontFamily: 'applesdneob')
                                          )
                                      ),
                                    ]
                                );
                              }else{
                                return Text.rich(TextSpan(text: '불러오는 중'));
                              }
                            }
                        ),
                      )
                  )
                ]
            )
        )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  int y;
}