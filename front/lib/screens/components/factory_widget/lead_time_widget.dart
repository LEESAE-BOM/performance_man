import 'package:flutter/material.dart';
import 'package:flutter_app/factory_widget/lead_time.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/mysql_connect.dart';
import 'package:flutter_app/box_widget.dart';

//작은 위젯
class Lead_Time_Widget extends StatefulWidget {
  @override
  _Lead_Time_Widget createState() => _Lead_Time_Widget();
}

class _Lead_Time_Widget extends State<Lead_Time_Widget> {
  var state = 'danger';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: conn.sendQuery(
            'SELECT DueDate as dueDate FROM LeadTime ORDER BY DueDate ASC;'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data as List<Map<String, dynamic>>;
            var today = DateTime.now();
            int dif = int.parse(today
                .difference(DateTime.parse(result[0]['dueDate']))
                .inDays
                .toString());
            dif *= -1;

            if (dif < 10)
              state = 'danger';
            else if (dif < 20)
              state = 'warning';
            else
              state = 'safe';

            return BoxWidget('제조 Lead-time', state, 'narrow').make(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => lead_time()));
                },
                dbRelatedContentBuilder: FutureBuilder(
                    future: conn.sendQuery(
                        'SELECT DueDate as dueDate FROM LeadTime ORDER BY DueDate ASC;'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text.rich(
                            detailPageTheme.makeHeaderText('[${dif}]days]'));
                      } else {
                        return Text.rich(TextSpan(text: '불러오는 중'));
                      }
                    }));
          } else {
            return Text.rich(TextSpan(text: '불러오는 중'));
          }
        });
  }
}
