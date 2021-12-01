import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/sales.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:flutter_app/screens/management/management_screen.dart';

class Sales_Widget extends StatefulWidget {
  @override
  _Sales_Widget createState() => _Sales_Widget();
}

class _Sales_Widget extends State<Sales_Widget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: conn.sendQuery(
            'SELECT Money * 1000 as Money FROM Money WHERE Category = \'SALES\' ORDER BY RecordedDate DESC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            if (result.length > 0) {
              int money = double.parse(result[0]['Money']).round();
              if (money > 19000000000)
                state[5] = 'safe';
              else if (money > 17000000000) {
                state[5] = 'warning';
              } else {
                state[5] = 'danger';
              }
              return BoxWidget('매출금액', state[5], 'wide').make(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => sales()));
                  },
                  dbRelatedContentBuilder: Text.rich(detailPageTheme.makeHeaderText(
                      '이번달 매출금액은\n[${detailPageTheme.money.format(money)}]원입니다.')));
            } else {
              state[5] = 'none';
              return BoxWidget('매출금액', state[5], 'wide').make(
                  onTap: () {},
                  dbRelatedContentBuilder:
                      Text.rich(detailPageTheme.makeHeaderText('데이터가 없습니다.')));
            }
          } else {
            return Text.rich(TextSpan(text: '불러오는 중'));
          }
        });
  }
}
