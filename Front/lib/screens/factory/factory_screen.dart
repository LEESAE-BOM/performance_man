import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/factory_widget/capacity_ratio_widget.dart';
import '.././components/factory_widget/developmentcompletion_rate_widget.dart';
import '.././components/factory_widget/labor_production_rate_widget.dart';
import '.././components/factory_widget/lead_time_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child:Column(
        children:[
        Container(
        alignment: Alignment.center,
            height:450.w,
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: '개발완료율\n',
                  style: TextStyle(
                    fontSize: 65.w,
                    color: Colors.white,
                    letterSpacing: 1.w,
                    fontFamily: 'applesdneob',
                  ),
                ),
                TextSpan(
                  text: '72%',
                  style: TextStyle(
                      fontSize: 130.w,
                      color: Colors.white,
                      letterSpacing: 5.w,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(
                  text: ' 달성',
                  style: TextStyle(
                      fontSize: 65.w,
                      color: Colors.white,
                      letterSpacing: 1.w,
                      fontFamily: 'applesdneob'),
                ),
              ]),
            )
        ),
        Container(
            alignment: Alignment.topCenter,
            height:100.w,
            child:Text('안전: 3 경고: 0 위험: 1'
              ,style: TextStyle(
                fontSize: 52.w,
                color: Colors.white,
                letterSpacing: 3.w,
                fontFamily: 'applesdneol',
              ),
            )
        )
      ]
        )
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Developmentcompletion_Rate_Widget(),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Capacity_Ratio_Widget(),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Lead_Time_Widget(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Labor_Production_Rate_Widget(),
        ),
      ],
    ));
  }
}
