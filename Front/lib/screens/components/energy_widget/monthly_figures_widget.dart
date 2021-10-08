import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/energy_widget/monthly_figures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Monthly_Figures_Widget extends StatefulWidget {
  @override
  _Monthly_Figures_Widget createState() => _Monthly_Figures_Widget();
}

class _Monthly_Figures_Widget extends State<Monthly_Figures_Widget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000.w,
        height: 200,
        child:GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => monthly_figures()));
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                //margin: EdgeInsets.all(30),
                child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                        child: Row(
                          children: [
                            Text(
                              '월별 에너지',
                              style: TextStyle(color: Colors.black54, fontSize: 15),
                            ),
                            SizedBox(width:5),
                            Image.asset(
                              'image/safe.png',
                              width: 10,
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                      child:Row(
                          children:<Widget>[
                            Text.rich(
                            TextSpan(// default text style
                              children: <TextSpan>[
                                TextSpan(text:  '전월대비 ',
                                  style:TextStyle(
                                    fontSize:  15,
                                    color: Colors.black87,
                                    fontFamily: 'applesdneob',
                                  ),),
                                TextSpan(text:  '2000만큼',
                                  style:TextStyle(
                                    fontSize:  50,
                                    color: Color.fromRGBO(43, 63, 107, 1),
                                    fontFamily: 'applesdneob',
                                  ),),
                                TextSpan(text: ' 감소 ',
                                  style:TextStyle(
                                    fontSize: 15,
                                    color:  Colors.black87,
                                    fontFamily: 'applesdneob',),
                                ),
                              ],
                            ),
                          ),
                            Icon(CupertinoIcons.arrowtriangle_down_square_fill,
                            size:40,
                              color:Colors.blue
                            )
                          ]
                      )
                      )
                    ]
                )
            )
        )
    );
  }
}
