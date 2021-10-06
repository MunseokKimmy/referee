import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'allGames.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Color backgroundColor = Colors.green;
  final Text title;
  final AppBar appBar;

  const MyAppBar({Key key, this.title, this.appBar}) : super(key:key);
  @override
  Widget build(context){
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      toolbarHeight: 56,
      title: title,
      leading: IconButton(
        icon: Image.asset('assets/Whistle.png', height: 48, width: 48,),
        onPressed: (){},
      ),
      actions: <Widget>[
        IconButton(
          icon:Icon(
            Icons.settings,
            color: darkColor,
          ),
          onPressed: (){
            //Do something here
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kBottomNavigationBarHeight);
}