import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/cash_reserve.dart';
import 'package:flutter_app/management_widget/contracted_price.dart';
import 'package:flutter_app/management_widget/expected_profit.dart';
import 'package:flutter_app/management_widget/labor_ratio.dart';
import 'package:flutter_app/management_widget/order_amount.dart';
import 'package:flutter_app/management_widget/outsourcing_ratio.dart';
import 'package:flutter_app/management_widget/sales.dart';

class MenuDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      width: 200,
      height: double.infinity,
      color: Colors.white,
      child: Menu_Drawer(),
    );
  }
}

class Menu_Drawer extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _Menu_Drawer();
}

class _Menu_Drawer extends State<Menu_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('매출금액'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>sales()));
              },
            ),
            ListTile(
              title: Text('수주금액'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>order_amount()));
              },
            ),
            ListTile(
              title: Text('현금보유액'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cash_reserve()));
              },
            ),
            ListTile(
              title: Text('계약금액'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>contracted_price()));
              },
            ),
            ListTile(
              title: Text('인건비율'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>labor_ratio()));
              },
            ),
            ListTile(
              title: Text('외주비율'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>outsourcing_ratio()));
              },
            ),
            ListTile(
              title: Text('추정수익률'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>expected_profit()));
              },
            )
          ],
        ),
      ),
    );
  }
}
