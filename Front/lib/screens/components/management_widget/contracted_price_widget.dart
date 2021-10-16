import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/contracted_price.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: 1060.w,
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
            child: Column(children: <Widget>[
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
                  width: 1060.w,
                  height: 320.w,
                  child: Center(
                      child: //Text('목표대비 총 105% 달성', style: TextStyle(color: Colors.black54, fontSize: 20),)
                          RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: '이번달 ',
                        style: TextStyle(
                          fontSize: 50.w,
                          color: Colors.black,
                          letterSpacing: 1.w,
                          fontFamily: 'applesdneob',
                          //height: 1.0
                        ),
                      ),
                      TextSpan(
                        text: '계약금액',
                        style: TextStyle(
                            fontSize: 70.sp,
                            color: Colors.blueAccent,
                            letterSpacing: 5.w,
                            fontFamily: 'applesdneob'),
                      ),
                      TextSpan(
                        text: '은',
                        style: TextStyle(
                            fontSize: 50.w,
                            color: Colors.black,
                            letterSpacing: 1.w,
                            fontFamily: 'applesdneob'),
                      ),
                      TextSpan(
                        text: '\n321,654,987원',
                        style: TextStyle(
                            fontSize: 75.sp,
                            color: Colors.blueAccent,
                            letterSpacing: 5.w,
                            fontFamily: 'applesdneob',
                            height:1.5
                        ),
                      ),
                      TextSpan(
                        text: ' 입니다.',
                        style: TextStyle(
                            fontSize: 50.w,
                            color: Colors.black,
                            letterSpacing: 1.w,
                            fontFamily: 'applesdneob'),
                      ),
                    ]),
                  ))),
            ])));
  }
}
