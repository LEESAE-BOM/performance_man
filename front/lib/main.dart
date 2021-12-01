import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState != ConnectionState.done) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: Splash());
          }
          else {
            return ScreenUtilInit(
                designSize: Size(1080, 1920),
                builder: () => MaterialApp(
                    title: 'default_main',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        backgroundColor: Color.fromRGBO(43, 63, 107, 1)),
                    home: login_flow()));
          }
        });
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: Color(0x2b3f6b).withOpacity(1.0),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[
                lightMode
                    ? Image.asset('image/logo_white.png')
                    : Image.asset('image/logo_white.png'),
                Text('측정하지 않으면 개선할 수 없다', style:TextStyle(
                    fontSize:15, color:Colors.white)
                )
              ]
          )
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}
