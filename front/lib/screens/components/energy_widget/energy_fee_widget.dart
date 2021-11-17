import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/energy_fee.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/box_widget.dart';

//작은 위젯
class Energy_Fee_Widget extends StatefulWidget {
  @override
  _Energy_Fee_Widget createState() => _Energy_Fee_Widget();
}

class _Energy_Fee_Widget extends State<Energy_Fee_Widget> {
  @override
  Widget build(BuildContext context) {
    return BoxWidget('요금 현황', 'safe', 'wide').make(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => energy_fee()));
        },
        dbRelatedContentBuilder: FutureBuilder(
            future: conn.sendQuery(
                'SELECT MoneyDate, Money FROM Money WHERE MoneyCategory=\'EGFEE\' ORDER BY MoneyDate DESC;'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var result = snapshot.data as List<Map<String, dynamic>>;
                var thisMonthPrice = double.parse(result[0]['Money']);
                var previousMonthPrice = double.parse(result[1]['Money']);

                return Text.rich(TextSpan(children: [
                  detailPageTheme.makeHeaderText(
                      '이번 달 전기요금 현황은\n[${detailPageTheme.money.format(thisMonthPrice)}원]'),
                ]));
              } else {
                return Text.rich(TextSpan(text: '불러오는 중'));
              }
            }));
  }
}
