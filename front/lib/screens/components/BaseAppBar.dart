import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../session_manager.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {

  const BaseAppBar({Key? key,
    required this.appBar,
    required this.title})
      : super(key: key);

  final AppBar appBar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$title",
        style: TextStyle(color: Colors.white, fontFamily: 'applesdneob'),),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(43, 63, 107, 1),
      leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          onPressed: () {
            loginSession.deleteValue("loginInfo").then((value) {
              Navigator.of(context).pop();
            });
          }
      ),
    );
  }
    @override
    Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  }
