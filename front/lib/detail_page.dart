import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';

class DetailPage{
  Scaffold make({context, title, content}) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              title,
              style: DetailPageTheme().titleText
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(43, 63, 107, 1),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: SafeArea(
            child: Center(
                child: content
            )
        )
    );
  }
}