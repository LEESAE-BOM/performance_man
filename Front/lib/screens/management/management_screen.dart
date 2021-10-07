import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '.././components/management_widget/sales_widget.dart';
import '.././components/management_widget/order_amount_widget.dart.';
import '.././components/management_widget/cash_reserve_widget.dart';
import '.././components/management_widget/contracted_price_widget.dart';
import '.././components/management_widget/expected_profit_widget.dart';
import '.././components/management_widget/labor_ratio_widget.dart';
import '.././components/management_widget/outsourcing_ratio_widget.dart';

class Management_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
                color: Color.fromRGBO(43, 63, 107, 1),
                height: 50,
                child: Text('목표대비 총 105% 달성',
                  style: TextStyle(color: Colors.black54, fontSize: 20),)
            ),
            Sales_Widget(),
            Row (children: [Order_Amount_Widget(),
            Cash_Reserve_Widget(),],),
            Contracted_Price_Widget(),
        Row (children: [
          Labor_Ratio_Widget(),
            Outsourcing_Ratio_Widget(),],),
            Expected_Profit_Widget(),
          ],
        )
    );
  }
}
