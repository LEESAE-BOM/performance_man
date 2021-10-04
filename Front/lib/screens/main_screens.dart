import './energy/energy_screen.dart'; //경로 수정
import './management/management_screen.dart'; //경로 수정
import './factory/factory_screen.dart'; //경로 수정
import './components/menu_drawer.dart'; //경로 수정
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainScreens extends StatefulWidget{
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens>{

  int _selectedIndex=0;

  @override
  Widget build(BuildContext context){

    return Scaffold(

      endDrawer: MenuDrawer(),

      appBar: AppBar(
        title: Text('FLOW'),
        centerTitle: true,
        elevation: 0.0,
      ),

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
        currentIndex: _selectedIndex,
        onTap:(index){
          setState((){
            _selectedIndex=index;
          });
        },

        items:[
          const BottomNavigationBarItem(
            label: '경영', icon:Icon(CupertinoIcons.home)),
          const BottomNavigationBarItem(
              label: '공장', icon:Icon(CupertinoIcons.home)),
          const BottomNavigationBarItem(
              label: '에너지', icon:Icon(CupertinoIcons.home)),
        ],
      ),
    );
  }
}