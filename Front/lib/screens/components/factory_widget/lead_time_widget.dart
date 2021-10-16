import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/lead_time.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//작은 위젯
class Lead_Time_Widget extends StatefulWidget {
  @override
  _Lead_Time_Widget createState() => _Lead_Time_Widget();
}

class _Lead_Time_Widget extends State<Lead_Time_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 520.w,
        height: 400.w,
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => lead_time()));
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
                          'lead-time',
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
                    width: 520.w,
                    height: 320.w,
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          // default text style
                          children: <TextSpan>[
                            TextSpan(
                              text: '9',
                              style: TextStyle(
                                fontSize: 170.w,
                                color: Color.fromRGBO(43, 63, 107, 1),
                                letterSpacing: 5.0.w,
                                fontFamily: 'applesdneob',
                              ),
                            ),
                            TextSpan(
                              text: 'days ',
                              style: TextStyle(
                                fontSize: 80.w,
                                color: Colors.black87,
                                letterSpacing: 5.0.w,
                                fontFamily: 'applesdneob',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))));
  }
}
