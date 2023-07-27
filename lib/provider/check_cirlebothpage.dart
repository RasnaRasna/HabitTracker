import 'package:flutter/material.dart';

class SelectedDaysProvider with ChangeNotifier {
  List<DateTime> _selectedDays = [];

  List<DateTime> get selectedDays => _selectedDays;

  void toggleSelectedDay(DateTime date) {
    if (_selectedDays.contains(date)) {
      _selectedDays.remove(date);
    } else {
      _selectedDays.add(date);
    }
    notifyListeners();
  }
}
