import 'package:flutter/material.dart';

class IconColorchangeprovider extends ChangeNotifier {
  Map<String, Map<int, bool>> habitShowAdditionalButtonMap = {};

  // Add a method to set the visibility map
  void setVisibilityMap(Map<String, Map<int, bool>> visibilityMap) {
    habitShowAdditionalButtonMap = visibilityMap;
  }

  void toggleAdditionalButtonVisibility(String habitId, int index) {
    if (!habitShowAdditionalButtonMap.containsKey(habitId)) {
      habitShowAdditionalButtonMap[habitId] = {};
    }

    if (habitShowAdditionalButtonMap[habitId]!.containsKey(index)) {
      final currentVisibility = habitShowAdditionalButtonMap[habitId]![index];
      habitShowAdditionalButtonMap[habitId]![index] = !currentVisibility!;
    } else {
      habitShowAdditionalButtonMap[habitId]![index] = true;
    }

    notifyListeners();
  }

  bool isAdditionalButtonVisible(String habitId, int index) {
    if (habitShowAdditionalButtonMap.containsKey(habitId) &&
        habitShowAdditionalButtonMap[habitId]!.containsKey(index)) {
      return habitShowAdditionalButtonMap[habitId]![index]!;
    } else {
      return false;
    }
  }
}
