import 'package:flutter/material.dart';

class ClickedStateProvider extends ChangeNotifier {
  List<ValueNotifier<bool>> buttonClickedList = [];

  void initializeButtonClickedList(int length) {
    buttonClickedList =
        List.generate(length, (_) => ValueNotifier<bool>(false));
  }

  void toggleClickedState(int index) {
    if (index >= 0 && index < buttonClickedList.length) {
      buttonClickedList[index].value = !buttonClickedList[index].value;
      notifyListeners();
    }
  }
}
