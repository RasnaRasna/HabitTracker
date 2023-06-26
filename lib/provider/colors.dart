// import 'package:flutter/material.dart';

// class IconColorchangeprovider extends ChangeNotifier {
//   var iconcolor = Colors.grey;

//   void updatecolor() {
//     if (iconcolor == Colors.grey) {
//       iconcolor = Colors.green;
//     } else {
//       iconcolor = Colors.grey;
//     }
//     notifyListeners();
//   }
// }

// import 'package:flutter/material.dart';

// class IconColorchangeprovider extends ChangeNotifier {
//   Map<int, Color> iconColors = {};

//   void updateColor(int index) {
//     if (iconColors.containsKey(index)) {
//       final currentColor = iconColors[index];
//       iconColors[index] =
//           (currentColor == Colors.grey) ? Colors.green : Colors.grey;
//     } else {
//       iconColors[index] = Colors.green;
//     }
//     notifyListeners();
//   }

//   Color getIconColor(int index) {
//     return iconColors[index] ?? Colors.grey;
//   }
// }
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
