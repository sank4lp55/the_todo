import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data/database.dart';
import '../utils/dialog_box.dart';

class TodoProvider with ChangeNotifier {
  //reference the hive box
  final _myBox = Hive.box("myBox");

  ToDoDatabase db = ToDoDatabase();
  List toDoList = [];

  TodoProvider() {
    loadInitialData(); // Load initial data when the provider is created
  }

  void loadInitialData() {
    if (_myBox.get("TODOLIST") == null) {
      createInitialData();
    } else {
      //already exist data
      loadData();
    }
  }

  void createInitialData() {
    db.createInitialData();
    toDoList=db.toDoList;
    notifyListeners();
  }

  void loadData() {
   db.loadData();
   toDoList=db.toDoList;
    notifyListeners();
  }

  void checkBoxTapped({bool? value, int index=1}) {
    db.toDoList[index][2] = !db.toDoList[index][2]; // Toggle the completed state
    db.updateData("TODOLIST"); // Update the data in the database
    toDoList=db.toDoList;
    notifyListeners(); // Notify listeners about the change
  }

  void onSave(String taskTitle,String taskDescription,String date,String priority, BuildContext context) {
    db.toDoList.add([taskTitle,taskDescription, false,date,priority]); // Add new task
    db.updateData("TODOLIST"); // Update the data in the database
    toDoList=db.toDoList;
    notifyListeners(); // Notify listeners about the change
    Navigator.of(context).pop(); // Close the dialog
    Fluttertoast.showToast(msg:"Task added to the list!");
  }

  void createNewTask(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: () => onSave(controller.text,"","","", context),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    db.toDoList.removeAt(index); // Remove the task
    db.updateData("TODOLIST"); // Update the data in the database
    toDoList=db.toDoList;
    notifyListeners(); // Notify listeners about the change
  }
}
