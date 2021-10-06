import 'dart:io';

import 'package:referee/GameScoresheet.dart';

class SkullKingExample extends GameScoresheet{
  SkullKingExample(String name, int id, int gameEnds, int gameEndsLimit, int goalToWin, int categories, categoriesStr, bool teams, File backgroundImage) : super(name, id, gameEnds, gameEndsLimit, goalToWin, categories, categoriesStr, teams, backgroundImage);

}