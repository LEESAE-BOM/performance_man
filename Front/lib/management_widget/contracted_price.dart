import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class contracted_price extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _contracted_price();
}

class _contracted_price extends State<contracted_price> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계약 금액'),
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
                    text: '이번 달 ',
                    style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                    children: <TextSpan>[
                      TextSpan(
                        text: '계약 금액',
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
                        text: '321,654,987원 ',
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
                        text: '전월 대비 ',
                        style: TextStyle(fontSize: 25.0, letterSpacing: 2.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: '1,000원 증가 ',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                          TextSpan(
                              text: '했어요.',
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
                              child: Text('매출 금액 내역',
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
                                    '기업',
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
                                      '계약 금액',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              ),
                              DataCell(
                                Container(
                                    width: 150.0,
                                    child: Text(
                                      '수주 잔고 금액',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              ),
                            ],
                          ),
                          DataRow(
                            color: MaterialStateColor.resolveWith(
                                    (states) => Colors.black12),
                            cells: <DataCell>[
                              DataCell(
                                Container(
                                  child: Text(
                                    'A기업',
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
                                      '4,123,123원',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              ),
                              DataCell(
                                Container(
                                    width: 150.0,
                                    child: Text(
                                      '456,789원',
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
