import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/outsourcing_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';

//작은 위젯
class Outsourcing_Ratio_Widget extends StatefulWidget {
  @override
  _Outsourcing_Ratio_Widget createState() => _Outsourcing_Ratio_Widget();
}

class _Outsourcing_Ratio_Widget extends State<Outsourcing_Ratio_Widget> {
  List<ChartData> outsourcingData = [];
  bool isScrolling = false;

  @override
  Widget build(BuildContext context) {
    return BoxWidget('외주비율', 'warning', 'narrow').make(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => outsourcing_ratio()));
      },
      dbRelatedContentBuilder: FutureBuilder(
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
              outsourcingData.add(ChartData('자체제작', 100 - rate.round()));

              return SfCircularChart(
                  onChartTouchInteractionMove: (_Outsourcing_Ratio_Widget){
                    isScrolling = true;
                  },
                  onChartTouchInteractionUp: (_Outsourcing_Ratio_Widget) {
                    if(isScrolling == false){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => outsourcing_ratio()));
                    }
                    isScrolling = false;
                  },
                  onChartTouchInteractionDown: (_Outsourcing_Ratio_Widget){
                    isScrolling = false;
                  },
                  palette: <Color>[

                    Color.fromRGBO(211, 211, 211, 1),
                    Color.fromRGBO(111, 166, 223, 1),
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
                            textStyle: TextStyle(fontSize: 50.w, color: Colors.black,fontFamily: 'applesdneob')
                        )
                    ),
                  ]
              );
            }else{
              return Text.rich(TextSpan(text: '불러오는 중'));
            }
          }
      )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  int y;
}