import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextTheme{
  TextStyle bigText = TextStyle(
      fontSize: 90.sp,
      color: Colors.blue,
      fontFamily: 'applesdneoeb',
      letterSpacing: 2.0);

  TextStyle normalText = TextStyle(
      fontSize: 65.sp,
      color: Colors.black38,
      fontFamily: 'applesdneoeb',
      letterSpacing: 2.0);

  TextSpan text(String txt){
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
    print(parsed);

    return TextSpan(
      children: <InlineSpan>[
        for(var textWithSize in parsed)
          if(textWithSize.containsValue('big'))
            TextSpan(text: textWithSize.keys.toList()[0], style: bigText)
          else
            TextSpan(text: textWithSize.keys.toList()[0], style: normalText)
      ]
    );
  }
}