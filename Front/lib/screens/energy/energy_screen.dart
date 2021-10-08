import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/energy_widget/Hourly_Figures_Widget.dart';
import '.././components/energy_widget/energy_fee_widget.dart';
import '.././components/energy_widget/monthly_figures_widget.dart';

class Energy_Screen extends StatelessWidget {
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
                  text: '이번 달 전력 사용량\n',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'applesdnoeb',
                  ),
                ),
                TextSpan(
                  text: '13,588',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 5,
                      fontFamily: 'applesdneob'),
                ),
                TextSpan(
                  text: ' kWh',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontFamily: 'applesdneob'),
                ),
              ]),
            )),
        Monthly_Figures_Widget(),
        Row(
          children: [
            Energy_Fee_Widget(),
            Hourly_Figures_Widget(),
          ],
        ),
      ],
    ));
  }
}
