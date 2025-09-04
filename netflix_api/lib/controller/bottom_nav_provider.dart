import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  int currentIndex = 0;


  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
