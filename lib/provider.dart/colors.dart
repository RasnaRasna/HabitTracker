import 'package:flutter/material.dart';

class IconColorchangeprovider extends ChangeNotifier {
  var iconcolor = Colors.grey;

  void updatecolor() {
    if (iconcolor == Colors.grey) {
      iconcolor = Colors.amber;
    } else {
      iconcolor = Colors.grey;
    }
    notifyListeners();
  }
}
