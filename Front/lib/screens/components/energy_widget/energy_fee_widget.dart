import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/energy_fee.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//작은 위젯
class Energy_Fee_Widget extends StatefulWidget {
  @override
  _Energy_Fee_Widget createState() => _Energy_Fee_Widget();
}

class _Energy_Fee_Widget extends State<Energy_Fee_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 520.w,
        height: 400.w,
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => energy_fee()));
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
                        EdgeInsets.only(top: 20.w, left: 35.w),
                    child: Row(
                      children: [
                        Text(
                          '요금현황',
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
                              text: '300',
                              style: TextStyle(
                                fontSize: 120.w,
                                color: Colors.blue,
                                letterSpacing: 5.w,
                                fontFamily: 'applesdneob',
                              ),
                            ),
                            TextSpan(
                              text: ' kWh',
                              style: TextStyle(
                                  fontSize: 70.w,
                                  color: Colors.black,
                                  letterSpacing: 1.w,
                                  fontFamily: 'applesdneob'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]))));
  }
}
