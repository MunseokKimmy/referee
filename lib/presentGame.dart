import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:referee/GameHistory.dart';
import 'package:referee/GameScoresheet.dart';
import 'package:referee/barChartModel.dart';

import 'AppBar.dart';
import 'bottomNavigationBar.dart';

class PresentGame extends StatefulWidget {
  List<charts.Series> seriesList;
  final gameScores;
  PresentGame({this.gameScores});
  @override
  PresentGameState createState() => PresentGameState(gameScores);
}
class PresentGameState extends State<PresentGame>{
  List<charts.Series> seriesList;
  final gameScores;
  PresentGameState(this.gameScores);
  List<charts.Series<OnePlayerScore, String>> _createData(final gameScores){
    return [
      charts.Series<OnePlayerScore, String>(
        id: 'Scores',
        domainFn: (OnePlayerScore oneScore, _) => oneScore.playerName,
        measureFn: (OnePlayerScore oneScore, _) => int.tryParse(oneScore.score),
        data: gameScores,
        fillColorFn: (OnePlayerScore oneScore, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },

      )
    ];
  }
  barChart(){
    return charts.BarChart(
      seriesList = _createData(gameScores),
      animate: true,

    );
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: MyAppBar(
          title: Text('Referee'),
          appBar: AppBar(),
        ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Card (
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Game Scores"),
                Expanded(
                  child: barChart(),
                )
              ],
            )
          )
        )
      ),
      bottomNavigationBar: BottomNavBar(
      index: 0,
    ),
    );
  }
  int findTotal(SingleGameHistory gameHistory, int index){
    int total = 0;
    for (int i = 1; i < gameHistory.points[index].length; i++){
      total += gameHistory.points[i][index];
    }
    return total;
  }
}
