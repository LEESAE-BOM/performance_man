import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/labor_ratio.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';

//작은 위젯
class Labor_Ratio_Widget extends StatefulWidget {
  @override
  _Labor_Ratio_Widget createState() => _Labor_Ratio_Widget();
}

class _Labor_Ratio_Widget extends State<Labor_Ratio_Widget> {
  bool isScrolling = false;

  @override
  Widget build(BuildContext context) {
    List<ChartData> laborData = [];
    var state = 'danger';

    return FutureBuilder(
        future: conn.sendQuery('SELECT RecordedDate, Category, Money * 1000 as Money FROM Money WHERE Category like \'%LBR\' ORDER BY RecordedDate DESC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            double totalDCLBR = 0;
            double totalIDLBR = 0;
            double IDLBRRate = 0;
            double DCLBRRate = 0;

            int thisYear = DateTime
                .parse(result[0]['RecordedDate'])
                .year;
            int thisMonth = DateTime
                .parse(result[0]['RecordedDate'])
                .month;

            for (int i = 0; i < result.length; i++) {
              int year = DateTime
                  .parse(result[i]['RecordedDate'])
                  .year;
              int month = DateTime
                  .parse(result[i]['RecordedDate'])
                  .month;
              if (thisYear == year && thisMonth == month)
                if (result[i]['Category'] == 'DCLBR')
                  totalDCLBR += double.parse(result[i]['Money']);
                else if (result[i]['Category'] == 'IDLBR')
                  totalIDLBR += double.parse(result[i]['Money']);
            }

            laborData.clear();
            IDLBRRate = (totalIDLBR / (totalIDLBR + totalDCLBR)) * 100;
            DCLBRRate = (totalDCLBR / (totalIDLBR + totalDCLBR)) * 100;

            if( IDLBRRate>= DCLBRRate)
              state='safe';
            else if( IDLBRRate>= DCLBRRate-10)
              state='warning';
            else
              state='danger';
            return BoxWidget('인건비율', 'warning', 'narrow').make(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => labor_ratio()));
                },
                dbRelatedContentBuilder: FutureBuilder(
                    future: conn.sendQuery(
                        'SELECT RecordedDate, Category, Money * 1000 as Money FROM Money WHERE Category like \'%LBR\' ORDER BY RecordedDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        laborData = [
                          ChartData('직접인건비', DCLBRRate, '${DCLBRRate.round()}%'),
                          ChartData('간접인건비', IDLBRRate, '${IDLBRRate.round()}%')
                        ];
                        return SfCircularChart(
                            onChartTouchInteractionMove: (_Labor_Ratio_Widget) {
                              isScrolling = true;
                            },
                            onChartTouchInteractionUp: (_Labor_Ratio_Widget) {
                              if (isScrolling == false) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => labor_ratio()));
                              }
                              isScrolling = false;
                            },
                            onChartTouchInteractionDown: (_Labor_Ratio_Widget) {
                              isScrolling = false;
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
                                      textStyle: TextStyle(fontSize: 50.w,
                                          fontFamily: 'applesdneob'))),
                            ]
                        );
                      } else {
                        return Text.rich(TextSpan(text: '불러오는 중'));
                      }
                    }
                )
            );}
          else {
            return Text.rich(TextSpan(text: '불러오는 중'));
          }
        }
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text);

  final String x;
  final double y;
  final String text;
}
