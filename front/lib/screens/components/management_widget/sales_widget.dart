import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/sales.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/box_widget.dart';

class Sales_Widget extends StatefulWidget {
  @override
  _Sales_Widget createState() => _Sales_Widget();
}

class _Sales_Widget extends State<Sales_Widget> {
  @override
  Widget build(BuildContext context) {
    return BoxWidget('매출금액', 'safe', 'wide').make(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => sales()));
        },
        dbRelatedContentBuilder: FutureBuilder(
            future: conn.sendQuery('SELECT Money * 1000 as Money FROM Money WHERE MoneyCategory = \'SALES\' ORDER BY MoneyDate DESC;'),
            builder: (context, snapshot){
              if(snapshot.hasData){
                var result = snapshot.data as List<Map<String, dynamic>>;
                int money = double.parse(result[0]['Money']).round();
                return Text.rich(detailPageTheme.makeHeaderText('이번달 매출금액은\n[${detailPageTheme.money.format(money)}]원입니다.'));
              }else{
                return Text.rich(TextSpan(text: '불러오는 중'));
              }
            }
        )
    );
  }
}
