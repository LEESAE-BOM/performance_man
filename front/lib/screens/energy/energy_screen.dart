import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/energy_widget/hourly_figures_widget.dart';
import '.././components/energy_widget/energy_fee_widget.dart';
import '.././components/energy_widget/monthly_figures_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';

class Energy_Screen extends StatelessWidget {
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
                    height: 450.w,
                    child: FutureBuilder(
                        future: conn.sendQuery('SELECT UseDate, Amount * 1000 as Amount FROM EnergyUse ORDER BY UseDate DESC;'),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var result = snapshot.data as List<Map<String, dynamic>>;
                            var thisMonthPrice = double.parse(result[0]['Amount']);

                            return RichText(
                                text: TextSpan(
                                  text:
                                  '이번 달 전기 사용량\n${thisMonthPrice.round()}kWh',
                                  style: TextStyle(
                                    fontSize: 65.w,
                                    color: Colors.white,
                                    letterSpacing: 1.w,
                                    fontFamily: 'applesdneob',
                                  ),
                                ));
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
                      height:100.w,
                      child:Text('안전: 3 경고: 0 위험: 0'
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
        )
        ,
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 20.w),
          child: Energy_Fee_Widget(),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 10.w, 20.w),
              child: Monthly_Figures_Widget(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 20.w, 20.w),
              child: Hourly_Figures_Widget(),
            ),
          ],
        ),
      ],
    ));
  }
}
