

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'allGames.dart';

class BottomNavBar extends StatelessWidget implements PreferredSizeWidget {
  final BottomNavigationBar bottomNavigationBar;
  final index;
  const BottomNavBar({Key key, this.bottomNavigationBar, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: lightColor,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: lightTint,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: _buildNavBar()
    );
  }
  Widget _buildNavBar(){
    return BottomNavigationBar(
      currentIndex: index,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.games),
          label: 'Resume',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Settings',
        ),
      ],
      showUnselectedLabels: true,
      unselectedItemColor: darkTint,
      selectedItemColor: darkColor,

    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kBottomNavigationBarHeight);

}