// import 'package:flutter/material.dart';

// class Checkboxprovider extends ChangeNotifier {
//   bool checkboxstate = false;
//   void updatecheckboxstate(value) {
//     checkboxstate = value;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class CheckboxProvider extends ChangeNotifier {
  List<bool> checkboxStates = [];

  void initializeCheckboxStates(int count) {
    checkboxStates = List.generate(count, (_) => false);
    notifyListeners();
  }

  void updateCheckboxState(int index, bool value) {
    checkboxStates[index] = value;
    notifyListeners();
  }
}
