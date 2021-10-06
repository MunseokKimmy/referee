import 'dart:io';
class GameScoresheet {
  String name;
  int id;
  int gameEnds; // 0 = Rounds 1 = Points 2 = Wins 3 = Lives 4 = PlayerToggled
  int gameEndsLimit; // How many lives, points, wins, etc.. If 4, it's 0.
  int goalToWin; //0 = Most Points 1 = Least Points 2 = Closest to Point Amount 3 = Last Alive
  int categories; //number of categories
  var categoriesStr; //names of categories with comma separation
  bool teams;
  File backgroundImage;

  GameScoresheet(
      this.name,
      this.id,
      this.gameEnds,
      this.gameEndsLimit,
      this.goalToWin,
      this.categories,
      this.categoriesStr,
      this.teams,
      this.backgroundImage); // The image should be in the assets folder

  GameScoresheet.fromJson(Map<String, dynamic> json)
    : name = json['name'],
     id = json['id'],
    gameEnds = json['gameEnds'],
    gameEndsLimit = json['gameEndsLimit'],
    goalToWin = json['goalToWin'],
    categories = json['categories'],
    categoriesStr = json['categoriesStr'],
    teams = json['teams'],
    backgroundImage = json['backgroundImage'];

  Map <String, dynamic> toJson() => {
   'name': name,
   'id': id,
   'gameEnds' : gameEnds, // 0 = Rounds 1 = Points 2 = Wins 3 = Lives 4 = PlayerToggled
   'gameEndsLimit' : gameEndsLimit, // How many lives, points, wins, etc.. If 4, it's 0.
   'goalToWin' : goalToWin, //0 = Most Points 1 = Least Points 2 = Closest to Point Amount 3 = Last Alive
   'categories' : categories, //number of categories
   'categoriesStr' : categoriesStr, //names of categories with comma separation
   'teams' : teams,
   'backgroundImage': backgroundImage,
  };

}
