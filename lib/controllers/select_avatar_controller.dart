import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/database.dart';

class SelectAvatarController with ChangeNotifier {
  int _index = -1;
  String _avatarUrl = "";

  // Getter for index
  int get index => _index;

  // Setter for index
  set index(int newIndex) {
    _index = newIndex;
    notifyListeners();  // Notify listeners when the value changes
  }

  // Getter for avatarUrl
  String get avatarUrl => _avatarUrl;

  // Setter for avatarUrl
  set avatarUrl(String newAvatarUrl) {
    _avatarUrl = newAvatarUrl;
    notifyListeners();  // Notify listeners when the value changes
  }

  OnboardingController() {
    // loadInitialData(); // Load initial data when the provider is created
  }
  void setIndex({required int index}){
    this.index=index;
    if (index == 0) {
      avatarUrl = "lib/images/img_5.png";
    } else if (index == 1) {
      avatarUrl = "lib/images/img_4.png";
    } else if (index == 2) {
      avatarUrl = "lib/images/img_6.png";
    } else if (index == 3) {
      avatarUrl = "lib/images/img_1.png";
    }
  }
}
