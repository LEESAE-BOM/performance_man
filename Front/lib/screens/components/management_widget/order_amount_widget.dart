import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/order_amount.dart';

class Order_Amount_Widget extends StatefulWidget {
  @override
  _Order_Amount_Widget createState() => _Order_Amount_Widget();
}

class _Order_Amount_Widget extends State<Order_Amount_Widget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>order_amount()));
    },
    child: Container(
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
                      '수주금액',
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
            ])));
  }
}
