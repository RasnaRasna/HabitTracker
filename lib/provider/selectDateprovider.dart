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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SelectedDayProvider extends ChangeNotifier {
  int _selectedDayIndex = -1;
  final bool _isButtonClicked = false;
  int get selectedDayIndex => _selectedDayIndex;
  bool get isButtonClicked => _isButtonClicked;

  void selectDay(int index, String habitId) async {
    _selectedDayIndex = index;
    notifyListeners();

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference habitsCollection =
        firestore.collection('add_habits');

    await habitsCollection.doc(habitId).update({
      'selectedDayIndex': index,
    });
  }

  void selectCurrentDay() {
    _selectedDayIndex = DateTime.now().weekday - 1;
    notifyListeners();
  }
}
