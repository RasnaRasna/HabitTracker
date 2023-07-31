import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class HabitCompletionProvider extends ChangeNotifier {
  Map<DateTime, bool> _habitCompletionData = {};

  Map<DateTime, bool> get habitCompletionData => _habitCompletionData;

  void markCompletion(DateTime date, bool isCompleted) {
    _habitCompletionData[date] = isCompleted;
    notifyListeners();
  }
}
