import 'package:charts_flutter/flutter.dart' as charts;

class OnePlayerScore {
  String gameName;
  String playerName;
  String score;
  String objective;
  final charts.Color color;

  OnePlayerScore({this.gameName,
    this.playerName, this.score, this.objective,
    this.color,}
      );
}