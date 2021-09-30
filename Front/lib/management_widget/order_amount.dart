import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class order_amount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _order_amount();
}

class _order_amount extends State<order_amount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수주 금액'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(TextSpan(
                    text: '2021년 ',
                    style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                    children: <TextSpan>[
                      TextSpan(
                        text: '수금 금액',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                      TextSpan(
                          text: '은',
                          style: TextStyle(fontSize: 25.0, letterSpacing: 2.0)),
                    ])),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: <Widget>[
                    Text.rich(TextSpan(text: '', children: <TextSpan>[
                      TextSpan(
                        text: '45,650,890원 ',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: '이에요.',
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
                Column(
                  children: <Widget>[
                    Text.rich(TextSpan(
                        text: '전체 비율 중 ',
                        style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: '37% ',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                          TextSpan(
                              text: '에 달해요.',
                              style: TextStyle(
                                fontSize: 25.0,
                                letterSpacing: 2.0,
                              )),
                        ]))
                  ],
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
                              width: 150.0,
                              child: Text(
                                '종류',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              width: 300.0,
                              child: Text('금액',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23.0)),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('')),
                              DataCell(Container(
                                  width: 300.0,
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
                                    '수금 금액',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  width: 150.0,
                                ),
                              ),
                              DataCell(
                                Container(
                                    width: 300.0,
                                    child: Text(
                                      '45,600원',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Container(
                                  child: Text(
                                    '미수금 금액',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  width: 150.0,
                                ),
                              ),
                              DataCell(
                                Container(
                                    width: 300.0,
                                    child: Text(
                                      '41,500원',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Container(
                                  child: Text(
                                    '채권 금액',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  width: 150.0,
                                ),
                              ),
                              DataCell(
                                Container(
                                    width: 300.0,
                                    child: Text(
                                      '62,300원',
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
