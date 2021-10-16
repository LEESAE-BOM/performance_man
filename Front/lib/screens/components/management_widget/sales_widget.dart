import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/sales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: 1060.w,
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
            child: Column(children: <Widget>[
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
                  width: 1060.w,
                  height: 320.w,
                  child: Center(
                      child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: '이번달 ',
                        style: TextStyle(
                          fontSize: 50.w,
                          color: Colors.black,
                          letterSpacing: 1.w,
                          fontFamily: 'applesdneob',
                        ),
                      ),
                      TextSpan(
                        text: '매출금액',
                        style: TextStyle(
                            fontSize: 70.w,
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
                        text: '\n123,456,789원',
                        style: TextStyle(
                            fontSize: 75.w,
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
