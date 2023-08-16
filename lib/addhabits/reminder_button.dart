import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../reminder/reminder.dart';

class ReminderButton extends StatelessWidget {
  final String habitName;
  final bool isFormValid;

  final String habitId; // Pass the habitId to the widget
  const ReminderButton(
      {super.key,
      required this.habitId,
      required this.isFormValid,
      required this.habitData,
      required this.habitName});
  final QueryDocumentSnapshot<Object?> habitData; // Add this parameter

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isFormValid) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => Reminderpage(
                    habitId: habitId,
                    habitHistory: [],
                    habitName: habitName,
                  )));
        } else {
          // Show a pop-up dialog if form is not valid
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Incomplete Form'),
                content: const Text('Please fill in all required fields.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('AddReminder')
            .where('habitId', isEqualTo: habitId) // Filter based on habitId
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (!snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: kredcolor),
              ),
              width: 350,
              height: 50,
              child: Center(
                child: Text(
                  '0 Reminders',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            );
          }

          final reminders = snapshot.data!.docs;
          int reminderCount = reminders.length; // Get the count of reminders

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: kredcolor),
            ),
            width: 350,
            height: 50,
            child: Center(
              child: Text(
                '$reminderCount Reminder${reminderCount != 1 ? 's' : ''}',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
