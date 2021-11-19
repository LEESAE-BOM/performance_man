import 'package:flutter/material.dart';
import 'package:flutter_app/mysql_connect.dart';
import './screens/main_screens.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  void showToast() {
    Fluttertoast.showToast(
        msg: '아이디와 비밀번호를 확인해주세요.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromRGBO(149, 186, 234, 1),
        textColor: Colors.white
    );
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
          // for Debug
          List<dynamic> result = await conn.sendQuery('SELECT * FROM USERS WHERE ID = \'flow\' AND PASSWORD = \'1234\';');
          //List<dynamic> result = await conn.sendQuery('SELECT * FROM USERS WHERE ID = \'${_emailTextController.text}\' AND PASSWORD = \'${_passwordTextController.text}\';');
          if(result.length == 1){
            /*
              account info
              ID: flow
              password: 1234
             */
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreens()));
            _emailTextController.text = '';
            _passwordTextController.text = '';
          }
          else{
            showToast();
          }
        },
        child: Text("LOGIN",
            textAlign: TextAlign.center,
            style:  TextStyle(fontSize: 25, fontFamily: 'applesdneom',
                color: Colors.white)
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset : true,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  SizedBox(
                    width: 250.0,
                    height: 200.0,
                    child: Image.asset('image/logo_color.png'),
                  ),
                  SizedBox(height: 20.0),
                  emailField,
                  SizedBox(height: 8.0),
                  passwordField,
                  SizedBox(height: 15.0),
                  loginButon,
                  SizedBox(height: 15.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
