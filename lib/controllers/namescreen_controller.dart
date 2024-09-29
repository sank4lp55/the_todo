import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/database.dart';

class NamescreenController with ChangeNotifier {
  bool _isFieldEmpty=true;

  // Getter for count
  bool get isFieldEmpty => _isFieldEmpty;

  // Setter for count
  set isFieldEmpty(bool isFieldEmpty) {
    _isFieldEmpty = isFieldEmpty;
    notifyListeners();  // Notify listeners when the value changes
  }

  NamescreenController() {
    // loadInitialData(); // Load initial data when the provider is created
  }
  void setIsFieldEmpty({required bool isFieldEmpty}){
    this.isFieldEmpty=isFieldEmpty;
  }
}
