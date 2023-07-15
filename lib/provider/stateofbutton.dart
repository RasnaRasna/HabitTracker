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
import 'package:flutter/material.dart';

class MyButtonClickedProvider with ChangeNotifier {
  Set<String> selectedHabitIds = {};
  Map<String, Set<int>> selectedDaysMap = {};
  int selectedDayIndex = DateTime.now().weekday - 1;

  void toggleHabitSelection(String habitId) {
    if (selectedHabitIds.contains(habitId)) {
      selectedHabitIds.remove(habitId);

      // Clear the selected days for this habit if it was deselected
      selectedDaysMap.remove(habitId);

      // Update the selected day index if the current day was deselected
      if (selectedDayIndex == DateTime.now().weekday - 1) {
        selectedDayIndex = -1;
      }
    } else {
      selectedHabitIds.add(habitId);

      // Set the selected day index when a habit is selected
      selectedDayIndex = DateTime.now().weekday - 1;
    }

    notifyListeners();
  }

  bool isHabitSelected(String habitId) {
    return selectedHabitIds.contains(habitId);
  }

  void setSelectedDays(String habitId, Set<int> selectedDays) {
    selectedDaysMap[habitId] = selectedDays;
    notifyListeners();
  }

  Set<int>? getSelectedDays(String habitId) {
    return selectedDaysMap[habitId];
  }

  void resetHabitSelections() {
    selectedHabitIds.clear();
    selectedDaysMap.clear();
    notifyListeners();
  }
}
