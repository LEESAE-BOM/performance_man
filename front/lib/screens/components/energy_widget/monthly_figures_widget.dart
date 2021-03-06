import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/monthly_figures.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/box_widget.dart';
import 'package:flutter_app/screens/energy/energy_screen.dart';

class Monthly_Figures_Widget extends StatefulWidget {
  @override
  _Monthly_Figures_Widget createState() => _Monthly_Figures_Widget();
}

class _Monthly_Figures_Widget extends State<Monthly_Figures_Widget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: conn.sendQuery(
            'SELECT UseDate, Amount * 1000 as Amount FROM EnergyUse ORDER BY UseDate DESC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            if (result.length > 0) {
              var thisMonthPrice = double.parse(result[0]['Amount']);
              var previousMonthPrice = double.parse(result[1]['Amount']);

              int diff = thisMonthPrice.round() - previousMonthPrice.round();

              if (thisMonthPrice < 50000)
                state[2] = 'safe';
              else if (thisMonthPrice < 70000) {
                state[2] = 'warning';
              } else {
                state[2] = 'danger';
              }

              return BoxWidget('월별 에너지', state[2], 'narrow').make(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => monthly_figures()));
                  },
                  dbRelatedContentBuilder: Text.rich(TextSpan(children: [
                    detailPageTheme.makeHeaderText('전월 대비\n'),
                    if (diff < 0)
                      detailPageTheme.makeHeaderText(
                          '[${detailPageTheme.money.format(diff * -1)}] 감소'),
                    if (diff >= 0)
                      detailPageTheme.makeHeaderText(
                          '[${detailPageTheme.money.format(diff)}] 증가')
                  ])));
            } else {
              state[2] = 'none';
              return BoxWidget('월별 에너지', state[2], 'narrow').make(
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
