import 'package:hive/hive.dart';

import '../Models/user_model.dart';

class ToDoDatabase {
  List toDoList = [];
  User user = User();

  // Reference the Hive box
  final Box _myBox = Hive.box("myBox");

  // Run this method first time ever opening the app
  void createInitialData() {
    toDoList = [
      [
        "Meeting with the co-founder at 11.",
        "The meeting with the co-founder will focus on discussing key business strategies, reviewing the current project status, and aligning on the next steps. The agenda includes reviewing recent milestones, addressing challenges, and exploring opportunities for future growth. Additionally, we will brainstorm new ideas and discuss resource allocation to ensure alignment on strategic goals. The meeting aims to resolve any immediate concerns and create a clear action plan with well-defined roles and responsibilities for the upcoming phase of the project.",
        false,
        "2 Oct, 24",
        "High"
      ],
      [
        "App tickets updation",
        "The task of app tickets updation involves reviewing, updating, and managing the current tickets within the application system. This includes identifying open tickets, assessing their status, and ensuring that progress is accurately reflected.",
        false,
        "3 Oct, 24",
        "Low"
      ],
    ];
    updateData("TODOLIST"); // Update the database with the initial data
  }

// Load data from the database and return it
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
    user = _myBox.get("USER");
    print(toDoList.length);
  }

  // Check if the database is empty
  bool isDataEmpty() {
    return _myBox.get("TODOLIST") == null || (toDoList.isEmpty);
  }

  // Update the database
  void updateData(String key) {
    if (key == "USER")
      _myBox.put(key, user);
    else if (key == "TODOLIST") _myBox.put(key, toDoList);
    print("success");
  }
}
