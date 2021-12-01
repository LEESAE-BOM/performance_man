import './energy/energy_screen.dart'; //경로 수정
import './management/management_screen.dart'; //경로 수정
import './factory/factory_screen.dart'; //경로 수정
import './components/menu_drawer.dart'; //경로 수정
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/session_manager.dart';

class MainScreens extends StatefulWidget{
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens>{

  int _selectedIndex=0;
  @override
  void didUpdateWidget(Widget oldWidget) {
    detailPageTheme = DetailPageTheme();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children : [
          Management_Screen(),
          Factory_Screen(),
          Energy_Screen()
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.white,
        type: BottomNavigationBarType.fixed,
        //fixedColor: Color.fromRGBO(149, 186, 234, 1),
        currentIndex: _selectedIndex,
        onTap:(index){
          setState((){
            _selectedIndex=index;
          });
        },

        items:[
          const BottomNavigationBarItem(
              label: '경영', icon:Icon(CupertinoIcons.chart_bar_square)),
          const BottomNavigationBarItem(
              label: '공장', icon:Icon(CupertinoIcons.building_2_fill)),
          const BottomNavigationBarItem(
              label: '에너지', icon:Icon(CupertinoIcons.bolt_fill)),
        ],
      ),
    );
  }
}
