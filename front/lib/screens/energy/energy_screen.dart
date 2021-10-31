import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/energy_widget/hourly_figures_widget.dart';
import '.././components/energy_widget/energy_fee_widget.dart';
import '.././components/energy_widget/monthly_figures_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      height:450.w,
                      child:RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: '이번 달 전력 사용량\n',
                            style: TextStyle(
                              fontSize: 65.w,
                              color: Colors.white,
                              letterSpacing: 1.w,
                              fontFamily: 'applesdneob',
                            ),
                          ),
                          TextSpan(
                            text: '13,588',
                            style: TextStyle(
                                fontSize: 130.w,
                                color: Colors.white,
                                letterSpacing: 5.w,
                                fontFamily: 'applesdneob'),
                          ),
                          TextSpan(
                            text: ' kWh',
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
          padding: EdgeInsets.all(10.w),
          child: Monthly_Figures_Widget(),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Energy_Fee_Widget(),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Hourly_Figures_Widget(),
            ),
          ],
        ),
      ],
    ));
  }
}
