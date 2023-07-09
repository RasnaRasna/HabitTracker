import 'package:flutter/material.dart';

class IconColorchangeprovider extends ChangeNotifier {
  Map<int, bool> showAdditionalButtonMap = {};

  void updateColor(int index) {
    if (showAdditionalButtonMap.containsKey(index)) {
      final currentVisibility = showAdditionalButtonMap[index];
      showAdditionalButtonMap[index] = currentVisibility!;
    } else {
      showAdditionalButtonMap[index] = true;
    }
    notifyListeners();
  }

  bool isAdditionalButtonVisible(int index) {
    return showAdditionalButtonMap[index] ?? false;
  }
}
