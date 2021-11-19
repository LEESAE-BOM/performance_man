import 'package:flutter/material.dart';
import 'package:flutter_app/management_widget/cash_reserve.dart';
import 'package:flutter_app/management_widget/contracted_price.dart';
import 'package:flutter_app/management_widget/expected_profit.dart';
import 'package:flutter_app/management_widget/labor_ratio.dart';
import 'package:flutter_app/management_widget/outsourcing_ratio.dart';
import 'package:flutter_app/management_widget/sales.dart';
import 'package:flutter_app/factory_widget/capacity_ratio.dart';
import 'package:flutter_app/factory_widget/development_completion_rate.dart';
import 'package:flutter_app/factory_widget/labor_production_rate.dart';
import 'package:flutter_app/factory_widget/lead_time.dart';
import 'package:flutter_app/energy_widget/monthly_figures.dart';
import 'package:flutter_app/energy_widget/hourly_figures.dart';
import 'package:flutter_app/energy_widget/energy_fee.dart';
import 'package:flutter/cupertino.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      color: Colors.white,
      child: Menu_Drawer(),
    );
  }
}

class Menu_Drawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Menu_Drawer();
}

class _Menu_Drawer extends State<Menu_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('menu'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107, 1),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              ExpansionTile(
                leading: Icon(CupertinoIcons.chart_bar_square),
                title: Text('경영'),
                children: <Widget>[
                  ListTile(
                    title: Text('매출금액'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => sales()));
                    },
                  ),
                  ListTile(
                    title: Text('현금보유액'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => cash_reserve()));
                    },
                  ),
                  ListTile(
                    title: Text('계약금액'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => contracted_price()));
                    },
                  ),
                  ListTile(
                    title: Text('인건비율'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => labor_ratio()));
                    },
                  ),
                  ListTile(
                    title: Text('외주비율'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => outsourcing_ratio()));
                    },
                  ),
                  ListTile(
                    title: Text('예상수익'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => expected_profit()));
                    },
                  )
                ],
              ),
              ExpansionTile(
                leading: Icon(CupertinoIcons.building_2_fill),
                title: Text('공장'),
                children: <Widget>[
                  ListTile(
                    title: Text('개발완료율'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => development_completion_rate()));
                    },
                  ),
                  ListTile(
                    title: Text('설비가동율'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => capacity_ratio()));
                    },
                  ),

                  ListTile(
                    title: Text('제조 Lead-time'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => lead_time()));
                    },
                  ),
                  ListTile(
                    title: Text('노동생산성'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => labor_production_rate()));
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(CupertinoIcons.bolt_fill),
                title: Text('에너지'),
                children: <Widget>[
                  ListTile(
                    title: Text('월별 에너지'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => monthly_figures()));
                    },
                  ),

                  ListTile(
                    title: Text('요금현황'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => energy_fee()));
                    },
                  ),
                  ListTile(
                    title: Text('시간별 에너지'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => hourly_figures()));
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
