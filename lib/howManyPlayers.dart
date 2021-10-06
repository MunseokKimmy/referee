import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:referee/playerEntry.dart';

import 'AppBar.dart';
import 'bottomNavigationBar.dart';

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

class howManyPlayers extends StatelessWidget {
  String gameName;
  howManyPlayers(this.gameName);

  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      title: 'Referee',
      theme: ThemeData(
          textTheme: Theme.of(buildContext).textTheme.apply(
            fontFamily: 'BreeSerif',
          ),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: lightColor,
          scaffoldBackgroundColor: lightColor,
          bottomAppBarColor: lightColor
      ),
      home: numPlayerEntry(
        gameName: this.gameName,
      ),
    );
  }
}

class numPlayerEntry extends StatefulWidget{
  String gameName;
  numPlayerEntry({this.gameName});
  @override
  State<StatefulWidget> createState() => _numPlayerEntry(gameName);
}

class _numPlayerEntry extends State<numPlayerEntry>{
  //int _selectedIndex = 1;
  String gameName;
  _numPlayerEntry(this.gameName);
  @override
  Widget build(BuildContext context) {
    int numberOfPlayers;
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Referee'),
        appBar: AppBar(),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 72,
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(border: Border.all(), color: lightTint,
                      borderRadius: BorderRadius.horizontal(
                        left : Radius.circular(5.00),
                      ),
                    ),
                    child: Text("How Many Players?", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: darkColor),),
                  ),
                  Container(
                    height: 72,
                    width: 150,
                    decoration: BoxDecoration(border: Border.all(), color: lightColor,
                      borderRadius: BorderRadius.horizontal(
                        right : Radius.circular(5.00),
                      ),
                    ),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                      ),
                      //initialValue: points[player][which].toString(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle(color: darkColor, fontWeight: FontWeight.bold, fontSize: 32,), textAlign: TextAlign.center,
                      onChanged: (num){
                        numberOfPlayers = num as int;
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: 400,
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(10),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: darkColor, width: 5),
                    primary: lightColor,
                    backgroundColor: baseColor,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => playerEntry(numberOfPlayers)),
                    );
                  },
                  child: Text("Next",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontStyle: FontStyle.normal, color: lightColor),),
                ),
              ),
            ]
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
      ),
    );
  }
}
