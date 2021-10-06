//I will read in the String type of the object we're encoding so we know what folder to put the file in
// Convert the object into JSON, then store it in a file with it's name.
// How do I tell the app what I already have in the files?
// Right when the app starts, pull all the game data in?
// How do I rewrite over an existing file?

import 'dart:io';

class JsonSerializer {
  bool convertScoresheetToJson(Object object, String name) {
    File file = new File("Scoresheets/" + name);

    return false;
  }
  bool convertGameHistoryToJson(Object object, String name, String date) {
    File file = new File("/");
    return false;
  }
  Object convertFromJson() {
    return null;
  }
}