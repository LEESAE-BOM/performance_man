import 'package:flutter/cupertino.dart';
import 'package:flutter_app/theme.dart';

class BoxWidget {
  String title;
  String state;
  String type;
  double width = 0.0;
  double height = 0.0;
  double insideWidth = 0.0;
  double insideHeight = 0.0;
  Image? stateIcon;

  BoxWidget(this.title, this.state, this.type){
    if(type == 'wide'){
      width = widgetBoxTheme.wideBoxWidth;
      height = widgetBoxTheme.wideBoxHeight;
      insideWidth = widgetBoxTheme.wideBoxInsideWidth;
      insideHeight = widgetBoxTheme.wideBoxInsideHeight;
    }else{
      width = widgetBoxTheme.narrowBoxWidth;
      height = widgetBoxTheme.narrowBoxHeight;
      insideWidth = widgetBoxTheme.narrowBoxInsideWidth;
      insideHeight = widgetBoxTheme.narrowBoxInsideHeight;
    }

    if(this.state == 'safe') stateIcon = widgetBoxTheme.safeIcon;
    if(this.state == 'warning') stateIcon = widgetBoxTheme.warningIcon;
    if(this.state == 'danger') stateIcon = widgetBoxTheme.dangerIcon;
    if(this.state == 'none') stateIcon = widgetBoxTheme.unknownIcon;
  }

  GestureDetector make({onTap, dbRelatedContentBuilder}){
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width,
            height: height,
            decoration: widgetBoxTheme.widgetBoxDecoration,
            child: Column(
                children: <Widget>[
                  Container(
                    padding: widgetBoxTheme.widgetBoxPadding,
                    child: Row(
                      children: [
                        widgetBoxTheme.titleText(title),
                        SizedBox(width: 10, height: 1),
                        stateIcon as Image
                      ],
                    ),
                  ),
                  Container(
                      width: insideWidth,
                      height: insideHeight,
                      child: Center(
                          child: dbRelatedContentBuilder
                      )
                  ),
                ]
            )
        )
    );
  }
}