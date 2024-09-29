import 'package:hive/hive.dart';

import '../Models/user_model.dart';

class ToDoDatabase {
  List toDoList = [];
  User user =User();

  // Reference the Hive box
  final Box _myBox = Hive.box("myBox");

  // Run this method first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Meeting with the co-founder at 11.", false],
      ["App tickets updation", false],
    ];
    updateData("TODOLIST"); // Update the database with the initial data
  }


// Load data from the database and return it
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
    user=_myBox.get("USER");
    print(toDoList.length);
  }


  // Check if the database is empty
  bool isDataEmpty() {
    return _myBox.get("TODOLIST") == null || (toDoList.isEmpty);
  }

  // Update the database
  void updateData(String key) {
    if(key=="USER") _myBox.put(key, user);
    else if (key=="TODOLIST")_myBox.put(key, toDoList);
    print("success");
  }
}
