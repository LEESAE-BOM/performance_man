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

        onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>contracted_price()));
    },
    child:Container(
        //height: 180,
        //width:MediaQuery.of(context).size.width,
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
                //height: 50,
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                child: Row(
                  children: [
                    Text(
                      '계약금액',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    SizedBox(width:5),
                    Image.asset(
                      'image/warning.png',
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                  width: 1060.w,
                  height: 152,
                child: Text(
                  '이번달 계약금액은\n321,654,987원입니다.',
                  style: TextStyle(color: Colors.black54,
                  ),
              ))
            ])));
  }
}
