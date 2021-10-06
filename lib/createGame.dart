


import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppBar.dart';
import 'allGames.dart';

class createGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HashMap gameInfos = buildHashmap();
    return MaterialApp(
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'BreeSerif',
          ),
          primarySwatch: lightColor,
          scaffoldBackgroundColor: lightColor,
          bottomAppBarColor: lightColor
      ),
      home: Scaffold(
          appBar: MyAppBar(
            title: Text("Referee"),
            appBar: AppBar(),
          ),
        body: buildCustomization(),
      ),

    );
  }
  Widget buildCustomization(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Create Game Scoresheet", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: darkColor),),
                ),
              ],
            ),
            SizedBox(height: 20,),
            buildExpansionTiles("Win Condition"),
            SizedBox(height: 20,),
            buildExpansionTiles("How the Game Ends"),
            SizedBox(height: 20,),
            buildExpansionTiles("Category Names"),
            SizedBox(height: 20,),
            buildExpansionTiles("Whatever"),

          ],
        ),
      ),
    );
  }
  Widget buildExpansionTiles(String category){
    return Container(
      width: 320,
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
        title: Text(
          category, textAlign: TextAlign.center, style: TextStyle(fontSize: 26, color: darkColor),
        ),
        children: [

        ],

      ),
    );
  }
  HashMap<String, dynamic> buildHashmap(){
    HashMap gameInfos = {'Win Condition': [],'How the Game Ends':['Rounds', 'Points', 'Wins', 'Lives'],} as HashMap;

    return gameInfos;
  }
}