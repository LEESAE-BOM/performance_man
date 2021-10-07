import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import './theme.dart';
import './screens/main_screens.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: const Color.fromRGBO(43, 63, 107, 1),
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
      mainImage: Image.asset(
        'image/logo.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageBackground: Container(
        child: login_flow(),
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'default_main',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(43, 63, 107, 1)
        ),
        home: Builder(
          builder: (context) => IntroViewsFlutter(
            pages,
            showNextButton: true,
            showBackButton: true,
            onTapDoneButton: () {
              // Use Navigator.pushReplacement if you want to dispose the latest route
              // so the user will not be able to slide back to the Intro Views.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MainScreens()),
              );
            },
            pageButtonTextStyles: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ));
  }
}
