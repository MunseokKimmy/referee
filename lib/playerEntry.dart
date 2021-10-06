import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:referee/main.dart';

import 'AppBar.dart';
import 'allGames.dart';
import 'bottomNavigationBar.dart';
import 'currentGame.dart';
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
class playerEntry extends StatelessWidget{
  int numberOfPlayers;
  playerEntry(this.numberOfPlayers);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Referee",
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'BreeSerif',
          ),
          primarySwatch: lightColor,
          scaffoldBackgroundColor: lightColor,
          bottomAppBarColor: lightColor
      ),
      home: PlayerEntryPage(
        title: "Referee",
        numberOfPlayers: numberOfPlayers,
      ),
    );
  }
}
class PlayerEntryPage extends StatefulWidget{
  PlayerEntryPage({Key key, this.title, this.numberOfPlayers}) : super(key: key);
  final String title;
  final int numberOfPlayers;
  @override
  State<StatefulWidget> createState() => _PlayerEntryState(numberOfPlayers);

}

class _PlayerEntryState extends State<PlayerEntryPage>{
  int _selectedIndex = 1;
  String player1 = "";
  String player2 = "";
  String player3 = "";
  var players = [];
  int numberOfPlayers;
  _PlayerEntryState(this.numberOfPlayers);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Referee'),
        appBar: AppBar(),
      ),
      body: _buildNameEntry(),
      bottomNavigationBar: BottomNavBar(
        index: 0,
      ),
    );
  }
  Widget _buildNameEntry(){
    List<String> playerList = [];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: [
          Text("Players", style: TextStyle(color: darkColor,fontSize: 24, fontWeight: FontWeight.bold),),
          Text("Antiquity Quest",style: TextStyle(fontSize: 18, color: darkColor, fontWeight: FontWeight.w100)),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 42,
                width: 150,
                decoration: BoxDecoration(border: Border.all(), color: lightTint,
                  borderRadius: BorderRadius.horizontal(
                    left : Radius.circular(5.00),
                  ),
                ),
                child: Text("Player Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: darkColor),),
              ),
              Container(
                height: 42,
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
                  keyboardType: TextInputType.name,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                  onChanged: (text){
                    player2 = text;
                  },

                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 42,
                width: 150,
                decoration: BoxDecoration(border: Border.all(), color: lightTint,
                  borderRadius: BorderRadius.horizontal(
                    left : Radius.circular(5.00),
                  ),
                ),
                child: Text("Player Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: darkColor),),
              ),
              Container(
                height: 42,
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
                  keyboardType: TextInputType.name,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                  onChanged: (text){
                    player2 = text;
                  },

                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 42,
                width: 150,
                decoration: BoxDecoration(border: Border.all(), color: lightTint,
                  borderRadius: BorderRadius.horizontal(
                    left : Radius.circular(5.00),
                  ),
                ),
                child: Text("Player Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: darkColor),),
              ),
              Container(
                height: 42,
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
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                  onChanged: (text){
                    player3 = text;
                  },

                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 42,
                width: 150,
                decoration: BoxDecoration(border: Border.all(), color: lightTint,
                  borderRadius: BorderRadius.horizontal(
                    left : Radius.circular(5.00),
                  ),
                ),
                child: Text("Player Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: darkColor),),
              ),
              Container(
                height: 42,
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
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                  onChanged: (text){

                  },

                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          _buildSubmitButton("Antiquity Quest"),
        ],
      ),
      ),
    );
  }

  Widget buildPlayerEntryBox(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          height: 42,
          width: 150,
          decoration: BoxDecoration(border: Border.all(), color: lightTint,
            borderRadius: BorderRadius.horizontal(
              left : Radius.circular(5.00),
            ),
          ),
          child: Text("Player Name", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: darkColor),),
        ),
        Container(
          height: 42,
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
            keyboardType: TextInputType.name,
            style: TextStyle(color: darkColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
            onChanged: (text){
              players.add(text);
            },
          ),
        ),
      ],
    );
  }
  List<String> updatePlayerList(String player1, String player2, String player3){
    List<String> playerList = [];
    playerList.add(player1);
    playerList.add(player2);
    playerList.add(player3);
    return playerList;
  }
  Widget _buildSubmitButton(String title){
    return Container(
      width: 400,
      padding: EdgeInsets.all(10),

      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: darkColor, width: 5),
          primary: lightColor,
          backgroundColor: baseColor,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        ),
        onPressed: (){
          List<String> playerList = updatePlayerList(player1, player2, player3);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GamePage(title: title ,players: playerList)),
          );
        },
        child: Text("Submit",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontStyle: FontStyle.normal, color: lightColor),),
      ),
    );
  }

}