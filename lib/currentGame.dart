

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:referee/GameHistory.dart';
import 'package:referee/presentGame.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'AppBar.dart';
import 'GameScoresheet.dart';
import 'barChartModel.dart';
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
class currentGame extends StatelessWidget{
  GameScoresheet gameScoresheet = new GameScoresheet("Antiquity Quest", 123, 0, 3, 0, 3, "Bonus Points, Collection Points, Card Points", false, null);
  List <String> _players;
  currentGame(this._players);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: gameScoresheet.name,
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
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
      home: GamePage(
        title: gameScoresheet.name,
        players: _players,
      ),
    );
  }
}
class GamePage extends StatefulWidget {
  final String title;
  List<String> players;
  GamePage({this.title, this.players});
  @override
  _GamePageState createState() => _GamePageState(players);
}
class _GamePageState extends State<GamePage>{
  int roundCounter = 1;
  var points = List<List>.generate(3, (i) => List.generate(3, (j) => 0), growable: false);
  List<String> players;
  _GamePageState(this.players);
  @override
  Widget build(BuildContext context) {
    var _categories = new List<String>.filled(3,"p");
    _categories[0] = "Bonus Points";
    _categories[1] = "Collection Points";
    _categories[2] = "Card Points";

    GameScoresheet gameScoresheet = new GameScoresheet("Antiquity Quest", 123, 0, 3, 0, 3, "Bonus Points, Collection Points, Card Points", false, null);
    SingleGameHistory gameHistory = new SingleGameHistory(gameScoresheet.name, players, 3, _categories, 3, 4121);
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Referee'),
        appBar: AppBar(),
      ),
      body: _buildCurrentScoreSheet(gameScoresheet, gameHistory),
      bottomNavigationBar: BottomNavBar(
        index: 0,
      ),
    );
  }
  Widget _buildPresentButton(SingleGameHistory singleGameHistory){
    return Container(
      width: 400,
      padding: EdgeInsets.all(10),
      child: OutlinedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PresentGame(
                gameScores: generateScoreData(singleGameHistory, points),
              )
              ,)
          );
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset("assets/diceDark.png",
                  height: 32, width: 32,),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Present Scores',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.normal, color: lightColor),
              ),
            )
          ],
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: darkColor, width: 5),
          primary: darkColor,
          backgroundColor: baseColor,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        ),
      ),
    );
  }
  Widget _buildCurrentScoreSheet(GameScoresheet gameScoresheet, SingleGameHistory gameHistory) {
    int numTextFields = gameHistory.numCategories;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(gameScoresheet.name, style: TextStyle(color: darkColor,fontSize: 24, fontWeight: FontWeight.bold),),
          Text("Round " + roundCounter.toString() + "/" + gameHistory.numRounds.toString(), style: TextStyle(fontSize: 18, color: darkColor, fontWeight: FontWeight.w400)),
          SizedBox(height: 5,),
          ToggleSwitch(
            initialLabelIndex: 0,
            // minWidth: 120,
            minHeight: 25,
            fontSize: 14,
            activeBgColor: darkTint,
            activeFgColor: lightColor,
            inactiveBgColor: lightTint,
            inactiveFgColor: darkColor,
            labels: ['Round 1', 'Round 2', 'Round 3'],
            onToggle: (index){
              if (index == 1) {
              }
            },

          ),
          Expanded(
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  SizedBox(height: 20,),
                  _buildExpandingMenuForPlayer(gameHistory.playerNames.elementAt(0), 0, gameHistory.categoryNames, numTextFields),
                  SizedBox(height: 20,),
                  _buildExpandingMenuForPlayer(gameHistory.playerNames.elementAt(1), 1, gameHistory.categoryNames, numTextFields),
                  SizedBox(height: 20,),
                  _buildExpandingMenuForPlayer(gameHistory.playerNames.elementAt(2), 2, gameHistory.categoryNames, numTextFields),
                  SizedBox(height: 20,),
                  _buildPresentButton(gameHistory),
                ],
              )
          ),

        ],
      ),
    );

  }
  Widget _buildExpandingMenuForPlayer(String playerName, int playerNum, var _categories, int numOfTextFields){
    return Material(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          color: baseColor,
          border: Border.all(color: darkColor, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(5.00),
          ),
        ),
        padding: EdgeInsets.all(0),
        child: ExpansionTile(
          backgroundColor: darkTint,
          collapsedBackgroundColor: baseColor,
          expandedAlignment: Alignment.center,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(playerName, style: TextStyle(fontSize: 20, color: darkColor, fontWeight: FontWeight.bold), ),
                Text(findTotal(points[playerNum]) + " Points", style: TextStyle(fontSize: 20, color: lightColor,fontWeight: FontWeight.bold),),]

          ),
          children: <Widget>[
            _buildRows(_categories[0], playerNum, 0),
            _buildRows(_categories[1], playerNum, 1),
            _buildRows(_categories[2], playerNum, 2),
            _buildtotalRows(playerNum),
          ],

        ),
      ),
    );
  }
  Widget _buildRows(String rowName, int player, int which) {
    return Material(
      child: Expanded(

        child: Row(
          children: [
            Expanded (
              child: Container(
                decoration: BoxDecoration(border: Border.all(), color: lightTint,
                  borderRadius: BorderRadius.horizontal(
                    left : Radius.circular(5.00),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  rowName
                  , style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
            Expanded (
              child: Container(
                height: 41,
                decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.horizontal(
                      right : Radius.circular(5.00),
                    )),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  //initialValue: points[player][which].toString(),
                  keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                  onChanged: (text){
                    setState((){
                      points[player][which] = int.parse(text);
                    });
                  },

                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
  Widget _buildtotalRows(int playerNum) {
    return Material(
      child: Expanded(
        child: Row(
          children: [
            Expanded (
              child: Container(
                decoration: BoxDecoration(border: Border.all(), color: lightTint,
                  borderRadius: BorderRadius.horizontal(
                    left : Radius.circular(5.00),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Total Points"
                  , style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
            Expanded (
              child: Container(
                decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.horizontal(
                      right : Radius.circular(5.00),
                    )),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  findTotal(points[playerNum]),
                  style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),

      ),
    );
  }

  String findTotal(List<dynamic> points){
    return points.reduce((v, e) => v + e).toString();
  }
  List<OnePlayerScore> generateScoreData(SingleGameHistory gameScoresheet, var points){
    List<OnePlayerScore> data = [
      OnePlayerScore(
        gameName: gameScoresheet.name,
        playerName: gameScoresheet.playerNames[0],
        score: findTotal(points[0]),
      ),
      OnePlayerScore(
        gameName: gameScoresheet.name,
        playerName: gameScoresheet.playerNames[1],
        score: findTotal(points[1]),
      ),
      OnePlayerScore(
        gameName: gameScoresheet.name,
        playerName: gameScoresheet.playerNames[2],
        score: findTotal(points[2]),
      ),
    ];
    return data;
  }
}

