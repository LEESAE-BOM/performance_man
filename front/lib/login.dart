import 'package:flutter/material.dart';
import 'package:flutter_app/mysql_connect.dart';
import './screens/main_screens.dart';
import 'package:dio/dio.dart';

class login_flow extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _login_flow createState() => _login_flow();
}

class _login_flow extends State<login_flow> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  var _isChecked =false;
  //TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  void dispose(){
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style:  TextStyle(fontSize: 17, fontFamily: 'applesdneol',color: Colors.black38),
      controller: _emailTextController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintText: "아이디",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),

    );

    final passwordField = TextField(
      obscureText: true,
      style:  TextStyle(fontSize: 17, fontFamily: 'applesdneol',color: Colors.black38),
      controller: _passwordTextController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintText: "비밀번호",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color.fromRGBO(43, 63, 107, 1),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        onPressed: () async {
          List<dynamic> result = await conn.sendQuery('SELECT * FROM USERS WHERE ID = \'${_emailTextController.text}\' AND PASSWORD = \'${_passwordTextController.text}\';');
          if(result.length == 1){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreens()));
          }
        },
        child: Text("LOGIN",
            textAlign: TextAlign.center,
            style:  TextStyle(fontSize: 25, fontFamily: 'applesdneom',
                color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 85.0,
                  child:Text('로그인',style: TextStyle(fontSize: 35, fontFamily: 'applesdneom',color: Colors.black),
                  )
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 8.0),
                passwordField,
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    SizedBox(height:5.0,width:5.0),
                    Container(
                      alignment: Alignment.center,
                      width: 14,
                      height: 14,
                      color: Colors.black26,
                      child: Checkbox(value: _isChecked,
                          //checkColor:Colors.orange,
                          //hoverColor:Colors.red,
                          activeColor: Colors.black38 ,
                          onChanged: (value){setState(() {_isChecked = value!;});})
                    ),
                    SizedBox(width:10.0),
                    Text('로그인 상태 유지',style: TextStyle(fontSize: 12, fontFamily: 'applesdneob',color: Colors.black54)),
                  ],
                ),
                SizedBox(height: 8.0),
                loginButon,
                SizedBox(height: 15.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
