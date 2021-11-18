import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/factory_widget/capacity_ratio_widget.dart';
import '.././components/factory_widget/developmentcompletion_rate_widget.dart';
import '.././components/factory_widget/labor_production_rate_widget.dart';
import '.././components/factory_widget/lead_time_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

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
                    future: conn.sendQuery('SELECT RecordedDate, Goal, Achievement FROM CompletionRate WHERE Category=\'DVLCM\' ORDER BY RecordedDate DESC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result = snapshot.data as List<Map<String, dynamic>>;
                        var goal = double.parse(result[0]['Goal']);
                        var achievement = double.parse(result[0]['Achievement']);
                        var achieveRate = (achievement / goal) * 100;

                        return RichText(
                            text: detailPageTheme.makeMainHeaderText(
                                '현재까지\n개발완료율 [${achieveRate.round()}]% 달성.'),
                        );
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
              Container(
                  alignment: Alignment.topCenter,
                  height: 100.w,
                  child: Text(
                    '안전: 2 경고: 1 위험: 1',
                    style: TextStyle(
                      fontSize: 52.w,
                      color: Colors.white,
                      letterSpacing: 3.w,
                      fontFamily: 'applesdneol',
                    ),
                  ))
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
