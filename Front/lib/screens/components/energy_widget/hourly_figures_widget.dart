import 'package:flutter/material.dart';

class Hourly_Figures_Widget extends StatefulWidget {
  @override
  _Hourly_Figures_Widget createState() => _Hourly_Figures_Widget();
}

class _Hourly_Figures_Widget extends State<Hourly_Figures_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 180,
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
                height: 50,
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                child: Row(
                  children: [
                    Text(
                      '피크예상시간',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    Image.asset(
                      'image/safe.png',
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  '내용',
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
              )
            ]));
  }
}