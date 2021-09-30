import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class expected_profit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _expected_profit();
}

class _expected_profit extends State<expected_profit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예상 수익'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 63, 107,1),
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
                        text: '예상 수익',
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
                        text: '303,650,990원 ',
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
                            text: '14% ',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                          TextSpan(
                              text: '하락했어요.',
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
                                    '현금',
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
                                    '현금성 자산',
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
                                    '단기 금융 상품',
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
