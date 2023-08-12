import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../reminder/reminder.dart';

class ReminderButton extends StatelessWidget {
  const ReminderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => const Reminderpage()),
        );
      },
      child: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('AddReminder').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          final reminders = snapshot.data!.docs;
          int reminderCount = reminders.length; // Get the count of reminders

          return Row(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: kredcolor),
              ),
              width: 350,
              height: 50,
              child: Center(
                child: Text(
                  '$reminderCount Reminder${reminderCount != 1 ? 's' : ''}', // Pluralize if count is not 1
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
