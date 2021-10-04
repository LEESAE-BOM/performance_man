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
                color: Colors.indigo,
                height: 50,
                child: Text('이번달 전력 사용량\n123,456kWh',
                  style: TextStyle(color: Colors.black54, fontSize: 20),)
            ),
            Monthly_Figures_Widget(),
            Energy_Fee_Widget(),
            Hourly_Figures_Widget(),
          ],
        )
    );
  }
}
