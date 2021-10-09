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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => sales()));
        },
        child: Container(
            //height: 160,
            //width: MediaQuery.of(context).size.width ,
            width: 1060.w,
            height: 200,
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
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    child: Row(
                      children: [
                        Text(
                          '매출금액',
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
                  Center(

                      child: Text(
                        '이번달 매출금액은\n123,456,789원입니다.',
                        style: TextStyle(color: Colors.black54,
                        ),
                      )
                  )
                ]))
    );
  }
}
