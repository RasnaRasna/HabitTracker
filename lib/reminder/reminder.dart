import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:habits_track/addhabits/add_habits.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/reminder/addreminder.dart';
import 'package:habits_track/reminder/editreminder.dart';

class Reminderpage extends StatelessWidget {
  const Reminderpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => Addhabits(
                habitHistory: [],
              ),
            ));
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
                  MaterialPageRoute(builder: (ctx) => const AddReminders()),
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
        stream:
            FirebaseFirestore.instance.collection('AddReminder').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          if (!snapshot.hasData) {
            return Center(
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
                          title: reminderData['Title'],
                          message: reminderData[
                              'NotificationMessage'], // Use 'NotificationMessage' key
                          time: reminderData['Time'],
                          selectedDays: List<String>.from(reminderData[
                              'selectedDays']), // Pass selected days here
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
