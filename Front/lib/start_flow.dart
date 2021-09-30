import 'dart:async';
import 'main.dart';
import 'package:flutter/material.dart';

class start_flow extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _start_flowState createState() => _start_flowState();
}

class _start_flowState extends State<start_flow> {

  Future<Timer> loadData() async{
    return Timer(Duration(seconds: 5),onDoneLoading);
  }

  onDoneLoading() async{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyApp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(43, 63, 107,1),
        body: Container(
            child: Center(
                child: Image.asset('image/logo.png',
                width: 250.0,height: 200.0,
                ),
            )
        )
    );
  }
}
