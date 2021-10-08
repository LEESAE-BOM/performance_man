import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/factory_widget/capacity_ratio_widget.dart';
import '.././components/factory_widget/developmentcompletion_rate_widget.dart';
import '.././components/factory_widget/labor_production_rate_widget.dart';
import '.././components/factory_widget/lead_time_widget.dart';

class Factory_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Color.fromRGBO(43, 63, 107, 1),
            ),
            alignment: Alignment.center,
            height: 180,
            child: //Text('목표대비 총 105% 달성', style: TextStyle(color: Colors.black54, fontSize: 20),)
                RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: '개발완료\n',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'applesdnoeb',
                  ),
                ),

                TextSpan(
                  text: '72%',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 5,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(
                  text: ' 달성',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontFamily: 'applesdneob'),
                ),
              ]),
            )),
        Developmentcompletion_Rate_Widget(),
        Row(
          children: [
            Capacity_Ratio_Widget(),
            Lead_Time_Widget(),
          ],
        ),
        Labor_Production_Rate_Widget(),
      ],
    ));
  }
}
