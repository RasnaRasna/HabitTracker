import 'package:flutter/material.dart';

class CompletedCountProvider extends ChangeNotifier {
  int _completedCount = 0;

  int get completedCount => _completedCount;

  void increment() {
    _completedCount++;
    notifyListeners();
  }

  void decrement() {
    _completedCount--;
    notifyListeners();
  }
}
