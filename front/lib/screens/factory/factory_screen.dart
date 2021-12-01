import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/factory_widget/capacity_ratio_widget.dart';
import '.././components/factory_widget/developmentcompletion_rate_widget.dart';
import '.././components/factory_widget/labor_production_rate_widget.dart';
import '.././components/factory_widget/lead_time_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

List<String> state = ['safe', 'safe', 'safe', 'safe'];

class Factory_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color.fromRGBO(43, 63, 107, 1),
            ),
            alignment: Alignment.center,
            height: 550.w,
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                height: 450.w,
                child: FutureBuilder(
                    future: conn.sendQuery(
                        'SELECT Label, MAX(Achievement/Goal) Rate FROM CompletionRate NATURAL JOIN CompletionGoal WHERE Category=\'DVLCM\' GROUP BY Label;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result =
                            snapshot.data as List<Map<String, dynamic>>;
                        if (result.isNotEmpty) {
                          var label = result[0]['Label'];
                          var achieveRate =
                              double.parse(result[0]['Rate']) * 100;

                          return RichText(
                            text: detailPageTheme.makeMainHeaderText(
                                '현재까지\n${label}\n개발완료율 [${achieveRate.round()}]% 달성.'),
                          );
                        } else {
                          return RichText(
                            text: detailPageTheme
                                .makeMainHeaderText('데이터가 없습니다.'),
                          );
                        }
                      } else {
                        return RichText(
                          text: TextSpan(
                            text: "...",
                            style: TextStyle(
                              fontSize: 65.w,
                              color: Colors.white,
                              letterSpacing: 1.w,
                              fontFamily: 'applesdneob',
                            ),
                          ),
                        );
                      }
                    }),
              ),
              FutureBuilder(
                  future: _fetch1(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData == false) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    } else {
                      return Container(
                          alignment: Alignment.topCenter,
                          height: 100.w,
                          child: Text(
                            snapshot.data.toString(),
                            style: TextStyle(
                              fontSize: 52.w,
                              color: Colors.white,
                              letterSpacing: 3.w,
                              fontFamily: 'applesdneol',
                            ),
                          ));
                    }
                  })
            ])),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 20.w),
          child: Developmentcompletion_Rate_Widget(),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 10.w, 20.w),
              child: Capacity_Ratio_Widget(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 20.w, 20.w),
              child: Lead_Time_Widget(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
          child: Labor_Production_Rate_Widget(),
        ),
      ],
    ));
  }
}

Future<String> _fetch1() async {
  await Future.delayed(Duration(seconds: 3));

  List<int> stat_num = [0, 0, 0];

  for (var i = 0; i < 4; i++) {
    if (state[i] == 'safe')
      stat_num[0] = stat_num[0] + 1;
    else if (state[i] == 'warning')
      stat_num[1] = stat_num[1] + 1;
    else if (state[i] == 'danger') stat_num[2] = stat_num[2] + 1;
  }

  return '안전: ${stat_num[0]} 경고:${stat_num[1]} 위험:${stat_num[2]}';
}
