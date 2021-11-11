import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/* 2021-11-01, written by Team Flow
*
*
*
*
*
* */

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
  TextStyle titleText = TextStyle(
      fontSize: 67.w,
      color: Colors.white
  );

  TextStyle weightText = TextStyle(
      fontSize: 65.w,
      color: Colors.blue,
      fontFamily: 'applesdneoeb',
      //letterSpacing: 1.5
  );

  TextStyle normalText = TextStyle(
      fontSize: 65.w,
      color: Colors.black38,
      fontFamily: 'applesdneom',
      //letterSpacing: 2.0
  );

  TableBorder tableBorderStyle = TableBorder(
      horizontalInside: BorderSide(
          width: 1,
          color: Colors.black38,
          style: BorderStyle.solid
      )
  );

  TextStyle tableHeaderStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40.w,
      color: Colors.black87
  );

  TextStyle tableRowStyle = TextStyle(
      fontSize: 40.w,
      color: Colors.black87,
  );

  Color tableHeaderBGColor = Colors.black12;
  Color tableRowBGColor = Colors.transparent;

  int maxTableRow = 300;

  NumberFormat money = NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);

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

class WidgetBoxTheme{
  double wideBoxWidth = 1040.w;
  double wideBoxHeight = 400.w;
  double narrowBoxWidth = 510.w;
  double narrowBoxHeight = 400.w;
  double wideBoxInsideWidth = 1040.w;
  double wideBoxInsideHeight = 310.w;
  double narrowBoxInsideWidth = 510.w;
  double narrowBoxInsideHeight = 310.w;

  BoxDecoration widgetBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.black12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0.0, 1.0), //(x,y)
        blurRadius: 6.0,
      ),
    ],
  );

  TextStyle titleTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 35.w,
      fontFamily: 'applesdneom'
  );

  EdgeInsets widgetBoxPadding = EdgeInsets.only(top: 20.w, bottom: 10.w, left: 35.w);

  Image safeIcon = Image.asset(
    'image/safe_light.png',
    width: 100.w,
    height: 20.w,
  );

  Image warningIcon = Image.asset(
    'image/warning_light.png',
    width: 100.w,
    height: 20.w,
  );

  Image dangerIcon = Image.asset(
    'image/danger_light.png',
    width: 100.w,
    height: 20.w,
  );

  Container titleText(title){
    return Container(
      padding: EdgeInsets.only(left: 15.w),
      child: Text(
        title,
        style: titleTextStyle,
      ),
    );
  }
}

DetailPageTheme detailPageTheme = DetailPageTheme();
WidgetBoxTheme widgetBoxTheme = WidgetBoxTheme();