import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';

class MySQLConnector{
  String webServerURL = 'http://teamflow.dothome.co.kr/doQuery.php';

  MySQLConnector([webServerURL]);

  Future<List<Map<String, dynamic>>> sendQuery(String? query) async {
    var formedQuery = FormData.fromMap({'qry': query});
    var jsonData = await Dio().post(webServerURL, data: formedQuery);
    return [for(var row in jsonData.data.sublist(1)) Map<String, dynamic>.from(row)];
  }
}

class MySQLTable{
  String tableName = '';
  List<Map<String, dynamic>> rows = [];
  List<String> userDefinedColumnNames = [];

  MySQLTable(data, [userDefinedColumnNames]){
    this.rows = data;
    if(userDefinedColumnNames != null)
      this.userDefinedColumnNames = userDefinedColumnNames;
  }

  TableRow getTableHeader(){
    return TableRow(
      children: <Widget>[
        for(String column in userDefinedColumnNames)
          TableCell(
              child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  color: detailPageTheme.tableHeaderBGColor,
                  child: Center(child: Text(column, style: detailPageTheme.tableHeaderStyle))
              )
          )
      ]
    );
  }

  List<TableRow> getTableRows(){
    return [
      for(Map<String, dynamic> row in rows)
        TableRow(
          children: <Widget>[
              for(var data in row.values.toList())
                TableCell(
                    child: Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        color: detailPageTheme.tableRowBGColor,
                        child: Center(child: Text(data, style: detailPageTheme.tableRowStyle))
                    )
                )
          ]
        )
    ];
  }
}

MySQLConnector conn = MySQLConnector();