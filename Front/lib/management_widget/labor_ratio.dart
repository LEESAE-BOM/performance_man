import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class labor_ratio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _labor_ratio();
}

class _labor_ratio extends State<labor_ratio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인건 비율'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107,1),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(TextSpan(text: '', children: <TextSpan>[
                  TextSpan(
                    text: '2021년 10월은 ',
                    style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                  ),
                ])),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: <Widget>[
                    Text.rich(TextSpan(
                        text: '간접 인건비가 ',
                        style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: '12% ',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.blue,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: '높아요. ',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  letterSpacing: 2.0,
                                  color: Colors.black)),
                        ]))
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: Theme(
                      data:
                          Theme.of(context).copyWith(dividerColor: Colors.grey),
                      child: DataTable(
                        showBottomBorder: true,
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black12),
                        columns: <DataColumn>[
                          DataColumn(
                            label: Container(
                              width: 100.0,
                              child: Text(
                                '',
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 150.0,
                              alignment: Alignment.center,
                              child: Text('인건비 내역',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23.0)),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 100.0,
                              child: Text(
                                '',
                              ),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Container(
                                  width: 150.0,
                                  child: Text(
                                    '최근 1개월',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  )))
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Container(
                                  child: Text(
                                    '####.##.##',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  width: 100.0,
                                ),
                              ),
                              DataCell(
                                Container(
                                    width: 150.0,
                                    child: Text(
                                      '???',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              ),
                              DataCell(
                                Container(
                                    width: 150.0,
                                    child: Text(
                                      '#,##,###원',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
