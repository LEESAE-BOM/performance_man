import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/contracted_price.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';

//큰 위젯
class Contracted_Price_Widget extends StatefulWidget {
  @override
  _Contracted_Price_Widget createState() => _Contracted_Price_Widget();
}

class _Contracted_Price_Widget extends State<Contracted_Price_Widget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => contracted_price()));
        },
        child: Container(
            width: 1040.w,
            height: 400.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black12,
              ),
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
                          '계약금액',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 35.w,
                              fontFamily: 'applesdneom'),
                        ),
                        SizedBox(width: 10.w),
                        Image.asset(
                          'image/warning.png',
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
                              future: conn.sendQuery('SELECT Price * 1000 as Money FROM Contract ORDER BY ContractDate DESC;'),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  var result = snapshot.data as List<Map<String, dynamic>>;
                                  int money = double.parse(result[0]['Money']).round();
                                  return Text.rich(detailPageTheme.makeHeaderText('이번달 [계약금액]은\n[${detailPageTheme.money.format(money)}]원입니다.'));
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
