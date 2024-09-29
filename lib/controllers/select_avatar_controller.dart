import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/database.dart';

class SelectAvatarController with ChangeNotifier {
  int _index = -1;

  // Getter for count
  int get index => _index;

  // Setter for count
  set index(int newIndex) {
    _index = newIndex;
    notifyListeners();  // Notify listeners when the value changes
  }

  OnboardingController() {
    // loadInitialData(); // Load initial data when the provider is created
  }
  void setIndex({required int index}){
    this.index=index;
  }
}
