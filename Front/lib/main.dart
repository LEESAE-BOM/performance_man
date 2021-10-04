import 'package:flutter/material.dart';
import './theme.dart';
import './screens/main_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'default_main',
      debugShowCheckedModeBanner: false,
      unselectedWidgetColor: Colors.black26,
      home:MainScreens(),
      theme: theme(),
    );
  }
}
