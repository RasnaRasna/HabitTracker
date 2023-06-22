import 'package:flutter/material.dart';
import 'package:habits_track/addhabits.dart/add_habits.dart';
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Addhabits()));
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
                    MaterialPageRoute(builder: (ctx) => const AddReminders()));
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
      body: ListView.separated(
        itemCount: 5, // Replace with the actual item count
        separatorBuilder: (BuildContext context, int index) => kheight10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Notification will be sent if you haven't completed your habit. In the case of non-daily weekly goals, you won't receive any more notifications this week.",
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(255, 229, 113, 151)),
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text('🔔   11:30 PM'),
              subtitle: Text.rich(
                TextSpan(
                  text: 'Mon-Tue-Wed-Thu-Fri-Sat-Sun \n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '📚 Read',
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => EditReminder()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
