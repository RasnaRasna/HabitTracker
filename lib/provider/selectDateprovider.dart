// import 'package:flutter/material.dart';

// class SelectedDayProvider extends ChangeNotifier {
//   int _selectedDayIndex = -1;
//   final bool _isButtonClicked = false;
//   int get selectedDayIndex => _selectedDayIndex;
//   bool get isButtonClicked => _isButtonClicked;

//   void selectDay(int index) {
//     _selectedDayIndex = index;
//     notifyListeners();
//   }

//   void selectCurrentDay() {
//     _selectedDayIndex = DateTime.now().weekday - 1;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class SelectedDayProvider extends ChangeNotifier {
  int _selectedDayIndex = -1;
  final bool _isButtonClicked = false;
  int get selectedDayIndex => _selectedDayIndex;
  bool get isButtonClicked => _isButtonClicked;

  void selectDay(int index) {
    _selectedDayIndex = index;
    notifyListeners();
  }

  void selectCurrentDay() {
    _selectedDayIndex = DateTime.now().weekday - 1;
    notifyListeners();
  }
}
