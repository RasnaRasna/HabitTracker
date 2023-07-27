// // import 'package:flutter/material.dart';

// // class HabitCompletionProvider extends ChangeNotifier {
// //   List<Map<String, dynamic>> _habitHistory = [];

// //   List<Map<String, dynamic>> get habitHistory => _habitHistory;

// //   void setHabitHistory(List<Map<String, dynamic>> history) {
// //     _habitHistory = history;
// //     notifyListeners();
// //   }
// // }

// import 'package:flutter/material.dart';

// class HabitCompletionProvider extends ChangeNotifier {
//   // A map to store the completion status for each habit
//   final Map<String, bool> _habitCompletionStatus = {};

//   // A map to store the notes for each habit
//   final Map<String, String> _habitNotes = {};

//   // A map to store the selected day index for each habit
//   final Map<String, int> _habitSelectedDayIndex = {};

//   // Returns true if the habit with the given habitId is completed
//   bool isHabitCompleted(String habitId) {
//     return _habitCompletionStatus[habitId] ?? false;
//   }

//   // Returns the notes for the habit with the given habitId
//   String getHabitNotes(String habitId) {
//     return _habitNotes[habitId] ?? '';
//   }

//   // Returns the selected day index for the habit with the given habitId
//   int? getSelectedDayIndex(String habitId) {
//     return _habitSelectedDayIndex[habitId];
//   }

//   // Updates the completion status and notes for the habit with the given habitId
//   void updateHabitCompletion(String habitId, bool isCompleted, String notes) {
//     _habitCompletionStatus[habitId] = isCompleted;
//     _habitNotes[habitId] = notes;
//     notifyListeners();
//   }

//   // Sets the selected day index for the habit with the given habitId
//   void setSelectedDayIndex(String habitId, int dayIndex) {
//     _habitSelectedDayIndex[habitId] = dayIndex;
//     notifyListeners();
//   }

//   // Toggles the selection of the habit with the given habitId
//   // If a day is selected, it removes the selection
//   // If no day is selected, it selects the current day or some default day
//   void toggleHabitSelection(String habitId) {
//     if (_habitSelectedDayIndex[habitId] != null) {
//       // A day is already selected, so remove the selection
//       _habitSelectedDayIndex.remove(habitId);
//     } else {
//       // No day is selected, so set the selected day index to the current day index or some default value
//       _habitSelectedDayIndex[habitId] = DateTime.now().weekday - 1;
//     }
//     notifyListeners();
//   }
// }
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HabitCompletionProvider extends ChangeNotifier {
  Map<String, bool> _habitCompletions = {};

  // Getter for habitCompletions
  Map<String, bool> get habitCompletions => _habitCompletions;

  // Stream controller for habit completions
  final StreamController<Map<String, bool>> _habitCompletionController =
      StreamController<Map<String, bool>>.broadcast();

  // Stream getter
  Stream<Map<String, bool>> get habitCompletionStream =>
      _habitCompletionController.stream;

  // Fetch habit completions from Firestore
  Future<void> fetchHabitCompletions() async {
    try {
      final QuerySnapshot habitCompletionSnapshot =
          await FirebaseFirestore.instance.collection('history').get();

      final habitCompletions = Map<String, bool>();
      habitCompletionSnapshot.docs.forEach((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final String habitId = data['habitId'] as String;
        final bool isSelected = data['isSelected'] as bool;
        habitCompletions[habitId] = isSelected;
      });
      // Print the fetched documents for debugging
      habitCompletionSnapshot.docs.forEach((doc) {
        print(
            'Habit ID: ${doc['habitId']}, Completion Date: ${doc['completionDate']}monthbase');
      });
      // Update the habit completions map and notify listeners
      _habitCompletions = habitCompletions;
      _habitCompletionController.add(habitCompletions);
    } catch (e) {
      print('Error fetching habit completions: $e');
    }
  }

  // Dispose method to close the stream controller
  void dispose() {
    _habitCompletionController.close();
  }
}
