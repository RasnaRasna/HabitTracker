import 'package:flutter/material.dart';

class GenderProvider with ChangeNotifier {
  String? _selectedGender;
  String _name = "";

  String? get selectedGender => _selectedGender;
  String get name => _name;

  void setGender(String? gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
