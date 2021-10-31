import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme(){
  return TextTheme(
    headline1: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    headline2: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyText2: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    subtitle1: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Color.fromRGBO(43, 63, 107, 1),
    elevation: 0.0,
    textTheme: TextTheme(
      headline6: GoogleFonts.nanumGothic(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appTheme(),
    primaryColor: Colors.blue,
    unselectedWidgetColor: Colors.black26,
  );
}

class DetailPageTheme{
  TextStyle weightText = TextStyle(
      fontSize: 90.sp,
      color: Colors.blue,
      fontFamily: 'applesdneoeb',
      letterSpacing: 2.0);

  TextStyle normalText = TextStyle(
      fontSize: 65.sp,
      color: Colors.black38,
      fontFamily: 'applesdneoeb',
      letterSpacing: 2.0);

  TableBorder tableBorderStyle = TableBorder(
      horizontalInside: BorderSide(width: 1,
      color: Colors.black38,
      style: BorderStyle.solid)
  );

  TextStyle tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40.sp,
      color: Colors.black87
  );

  TextStyle tableRowStyle = TextStyle(
      fontSize: 40.sp,
      color: Colors.black87,
  );

  Color tableHeaderBGColor = Colors.black12;
  Color tableRowBGColor = Colors.transparent;

  int maxTableRow = 300;

  TextSpan makeHeaderText(String txt){
    List<Map<String, String>> parsed = [];

    for(String tmp in txt.split('[')){
      if(tmp.contains(']')){
        parsed.add({tmp.split(']')[0]: 'big'});
        if(tmp.split(']').length > 0)
          parsed.add({tmp.split(']')[1]: 'small'});
      }else{
        parsed.add({tmp: 'small'});
      }
    }

    return TextSpan(
        children: <InlineSpan>[
          for(var textWithSize in parsed)
            if(textWithSize.containsValue('big'))
              TextSpan(text: textWithSize.keys.toList()[0], style: weightText)
            else
              TextSpan(text: textWithSize.keys.toList()[0], style: normalText)
        ]
    );
  }
}

DetailPageTheme detailPageTheme = DetailPageTheme();
