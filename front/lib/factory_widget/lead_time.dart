import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '.././screens/factory/factory_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class lead_time extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _lead_time();
}

class _lead_time extends State<lead_time> {
  late List<Chart_Data> chartData;
  late TooltipBehavior _toolTipBehavior;

  void initState() {
    chartData = getChartData();
    _toolTipBehavior = TooltipBehavior();
    super.initState();
  }

  List<Chart_Data>  getChartData(){
    final List<Chart_Data>  getChartData = [
      Chart_Data('LeadTIME', 2,3,4),
    ];
    return getChartData;
  }

  @override
  Widget build(BuildContext context) {
    //TextStyle ts = TextStyle(color:Colors.red);

    Widget textSection = Padding(
            padding: EdgeInsets.fromLTRB(20.sp, 100.sp, 20.sp, 150.sp),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(// default text style
                    children: <TextSpan>[
                      TextSpan(text: '개발 Lead-time',
                        style:TextStyle(
                          fontSize:120.sp,
                          color: Colors.blue,
                          letterSpacing: 5.0,
                            fontFamily: 'applesdneoeb'
                        ),),
                      TextSpan(text: ' 은\n',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 5.0,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'applesdneoeb'
                        ),
                      ),
                      TextSpan(text: '총 ',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 5.0,
                            //  fontWeight: FontWeight.bold,
                            fontFamily: 'applesdneoeb'),),
                      TextSpan(text: ' 9일 ',
                        style:TextStyle(
                            fontSize:120.sp,
                            color: Colors.blue,
                            letterSpacing: 5.0,
                            fontFamily: 'applesdneoeb'),),
                      TextSpan(text: ' 소요되었어요\n',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 5.0,
                            fontFamily: 'applesdneoeb'),),
                      TextSpan(text: '예정일까지 3일 남았어요.',
                        style:TextStyle(
                            fontSize: 60.sp,
                            color: Colors.black,
                            letterSpacing: 5.0,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'applesdneoeb'),),
                    ],
                  ),
                ),
              ],
            )
        );

    Widget daySection =Padding(
        padding: EdgeInsets.all(50.sp),
        child: Column(
            children:  <Widget>[
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '9 ', style:TextStyle(
                        fontSize: 200.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize: 90.sp,
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

    Widget chartSection=
    Container(
        width: 1000.w,
        height: 300,
        child:Center(
            child: Container(
                child: SfCartesianChart(
                  tooltipBehavior: _toolTipBehavior,
                  legend: Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                  ),
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
                    StackedBar100Series<Chart_Data, String>(
                      name:'제품 소요시간',
                      dataSource: chartData,
                      xValueMapper: (Chart_Data sales, _) => sales.x,
                      yValueMapper: (Chart_Data sales, _) => sales.y1,

                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(
                            fontSize: 100.sp,
                            color: Colors.white,
                            fontFamily: 'applesdneob',),
                          labelAlignment: ChartDataLabelAlignment.middle
                      ),

                    ),
                    StackedBar100Series<Chart_Data, String>(
                        name:'누적 소요시간',
                        dataSource: chartData,
                        xValueMapper: (Chart_Data sales, _) => sales.x,
                        yValueMapper: (Chart_Data sales, _) => sales.y2,
                        dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: TextStyle(
                          fontSize: 100.sp,
                          color: Colors.white,
                          fontFamily: 'applesdneob',)
                            ,labelAlignment: ChartDataLabelAlignment.middle
                        )
                    ),
                    StackedBar100Series<Chart_Data, String>(
                      name:'납기 소요시간',
                      dataSource: chartData,
                      xValueMapper: (Chart_Data sales, _) => sales.x,
                      yValueMapper: (Chart_Data sales, _) => sales.y3,
                      dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: TextStyle(
                        fontSize: 100.sp,
                        color: Colors.white,
                        fontFamily: 'applesdneob',),
                          labelAlignment: ChartDataLabelAlignment.middle
                      ),
                    )
                  ],
                  plotAreaBorderWidth: 0,//chart 테두리 삭제
                  borderWidth: 30,
                )
            )
        )
    );


    Widget daySection3 =Padding(
        padding: EdgeInsets.fromLTRB(20.sp, 100.sp, 20.sp,100.sp),
        child: Column(
            children:  <Widget>[
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '예정일 ', style:TextStyle(
                        fontSize: 100.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),

                    TextSpan(text: 'D-3',
                      style:TextStyle(
                          fontSize: 100.sp,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text.rich(
                TextSpan(// default text style
                  children: <TextSpan>[
                    TextSpan(text: '제품 소요시간', style:TextStyle(
                        fontSize:90.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),
                    TextSpan(text: ' 3 ',
                      style:TextStyle(
                          fontSize: 90.sp,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize:90.sp,
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
                        fontSize: 90.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),
                    TextSpan(text: ' 2 ',
                      style:TextStyle(
                          fontSize: 90.sp,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize:90.sp,
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
                        fontSize: 90.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'applesdneol'),),
                    TextSpan(text: ' 3 ',
                      style:TextStyle(
                          fontSize:90.sp,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'applesdneob'),),
                    TextSpan(text: 'Days',
                      style:TextStyle(
                          fontSize:90.sp,
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
            title: Text('개발 Lead-time',
              style: TextStyle(fontSize: 67.sp,
                  color: Colors.white,
                  letterSpacing: 1.0,
                  fontFamily: 'applesdneom'),),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(43, 63, 107, 1),
            leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.white,), onPressed: (){
              Navigator.of(context).pop();
            }),
          ),
          body: SafeArea(
              child:Center(
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
                ),
              )
          ),
        )
    );
  }
}

class Chart_Data {
  Chart_Data(this.x, this.y1,this.y2,this.y3);
  final String x;
  final double y1; final double y2; final double y3;
}
