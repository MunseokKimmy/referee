import 'GameScoresheet.dart';

class GameHistory {
  GameScoresheet gameScoresheet;
  var allGames = new Map();

  void addGame(SingleGameHistory gameHistory){
    var date = DateTime.now().millisecondsSinceEpoch;
    var time = new DateTime.fromMillisecondsSinceEpoch(date * 1000);
    allGames[time] = gameHistory;
  }
  void saveGame(){
    //TO-DO

  }
}

class SingleGameHistory {
  String name;
  var date;
  var playerNames = <String>[];
  int numCategories;
  var categoryNames = <String>[];
  int numRounds;
  var points;

  SingleGameHistory(this.name,this.playerNames, this.numCategories, this.categoryNames, this.numRounds, this.date){
    // Generates a 2d Array with extra space for names and category names rows = names (1) + categories * rounds + rounds;
    // Ex. 4 players for 3 rounds,  3 categories = 1 + 9 + 3 = 13 (Names, Category 1, C2, C3, R1, C1, C2, C3, R2, C1, C2, C3,TOTAL)
    points = List<List>.generate(numCategories * numRounds + 1 + numRounds, (i) => List.generate(playerNames.length + 1, (j) => 0), growable: false);
    setArray();
  }
  void setArray(){ // This will set the array's top row with the player names and the left column with the category names and round names
    points[0][0] = date;
    for (int i = 0; i < playerNames.length; i++){
      points[0][i + 1] = playerNames[i];
    }
    int roundMarker = 1;
    int rowIndex = 1;
    while (roundMarker <= numRounds){
      for (int i = 0; i < numCategories; i++){
        points[rowIndex][0] = categoryNames[i];
        rowIndex++;
      }
      points[rowIndex][0] = "Round " + roundMarker.toString();
      rowIndex++;
      roundMarker++;
    }
  }
  void setPoints(int input, int column, int row){
    points[row][column] = input;
  }
}