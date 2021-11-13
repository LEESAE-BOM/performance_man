import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/management_widget/sales_widget.dart';
import '.././components/management_widget/cash_reserve_widget.dart';
import '.././components/management_widget/contracted_price_widget.dart';
import '.././components/management_widget/expected_profit_widget.dart';
import '.././components/management_widget/labor_ratio_widget.dart';
import '.././components/management_widget/outsourcing_ratio_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';

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
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                height: 450.w,
                child: FutureBuilder(
                    future: conn.sendQueries([
                      'SELECT * FROM Money WHERE MoneyCategory=\'GSALE\' ORDER BY MoneyDate DESC;',
                      'SELECT YEAR(MoneyDate) AS Year, MONTH(MoneyDate) AS Month, SUM(Money) AS Sum FROM Money WHERE MoneyCategory=\'SALES\' GROUP BY Year, Month ORDER BY Year DESC, Month DESC;'
                    ]),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result = snapshot.data as List<List<Map<String, dynamic>>>;
                        var resultQ1 = result[0];
                        var resultQ2 = result[1];
                        int quarter = 1;
                        int i = 0;
                        double sum = 0;

                        switch (DateTime.parse(resultQ1[0]['MoneyDate']).month) {
                          case 1:
                            quarter = 1;
                            break;
                          case 4:
                            quarter = 2;
                            break;
                          case 7:
                            quarter = 3;
                            break;
                          case 10:
                            quarter = 4;
                            break;
                        }

                        while (i < resultQ2.length) {
                          sum += double.parse(resultQ2[i]['Sum']);
                          if (DateTime.parse(resultQ1[0]['MoneyDate']).month ==
                              int.parse(resultQ2[i]['Month'])) break;
                          i++;
                        }
                        return RichText(
                            text: TextSpan(
                          text:
                              '$quarter분기 매출금액\n목표 대비 ${(sum / double.parse(resultQ1[0]['Money']) * 100).round()}% 달성',
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
                  height: 100.w,
                  child: Text(
                    '안전: 3 경고: 2 위험: 2',
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
          child: Sales_Widget(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
          child: Cash_Reserve_Widget(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
          child: Contracted_Price_Widget(),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 10.w, 20.w),
              child: Labor_Ratio_Widget(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 20.w, 20.w),
              child: Outsourcing_Ratio_Widget(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
          child: Expected_Profit_Widget(),
        ),
      ],
    ));
  }
}
