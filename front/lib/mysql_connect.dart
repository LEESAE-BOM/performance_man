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

  void insertSalesData({date, amount}){
    sendQuery('INSERT INTO Money (MoneyDate, Money, MoneyCategory) VALUES (\'$date\', $amount, \'SALES\');');
  }

  void insertCashData({date, amount}){
    sendQuery('INSERT INTO Money (MoneyDate, Money, MoneyCategory) VALUES (\'$date\', $amount, \'MONEY\');');
  }

  void insertDirectLaborCost({date, amount}){
    sendQuery('INSERT INTO Money (MoneyDate, Money, MoneyCategory) VALUES (\'$date\', $amount, \'DCLBR\');');
  }

  void insertIndirectLaborCost({date, amount}){
    sendQuery('INSERT INTO Money (MoneyDate, Money, MoneyCategory) VALUES (\'$date\', $amount, \'IDLBR\');');
  }

  void insertEnergyFee({date, amount}){
    sendQuery('INSERT INTO Money (MoneyDate, Money, MoneyCategory) VALUES (\'$date\', $amount, \'EGFEE\');');
  }
}

class MySQLTable{
  String tableName = '';
  List<Map<String, dynamic>> rows = [];
  List<String> userDefinedColumnNames = [];

  MySQLTable(data, [userDefinedColumnNames]){
    for(var row in data)
      this.rows.add(Map.of(row));
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

  List<TableRow> getTableRows({convertor}){
    if(convertor == null)
      convertor = (row){ return row; };

    return <TableRow>[
      for(Map<String, dynamic> row in rows)
        TableRow(
          children: <Widget>[
              for(var data in convertor(row).values.toList())
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