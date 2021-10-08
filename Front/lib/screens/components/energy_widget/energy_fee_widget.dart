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
        width: 540.w,
        height: 200,
        child:GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => energy_fee()));
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                //margin: EdgeInsets.all(30),
                child: Column(
                    children: <Widget>[
                      Container(
                        //height: 50,
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                        child: Row(
                          children: [
                            Text(
                              '요금현황',
                              style: TextStyle(color: Colors.black54, fontSize: 15),
                            ),
                            SizedBox(width:5),
                            Image.asset(
                              'image/safe.png',
                              width: 10,
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Text.rich(
                        TextSpan(// default text style
                          children: <TextSpan>[
                            TextSpan(text:  '300',
                              style:TextStyle(
                                fontSize:  80.sp,
                                color: Color.fromRGBO(43, 63, 107, 1),
                                fontFamily: 'applesdneob',
                              ),),
                            TextSpan(text: 'kWh',
                              style:TextStyle(
                                fontSize: 15.sp,
                                color:  Colors.black87,
                                fontFamily: 'applesdneob',),
                            ),
                          ],
                        ),
                      ),
                    ]


                )
            )
        )
    );
  }
}
