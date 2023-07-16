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
  Map<String, bool> selectedHabitIds = {};
  Map<String, int> selectedDayIndices = {};

  void toggleHabitSelection(String habitId) {
    if (selectedHabitIds.containsKey(habitId)) {
      selectedHabitIds.remove(habitId);
      selectedDayIndices.remove(habitId);
    } else {
      selectedHabitIds[habitId] = true;
      selectedDayIndices[habitId] = DateTime.now().weekday - 1;
    }

    notifyListeners();
  }

  bool isHabitSelected(String habitId) {
    return selectedHabitIds.containsKey(habitId);
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
