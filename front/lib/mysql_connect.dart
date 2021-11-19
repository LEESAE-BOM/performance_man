import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';
import 'package:ml_dataframe/ml_dataframe.dart';

class MySQLConnector{
  String webServerURL = 'http://teamflow.dothome.co.kr/doQuery.php';

  MySQLConnector([webServerURL]);
  Future<List<Map<String, dynamic>>> sendQuery(String? query) async {
    var formedQuery = FormData.fromMap({'qry': query});
    var jsonData = await Dio().post(webServerURL, data: formedQuery);
    return [for(var row in jsonData.data.sublist(1)) Map<String, dynamic>.from(row)];
  }

  Future<List<List<Map<String, dynamic>>>> sendQueries(List<String> queries) async {
    List<List<Map<String, dynamic>>> result = [];
    for(var query in queries) {
      var formedQuery = FormData.fromMap({'qry': query});
      var jsonData = await Dio().post(webServerURL, data: formedQuery);
      result.add([
        for(var row in jsonData.data.sublist(1)) Map<String, dynamic>.from(row)
      ]);
    }
    return result;
  }

  Future<DataFrame> getSalesData(year) async {
    var result = await sendQuery("SELECT Year(RecordedDate) year, Month(RecordedDate) month, Money * 1000 profit FROM Money WHERE (Category=\'SALES\') AND (Year(RecordedDate)='$year');");
    var header = ['month', 'profit'];
    var data = [
      header,
      for(var row in result)
        [row['month'], double.parse(row['profit'])]
    ];

    return DataFrame(data);
  }

  void insertSalesData({date, amount}){
    sendQuery('INSERT INTO Money (RecordedDate, Money, Category) VALUES (\'$date\', $amount, \'SALES\');');
  }

  void insertCashData({date, amount}){
    sendQuery('INSERT INTO Money (RecordedDate, Money, Category) VALUES (\'$date\', $amount, \'MONEY\');');
  }

  void insertDirectLaborCost({date, amount}){
    sendQuery('INSERT INTO Money (RecordedDate, Money, Category) VALUES (\'$date\', $amount, \'DCLBR\');');
  }

  void insertIndirectLaborCost({date, amount}){
    sendQuery('INSERT INTO Money (RecordedDate, Money, Category) VALUES (\'$date\', $amount, \'IDLBR\');');
  }

  void insertEnergyFee({date, amount}){
    sendQuery('INSERT INTO Money (RecordedDate, Money, Category) VALUES (\'$date\', $amount, \'EGFEE\');');
  }

  void setSalesGoal({year, quarter, amount}){
    String month = '01';
    switch(quarter){
      case 1:
        month = '01';
        break;
      case 2:
        month = '04';
        break;
      case 3:
        month = '07';
        break;
      case 4:
        month = '10';
    }
    sendQuery('INSERT INTO Money (RecordedDate, Money, Category) VALUES (\'$year-$month-01\', $amount, \'GSALE\');');
  }

  void insertContractInfo({date, company, price, backlog, outsourcing}){
    sendQuery('INSERT INTO Contract (ContractDate, Company, Price, Backlog, Outsourcing) VALUES (\'$date\', \'$company\', $price, $backlog, $outsourcing);');
  }

  void updateBacklogValue({date, company, backlog}){
    sendQuery('UPDATE Contract SET Backlog=$backlog WHERE ContractDate = \'$date\' AND Company=\'$company\';');
  }

  void updateOutsourcingValue({date, company, outsourcing}){
    sendQuery('UPDATE Contract SET Outsourcing=$outsourcing WHERE ContractDate = \'$date\' AND Company=\'$company\';');
  }

  void insertEnergyUse({date, time, amount}){
    sendQuery('INSERT INTO EnergyUse (UseDate, UseTime, Amount) VALUES (\'$date\', \'$time\', $amount);');
  }

  void insertLeadTime({productName, productTime, cumulativeTime, deliveryTime, startDate, dueDate}){
    sendQuery('INSERT INTO LeadTime (ProductName, ProductTime, CumulativeTime, DeliveryTime, StartDate, DueDate) VALUES (\'$productName\', $productTime, $cumulativeTime, $deliveryTime, \'$startDate\', \'$dueDate\');');
  }

  void insertProject({goal, label, startDate}){
    sendQuery('INSERT INTO CompletionGoal (Goal, Label, StartDate) VALUES ($goal, \'$label\', \'$startDate\');');
  }

  void insertProjectCompletionValue({label, completionValue, date}){
    var result = sendQuery('SELECT ID FROM CompletionGoal WHERE Label=\'$label\'') as List<Map<String, dynamic>>;
    var targetID = result[0]['ID'];
    sendQuery('INSERT INTO CompletionRate (ID, Achievement, RecordedDate, Category) VALUES ($targetID, \'$completionValue\', \'$date\', \'DVLCM\');');
  }

  void insertCapacityRate({completionRate, date}){
    sendQuery('INSERT INTO CompletionRate (Achievement, RecordedDate, Category) VALUES ($completionRate, \'$date\', \'OPRCM\');');
  }

  void insertProductivityValue({date, productivity}){
    sendQuery('INSERT INTO CompletionRate (RecordedDate, Productivity) VALUES (\'$date\', $productivity);');
  }
}

class ResultSet{
  String tableName = '';
  List<Map<String, dynamic>> rows = [];
  List<String> userDefinedColumnNames = [];
  DetailPageTheme detailPageTheme = DetailPageTheme();

  ResultSet(data, [userDefinedColumnNames]){
    for(var row in data)
      this.rows.add(Map.of(row));
    if(userDefinedColumnNames != null)
      this.userDefinedColumnNames = userDefinedColumnNames;
  }

  bool isEmpty(){
    if(rows.length == 0) return true;
    return false;
  }

  List<String> getColumnNames(){
    return [for(var col in rows[0].keys) col];
  }

  TableRow getTableHeaderWidget(){
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

  List<TableRow> getTableRowWidgets({convertor}){
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