import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/sales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

//큰 위젯
class Sales_Widget extends StatefulWidget {
  @override
  _Sales_Widget createState() => _Sales_Widget();
}

class _Sales_Widget extends State<Sales_Widget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => sales()));
        },
        child: Container(
            width: 1040.w,
            height: 400.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20.w, left: 35.w),
                    child: Row(
                      children: [
                        Text(
                          '매출금액',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 35.w,
                              fontFamily: 'applesdneom'),
                        ),
                        SizedBox(width: 10.w),
                        Image.asset(
                          'image/safe.png',
                          width: 20.w,
                          height: 20.w,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 1040.w,
                      height: 310.w,
                      child: Center(
                          child: FutureBuilder(
                              future: conn.sendQuery('SELECT Money * 1000 as Money FROM Money WHERE MoneyCategory = \'SALES\' ORDER BY MoneyDate DESC;'),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  var result = snapshot.data as List<Map<String, dynamic>>;
                                  String money = result[0]['Money'];
                                  return Text.rich(detailPageTheme.makeHeaderText('이번달 매출금액은\n[${money.substring(0, money.length - 3)}]원입니다.'));
                                }else{
                                  return Text.rich(TextSpan(text: '불러오는 중'));
                                }
                              }
                          )
                      )
                  ),
                ]
            )
        )
    );
  }
}
