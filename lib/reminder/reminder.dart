import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:habits_track/addhabits/add_habits.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/reminder/addreminder.dart';
import 'package:habits_track/reminder/editreminder.dart';

class Reminderpage extends StatelessWidget {
  final String habitName;
  final int? daysPerWeek;
  final DateTime? startDate;
  final String habitId;
  final List<Map<String, dynamic>> habitHistory; // Add this parameter

  const Reminderpage({
    Key? key,
    required this.habitName,
    this.daysPerWeek,
    this.startDate,
    required this.habitId,
    required this.habitHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => bottombar(
                        startDate: startDate, habitHistory: habitHistory)));
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (ctx) => AddReminders(
                            habitHistory: habitHistory,
                            habitName: habitName,
                            habitId: habitId,
                          )),
                );
              },
              child: const Icon(
                Icons.add,
                size: 26.0,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text("Reminders"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('AddReminder')
            .where('habitId', isEqualTo: habitId) // Filter by habitId
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final reminders = snapshot.data!.docs;

          return ListView.separated(
            itemCount: reminders.length + 1,
            separatorBuilder: (BuildContext context, int index) => kheight10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Notification will be sent if you haven't completed your habit. In the case of non-daily weekly goals, you won't receive any more notifications this week.",
                  ),
                );
              }

              final reminderData =
                  reminders[index - 1].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: korangecolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text('🔔   ${reminderData['Time']}'),
                  subtitle: Text.rich(
                    TextSpan(
                      text: '${reminderData['selectedDays'].join("-")} \n',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '${reminderData['NotificationMessage']}',
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => EditReminder(
                          habitName: habitName,
                          habitHistory: habitHistory,
                          title: reminderData['Title'],
                          message: reminderData['NotificationMessage'],
                          time: reminderData['Time'],
                          selectedDays:
                              List<String>.from(reminderData['selectedDays']),
                          habitId: habitId,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
