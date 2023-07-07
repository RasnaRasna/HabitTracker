// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class MyButtonClickedProvider with ChangeNotifier {
//   List<bool> _buttonClickedList = [];
//   final CollectionReference Addhabits =
//       FirebaseFirestore.instance.collection("add_habits");
//   List<bool> get buttonClickedList => _buttonClickedList;

//   MyButtonClickedProvider(int length) {
//     _buttonClickedList = List.generate(length, (_) => false);
//     _resetButtonStateAtMidnight();
//   }

//   void _resetButtonStateAtMidnight() {
//     Timer.periodic(Duration(days: 1), (timer) {
//       final currentTime = DateTime.now();
//       if (currentTime.hour == 0 && currentTime.minute == 0) {
//         _resetButtonState();
//       }
//     });
//   }

//   void _resetButtonState() {
//     _buttonClickedList = List.generate(_buttonClickedList.length, (_) => false);
//     notifyListeners();
//   }

//   void toggleButtonClicked(int index) {
//     _buttonClickedList[index] = !_buttonClickedList[index];
//     notifyListeners();
//   }

//   bool isButtonClicked(int index) {
//     return _buttonClickedList[index];
//   }
// }
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyButtonClickedProvider with ChangeNotifier {
  List<bool> _buttonClickedList = [];
  final CollectionReference Addhabits =
      FirebaseFirestore.instance.collection("add_habits");
  List<bool> get buttonClickedList => _buttonClickedList;

  MyButtonClickedProvider() {
    _fetchDataAndInitialize();
    _resetButtonStateAtMidnight();
  }

  Future<void> _fetchDataAndInitialize() async {
    final snapshot = await Addhabits.get();
    final habitItems = snapshot.docs;
    final length = habitItems.length;
    _buttonClickedList = List.generate(length, (_) => false);
    notifyListeners();
  }

  void _resetButtonStateAtMidnight() {
    Timer.periodic(Duration(days: 1), (timer) {
      final currentTime = DateTime.now();
      if (currentTime.hour == 0 && currentTime.minute == 0) {
        _resetButtonState();
      }
    });
  }

  void _resetButtonState() {
    _buttonClickedList = List.generate(_buttonClickedList.length, (_) => false);
    notifyListeners();
  }

  void toggleButtonClicked(int index) {
    _buttonClickedList[index] = !_buttonClickedList[index];
    notifyListeners();
  }

  bool isButtonClicked(int index) {
    if (index < 0 || index >= _buttonClickedList.length) {
      return false;
    }
    return _buttonClickedList[index];
  }
}
