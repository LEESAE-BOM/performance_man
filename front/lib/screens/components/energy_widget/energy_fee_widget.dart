import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/energy_fee.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:flutter_app/screens/energy/energy_screen.dart';

//작은 위젯
class Energy_Fee_Widget extends StatefulWidget {
  @override
  _Energy_Fee_Widget createState() => _Energy_Fee_Widget();
}

class _Energy_Fee_Widget extends State<Energy_Fee_Widget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: conn.sendQuery(
            'SELECT RecordedDate, Money FROM Money WHERE Category=\'EGFEE\' ORDER BY RecordedDate DESC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            var thisMonthPrice = double.parse(result[0]['Money']);

            if (thisMonthPrice < 10000000)
              state[0] = 'safe';
            else if (thisMonthPrice < 20000000) {
              state[0] = 'warning';
            } else {
              state[0] = 'danger';
            }

            return BoxWidget('요금 현황', state[0], 'wide').make(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => energy_fee()));
                },
                dbRelatedContentBuilder: Text.rich(TextSpan(children: [
                  detailPageTheme.makeHeaderText(
                      '이번 달 전기요금 현황은\n[${detailPageTheme.money.format(thisMonthPrice)}원]'),
                ])));
          } else {
            return Text.rich(TextSpan(text: '불러오는 중'));
          }
        });
  }
}
