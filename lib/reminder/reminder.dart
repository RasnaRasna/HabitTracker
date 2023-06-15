import 'package:flutter/material.dart';
import 'package:habits_track/addhabits.dart/add_habits.dart';
import 'package:habits_track/reminder/addreminder.dart';

class Reminderpage extends StatelessWidget {
  const Reminderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Addhabits()));
            },
            child: Icon(
              Icons.arrow_back, // add custom icons also
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => AddReminders()));
                  },
                  child: const Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                )),
          ],
          centerTitle: true,
          title: Text("Reminders"),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      "Notification will be sent if you habve’tcompleted your habit.In the case of non-daily weekly goals,you wont,treceive any more  notoficatios this week."),
                ),
              ],
            )
          ],
        ));
  }
}
