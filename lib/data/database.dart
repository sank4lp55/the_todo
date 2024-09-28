import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  // Reference the Hive box
  final Box _myBox = Hive.box("myBox");

  // Run this method first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Meeting with the co-founder at 11.", false],
      ["App tickets updation", false],
    ];
    updateData(); // Update the database with the initial data
  }


// Load data from the database and return it
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
    print(toDoList.length);
  }


  // Check if the database is empty
  bool isDataEmpty() {
    return _myBox.get("TODOLIST") == null || (toDoList.isEmpty);
  }

  // Update the database
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
    print("success");
  }
}
