// import 'package:flutter/material.dart';

// class MyButtonClickedProvider with ChangeNotifier {
//   Set<String> selectedHabitIds = {};

//   Map<String, Set<int>> selectedDaysMap = {};

//   void toggleHabitSelection(String habitId) {
//     if (selectedHabitIds.contains(habitId)) {
//       selectedHabitIds.remove(habitId);

//       // Clear the selected days for this habit if it was deselected
//       selectedDaysMap.remove(habitId);
//     } else {
//       selectedHabitIds.add(habitId);
//     }

//     notifyListeners();
//   }

//   bool isHabitSelected(String habitId) {
//     return selectedHabitIds.contains(habitId);
//   }

//   void setSelectedDays(String habitId, Set<int> selectedDays) {
//     selectedDaysMap[habitId] = selectedDays;
//     notifyListeners();
//   }

//   Set<int>? getSelectedDays(String habitId) {
//     return selectedDaysMap[habitId];
//   }

//   void resetHabitSelections() {
//     selectedHabitIds.clear();
//     selectedDaysMap.clear();
//     notifyListeners();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//for today page
class MyButtonClickedProvider with ChangeNotifier {
  Map<String, bool> selectedHabitIds = {};
  Map<String, int> selectedDayIndices = {};
  List<Map<String, dynamic>> habitHistory = []; // Add this line

  void toggleHabitSelection(String habitId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference habitsCollection =
        firestore.collection('add_habits');

    if (selectedHabitIds.containsKey(habitId)) {
      selectedHabitIds.remove(habitId);
      selectedDayIndices.remove(habitId);
      await habitsCollection.doc(habitId).update({
        'selected': false,
      });
    } else {
      selectedHabitIds[habitId] = true;
      selectedDayIndices[habitId] = DateTime.now().weekday - 1;
      await habitsCollection.doc(habitId).update({
        'selected': true,
        'selectedDayIndex': DateTime.now().weekday - 1,
      });
    }

    notifyListeners();
  }

  void updateHabitHistory(List<Map<String, dynamic>> newHabitHistory) {
    habitHistory = newHabitHistory;
    notifyListeners(); // Notify listeners of the change
  }

// Additional method to update isSelected state
  void updateIsSelected(int index, bool isSelected) {
    habitHistory[index]['isSelected'] =
        isSelected; // Remove the underscore here
    notifyListeners();
  }

  bool isHabitSelected(String habitId) {
    return selectedHabitIds.containsKey(habitId);
  }

  Map<String, dynamic> getHabitData(String habitId) {
    final int index =
        habitHistory.indexWhere((habit) => habit['habitId'] == habitId);
    if (index != -1) {
      return habitHistory[index];
    }
    return {}; // Return an empty map if habit not found
  }

  int? getSelectedDayIndex(String habitId) {
    return selectedDayIndices[habitId];
  }

  void setSelectedDayIndex(String habitId, int index) {
    selectedDayIndices[habitId] = index;
    notifyListeners();
  }

  void resetHabitSelections() {
    selectedHabitIds.clear();
    selectedDayIndices.clear();
    notifyListeners();
  }
}
