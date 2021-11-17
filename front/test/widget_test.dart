// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import '../lib/mysql_connect.dart' as sql;

void main() {
  runApp(TestAPP());
}


class TestAPP extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Map<String, String> selectOptions = {
    'ID가 flow인 사람': 'SELECT * FROM USERS WHERE ID=\'flow\';',
    '전체': 'SELECT * FROM USERS;',
  };

  var dropDownValue = '전체';

  Widget build(BuildContext context){
    var connector = new sql.MySQLConnector();

    return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 50),
              child: Text(
                'Account Info Table',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            FutureBuilder(
              future: connector.sendQuery(selectOptions[dropDownValue]),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var table = sql.ResultSet(snapshot.data, ['아이디', '비번']);
                  TableRow header = table.getTableHeaderWidget();
                  return Table(
                      border: TableBorder(horizontalInside: BorderSide(width: 1, color: Colors.black38, style: BorderStyle.solid)),
                      children: <TableRow>[
                        header,
                      ] + table.getTableRowWidgets()
                  );
                }else{
                  return Text('...');
                }
              },
            ),
            DropdownButton(
                value: dropDownValue,
                items: <DropdownMenuItem<String>>[
                  for(var val in selectOptions.keys)
                    DropdownMenuItem(value: val, child: Text(val))
                ],
                onChanged: (String? val){
                  setState((){
                    dropDownValue = val!;
                    print(dropDownValue);
                  });
                },
            )
          ]
        )
    );
  }
}
