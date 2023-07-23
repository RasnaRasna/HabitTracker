import 'package:flutter/material.dart';

class HabitCompletionProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _habitHistory = [];

  List<Map<String, dynamic>> get habitHistory => _habitHistory;

  void setHabitHistory(List<Map<String, dynamic>> history) {
    _habitHistory = history;
    notifyListeners();
  }
}
