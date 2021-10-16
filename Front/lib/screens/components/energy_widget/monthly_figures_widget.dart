import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/monthly_figures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//큰 위젯

class Monthly_Figures_Widget extends StatefulWidget {
  @override
  _Monthly_Figures_Widget createState() => _Monthly_Figures_Widget();
}

class _Monthly_Figures_Widget extends State<Monthly_Figures_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1060.w,
        height: 400.w,
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => monthly_figures()));
            },
            child: Container(
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
                    padding:
                        EdgeInsets.only(top: 20.w, bottom: 10.w, left: 35.w),
                    child: Row(
                      children: [
                        Text(
                          '월별 에너지',
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
                  /*SizedBox(
                    height: 10,
                  ),*/
                  Container(
                    width: 1060.w,
                    height: 320.w,
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '전월대비',
                                    style: TextStyle(
                                      fontSize: 60.w,
                                      color: Colors.black,
                                      letterSpacing: 1.w,
                                      fontFamily: 'applesdneob',
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n2000만큼',
                                    style: TextStyle(
                                        fontSize: 85.w,
                                        color: Colors.blue,
                                        letterSpacing: 5.w,
                                        fontFamily: 'applesdneob'),
                                  ),
                                  TextSpan(
                                    text: ' 감소',
                                    style: TextStyle(
                                        fontSize: 60.w,
                                        color: Colors.black,
                                        letterSpacing: 1.w,
                                        fontFamily: 'applesdneob'),
                                  ),
                                ],
                              ),
                            ),
                            Icon(CupertinoIcons.hand_thumbsdown_fill,
                                size: 160.w, color: Colors.blue)
                          ]),
                    ),
                  )
                ]))));
  }
}
