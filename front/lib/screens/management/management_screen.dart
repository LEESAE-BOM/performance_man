import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/management_widget/sales_widget.dart';
import '.././components/management_widget/order_amount_widget.dart';
import '.././components/management_widget/cash_reserve_widget.dart';
import '.././components/management_widget/contracted_price_widget.dart';
import '.././components/management_widget/expected_profit_widget.dart';
import '.././components/management_widget/labor_ratio_widget.dart';
import '.././components/management_widget/outsourcing_ratio_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Management_Screen extends StatelessWidget {
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
                  text: '목표대비',
                  style: TextStyle(
                    fontSize: 65.w,
                    color: Colors.white,
                    letterSpacing: 1.w,
                    fontFamily: 'applesdneob',
                  ),
                ),
                TextSpan(
                  text: '\n총 ',
                  style: TextStyle(
                      fontSize: 65.w,
                      color: Colors.white,
                      letterSpacing: 1.w,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(
                  text: '105%',
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
                  )),
                Container(
                    alignment: Alignment.topCenter,
                  height:100.w,
                      child:Text('안전: 3 경고: 2 위험: 2'
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
          child: Sales_Widget(),
        ),
        Padding(
              padding: EdgeInsets.all(10.w),
              child: Cash_Reserve_Widget(),
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Contracted_Price_Widget(),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Labor_Ratio_Widget(),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Outsourcing_Ratio_Widget(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Expected_Profit_Widget(),
        ),
      ],
    ));
  }
}
