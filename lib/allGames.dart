
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppBar.dart';
import 'main.dart';
Map<int, Color> color =
{
  50:Color.fromRGBO(92,219,149, .1),
  100:Color.fromRGBO(92,219,149, .2),
  200:Color.fromRGBO(92,219,149, .3),
  300:Color.fromRGBO(92,219,149, .4),
  400:Color.fromRGBO(92,219,149, .5),
  500:Color.fromRGBO(92,219,149, .6),
  600:Color.fromRGBO(92,219,149, .7),
  700:Color.fromRGBO(92,219,149, .8),
  800:Color.fromRGBO(92,219,149, .9),
  900:Color.fromRGBO(92,219,149, 1),
};
Map<int, Color> lightColors =
{
  50:Color.fromRGBO(92,219,149, .1),
  100:Color.fromRGBO(92,219,149, .2),
  200:Color.fromRGBO(92,219,149, .3),
  300:Color.fromRGBO(92,219,149, .4),
  400:Color.fromRGBO(92,219,149, .5),
  500:Color.fromRGBO(92,219,149, .6),
  600:Color.fromRGBO(92,219,149, .7),
  700:Color.fromRGBO(92,219,149, .8),
  800:Color.fromRGBO(92,219,149, .9),
  900:Color.fromRGBO(237,245,225, 1),
};
MaterialColor baseColor = MaterialColor(0xFF5CDB95, color);
MaterialColor darkTint = MaterialColor(0xFF379683, color);
MaterialColor lightTint = MaterialColor(0xFF8EE4AF, color);
MaterialColor darkColor = MaterialColor(0xFF05386B, color);
MaterialColor lightColor = MaterialColor(0xFFEDF5E1, lightColors);

class allGames extends StatelessWidget {
  final _allGames = <String>{"Antiquity Quest", "WingSpan", "Cover Your Assets", "Fill Or Bust", "Qwixx"};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(
          title: Text('All Games'),
          appBar: AppBar(),
        ),
        body: _buildSuggestions(),
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        itemCount: _allGames.length,
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(_allGames.elementAt(i));
        });
  }

  Widget _buildRow(String gameName) {
    bool alreadySaved = _allGames.contains(gameName);
    return Card(
        child: ListTile(
          onTap: () { // NEW lines from here...
            null;
          },
          title: Text(
          gameName,
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
        ),
    );
  }

}