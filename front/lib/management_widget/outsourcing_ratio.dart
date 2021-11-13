import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

class outsourcing_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _outsourcing_ratio();
}

class _outsourcing_ratio extends State<outsourcing_ratio> {
  List<ChartData> outsourcingData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '외주 비율',
          style: TextStyle(fontSize: 67.sp, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107, 1),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SafeArea(
          child:Center(
            child: FutureBuilder(
                future: conn.sendQuery('SELECT ContractDate, Company, Price * 1000 as Money, Outsourcing * 1000 as OS FROM Contract ORDER BY ContractDate DESC;'),
                builder: (context, snapshot){
                  if(snapshot.hasData) {
                    var result = snapshot.data as List<Map<String, dynamic>>;
                    var table = ResultSet(result, ['날짜', '기업', '계약금액', '외주금액']);
                    double contractPrice = 0;
                    double outsourcePrice = 0;
                    double rate = 0;
                    int thisYear = DateTime.now().year;

                    for (var row in result) {
                      contractPrice += double.parse(row['Money']);
                      outsourcePrice += double.parse(row['OS']);
                    }

                    rate = (outsourcePrice / contractPrice) * 100;

                    outsourcingData.add(ChartData('외주비용', outsourcePrice));
                    outsourcingData.add(ChartData(' ', contractPrice - outsourcePrice));

                    return ListView(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(80.sp, 100.sp, 20.sp, 100.sp),
                            child: Text.rich(
                                TextSpan(
                                    children: [
                                      detailPageTheme.makeHeaderText('전체 수주 비용 중\n[외주 비용]이 차지하는 비율은\n[약 ${rate.round()}%]예요.'),
                                    ]
                                )
                            )
                        ),
                        Container(
                            width: 1000.w,
                            height: 300,
                            child: SfCircularChart(
                                title: ChartTitle(
                                    text: '$thisYear',
                                    textStyle:
                                    TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
                                legend: Legend(
                                    isVisible: true,
                                    position: LegendPosition.bottom,
                                    isResponsive: false
                                ),
                                series: <CircularSeries>[
                                  PieSeries<ChartData, String>(
                                      dataSource: outsourcingData,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          // Positioning the data label
                                          labelPosition: ChartDataLabelPosition.outside),
                                      radius: '90%'
                                  )
                                ]
                            )
                        ),
                        Table(
                          border: detailPageTheme.tableBorderStyle,
                          children: <TableRow>[
                            table.getTableHeaderWidget()
                          ] + table.getTableRowWidgets(
                              convertor: (row){
                            row['Money'] = '${detailPageTheme.money.format(double.parse(row['Money']))} 원';
                            row['OS'] = '${detailPageTheme.money.format(double.parse(row['OS']))} 원';
                            return row;
                          }),
                        )
                      ],
                    );
                  } else if(snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return Text('불러오는 중');
                  }
                }
            ),
          )
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  String x;
  double y;
}
