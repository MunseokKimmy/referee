
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:referee/AppBar.dart';
import 'package:referee/createGame.dart';
import 'package:referee/currentGame.dart';
import 'package:referee/howManyPlayers.dart';
import 'package:referee/playerEntry.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'allGames.dart';
import 'bottomNavigationBar.dart';

void main() async{
  //var categoryNames = ["Card Points", "Collection Points", "Bonus Points"];
  //var playerNames = ["Adam", "Josie", "Jessie"];
  //SingleGameHistory singleGameHistory = new SingleGameHistory(playerNames, 3, categoryNames, 3, DateTime.now().millisecondsSinceEpoch);
  //singleGameHistory.setPoints(10, 1, 1);
  //FileUtility fileUtility = new FileUtility();


  /*String json = jsonEncode(gameScoresheet);
  Future<File> written = fileUtility.writeFile(json);
  Future<String> fileJson = fileUtility.readFile();
  Map gameJson = jsonDecode(fileJson.toString());
  GameScoresheet fromJson = GameScoresheet.fromJson(gameJson);*/
  runApp(MyApp());
}
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
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Referee',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'BreeSerif',
        ),
        primarySwatch: lightColor,
          scaffoldBackgroundColor: lightColor,
        bottomAppBarColor: lightColor
      ),
      home: MyHomePage(title: 'Referee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int initialIndex = 0;
  final _savedGames = <String>{};
  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Referee'),
        appBar: AppBar(),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 320,
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: OutlinedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => createGame()),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset("assets/DiceLight.png",
                            height: 64, width: 64,),
                      ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('Create New \n Game Scoresheet',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, fontStyle: FontStyle.normal),
                        ),
                      )
                    ],
              ),
                  style: OutlinedButton.styleFrom(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.00)),
                    side: BorderSide(color: darkColor,),
                    primary: lightColor,
                    backgroundColor: baseColor,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
              ),
            ),
          Container(
            width: 300,
            child: Card(
              color: darkTint,
              margin: EdgeInsets.symmetric(vertical: 7.0),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: darkColor, width: 1),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: ListTile(
                  title: Text(
                    "View All Games", textAlign: TextAlign.center,
                    style: new TextStyle(color: lightColor, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  //trailing: Icon(
                  //  alreadySaved ? Icons.favorite : Icons.favorite_border,
                  // color: alreadySaved ? Colors.red : null,
                  //),
                  onTap: () { // NEW lines from here...
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => allGames()),
                    );
                  },
                ),
              ),
            ),
          ),
            Container(
              width: 300,
                padding: EdgeInsets.symmetric(vertical: 0.0,),
                child: Column(
                  children: [
                  _buildFavGame("Antiquity Quest"),
                  _buildFavGame("Cover Your Assets"),
                  _buildFavGame("WingSpan"),
                  _buildFavGame("Fill or Bust"),
                  _buildFavGame("Skull King"),
                    _buildFavGame("Qwixx"),
              ]
                ),
            ),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFavGame(String gameName){
    final alreadySaved = _savedGames.contains(gameName);
    return Container(
      child: Card(
        color: baseColor,
        margin: EdgeInsets.symmetric(vertical: 7.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: darkColor, width: 1),
            borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: ListTile(
            title: Text(
              gameName, textAlign: TextAlign.center,
              style: new TextStyle(color: lightColor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            //trailing: Icon(
            //  alreadySaved ? Icons.favorite : Icons.favorite_border,
             // color: alreadySaved ? Colors.red : null,
            //),
            onTap: () { // NEW lines from here...
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => howManyPlayers(gameName)),
              );
            },
        ),
      ),
    ),
    );
  }

}

