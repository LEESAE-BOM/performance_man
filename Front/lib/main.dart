import 'package:flutter/material.dart';

import 'tabbar/management.dart';
import 'tabbar/factory.dart';
import 'tabbar/energy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLOW',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:
      MyHomePage(
      )

    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
    @override
    Widget build(BuildContext context){
      return Scaffold(
          appBar: AppBar(title:Text('FLOW'),),
          drawer:Drawer(
              child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.grey[850],
                      ),
                      title: Text('홈'),
                      onTap: () {
                        print('Home pressed');
                      },
                    )
                  ]
              ),
          ),
          body: TabBarView(
         children: <Widget>[management_main(),factory_main(),energy_main(),],
          controller: controller,
        ),
          bottomNavigationBar: TabBar(
            tabs: <Tab>[
            Tab(text:'경영') ,
            Tab(text:'공장'),
            Tab(text:'에너지')
          ],labelColor: Colors.black, controller: controller,
          )
      );
  }

    void dispose(){
      controller!.dispose();
      super.dispose();
  }

}


