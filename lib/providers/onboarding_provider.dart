import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void nextScreen() {
    _currentIndex++;
    notifyListeners();
  }

  void skip() {
    _currentIndex = 2;
    notifyListeners();
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
