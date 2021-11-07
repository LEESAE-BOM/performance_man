import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/contracted_price.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/box_widget.dart';

//큰 위젯
class Contracted_Price_Widget extends StatefulWidget {
  @override
  _Contracted_Price_Widget createState() => _Contracted_Price_Widget();
}

class _Contracted_Price_Widget extends State<Contracted_Price_Widget> {
  @override
  Widget build(BuildContext context) {
    return BoxWidget('계약금액', 'safe', 'wide').make(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => contracted_price()));
      },
      dbRelatedContentBuilder: FutureBuilder(
          future: conn.sendQuery('SELECT Price * 1000 as Money FROM Contract ORDER BY ContractDate DESC;'),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var result = snapshot.data as List<Map<String, dynamic>>;
              int money = double.parse(result[0]['Money']).round();
              
              return Text.rich(detailPageTheme.makeHeaderText('이번달 [계약금액]은\n[${detailPageTheme.money.format(money)}]원입니다.'));
            }else{
              return Text.rich(TextSpan(text: '불러오는 중'));
            }
          }
      )
    );
  }
}
