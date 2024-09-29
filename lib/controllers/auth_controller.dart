import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_todo/Models/user_model.dart';

import '../data/database.dart';
import '../utils/dialog_box.dart';

class AuthController with ChangeNotifier {
  //reference the hive box
  final _myBox = Hive.box("myBox");

  ToDoDatabase db = ToDoDatabase();
  List toDoList = [];
  User user=User();

  AuthController() {
    // loadInitialData(); // Load initial data when the provider is created
  }

  void createUser({required String name,required String avatar}) {
    if (_myBox.get("USER") == null) {
      create(name: name,avatar: avatar);
    } else {
      //already exist data
      create(name: name,avatar: avatar);
      loadData();
    }
  }

  void create({required String name,required String avatar}) {
    db.user=User(name: name,avatar: avatar);
    db.updateData("USER"); // Update the data in the database
    user=db.user;
    notifyListeners();
  }

  void loadData() {
    db.loadData();
    user=db.user;
    notifyListeners();
  }

  void checkBoxTapped({bool? value, int index=1}) {
    db.toDoList[index][1] = !db.toDoList[index][1]; // Toggle the completed state
    db.updateData("USER"); // Update the data in the database
    toDoList=db.toDoList;
    notifyListeners(); // Notify listeners about the change
  }

  void onSave(String taskText, BuildContext context) {
    db.toDoList.add([taskText, false]); // Add new task
    db.updateData("USER"); // Update the data in the database
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
          onSave: () => onSave(controller.text, context),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    db.toDoList.removeAt(index); // Remove the task
    db.updateData("USER"); // Update the data in the database
    toDoList=db.toDoList;
    notifyListeners(); // Notify listeners about the change
  }
}
