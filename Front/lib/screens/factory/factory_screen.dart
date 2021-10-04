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
                color: Colors.indigo,
                height: 50,
                child: Text('개발완료 105% 달성',
                  style: TextStyle(color: Colors.black54, fontSize: 20),)
            ),
            Developmentcompletion_Rate_Widget(),
            Capacity_Ratio_Widget(),
            Lead_Time_Widget(),
            Labor_Production_Rate_Widget(),
          ],
        )
    );
  }
}
