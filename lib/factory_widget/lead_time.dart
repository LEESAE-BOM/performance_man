import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../tabbar/factory.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class lead_time extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _lead_time();
}

class _lead_time extends State<lead_time> {
  late List<ChartData> chartData;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    chartData = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<ChartData>  getChartData(){
    final List<ChartData>  getChartData = [
      ChartData('LeadTIME', 2,3,4),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    //TextStyle ts = TextStyle(color:Colors.red);

    Widget textSection = Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Text.rich(
              TextSpan(// default text style
                children: <TextSpan>[
                  TextSpan(text: 'Lead-time',
                    style:TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob',
                    ),),
                  TextSpan(text: ' 은\n',
                    style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '총 ',
                    style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        //  fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: ' 9일 ',
                    style:TextStyle(
                        fontSize: 45.0,
                        color: Colors.blue,
                        letterSpacing: 5.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: ' 소요되었어요\n',
                    style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                  TextSpan(text: '예정일까지 3일 남았어요.',
                    style:TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        letterSpacing: 5.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                ],
              ),
            ),
          ],
        )
    );

    Widget daySection =Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            children:  <Widget>[
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '9 ', style:TextStyle(
                        fontSize: 65.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
            ]
        )

    );

    Widget chartSection= Padding(
        padding: EdgeInsets.all(32),
        child:Center(
            child: Container(
                child: SfCartesianChart(
                  legend: Legend(
                      isVisible: true,
                      // Legend will be placed at the left
                      position: LegendPosition.bottom)
                  ,
                  primaryXAxis: CategoryAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      isVisible: false
                  ),
                  //backgroundColor: Colors.white,
                  primaryYAxis: NumericAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    isVisible: false,
                  ),
                  series: <ChartSeries>[
                    StackedBar100Series<ChartData, String>(
                        name:'제품 소요시간',
                        dataSource: chartData,
                        xValueMapper: (ChartData sales, _) => sales.x,
                        yValueMapper: (ChartData sales, _) => sales.y1,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontFamily: 'applesdneob',),
                          labelAlignment: ChartDataLabelAlignment.middle
                        ),

                    ),
                    StackedBar100Series<ChartData, String>(
                        name:'누적 소요시간',
                        dataSource: chartData,
                        xValueMapper: (ChartData sales, _) => sales.x,
                        yValueMapper: (ChartData sales, _) => sales.y2,
                        dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontFamily: 'applesdneob',)
                        ,labelAlignment: ChartDataLabelAlignment.middle
                        )
                    ),
                    StackedBar100Series<ChartData, String>(
                        name:'납기 소요시간',
                        dataSource: chartData,
                        xValueMapper: (ChartData sales, _) => sales.x,
                        yValueMapper: (ChartData sales, _) => sales.y3,
                        dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontFamily: 'applesdneob',),
                            labelAlignment: ChartDataLabelAlignment.middle
                        )
                    )
                  ],

                )
            )
        )
    );

    Widget daySection2 =
    ListView(
      scrollDirection: Axis.horizontal,
      // padding: EdgeInsets.all(20),
      children:  <Widget>[
        //SizedBox(width: 15.0),
        Text.rich(
          TextSpan(// default text style
            children: <TextSpan>[
              TextSpan(text: '9/1 ', style:TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontFamily: 'applesdneob'),),
              TextSpan(text: '9/1',
                style:TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: 'applesdneob'),),
              TextSpan(text: '9/1',
                style:TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: 'applesdneob'),),
              TextSpan(text: '9/1',
                style:TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: 'applesdneob'),),
            ],
          ),
        ),
        //     SizedBox(width: 15.0)
      ],
    );

    Widget daySection3 =Padding(
        padding: EdgeInsets.all(45),
        child: Column(
            children:  <Widget>[
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '예정일 ', style:TextStyle(
                        fontSize: 35.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),

                    TextSpan(text: 'D-3',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '제품 소요시간', style:TextStyle(
                        fontSize: 35.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),
                    TextSpan(text: ' 3 ',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '누적 소요시간', style:TextStyle(
                        fontSize: 35.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),
                    TextSpan(text: ' 2 ',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '납기 소요시간', style:TextStyle(
                        fontSize: 35.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),
                    TextSpan(text: ' 3 ',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                  ],
                ),
              )
            ]
        )

    );

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text('노동 생산율',
            style: TextStyle(fontSize: 25, fontFamily: 'applesdneom'),),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
          leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
            factory_main();
          }),
        ),
        body: SafeArea(
          //child: Padding(padding: const EdgeInsets.all(36.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textSection,
                daySection,
                chartSection,
                // daySection2, //error fixing
                SizedBox(height: 23,),
                daySection3
              ],

            )
          // )
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1,this.y2,this.y3);
  final String x;
  final double y1; final double y2; final double y3;
}