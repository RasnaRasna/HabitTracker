import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/reminder/reminder.dart';
import 'package:habits_track/reminder/reminderweekbox.dart';

import '../const.dart';

class AddReminders extends StatefulWidget {
  const AddReminders({super.key});

  @override
  State<AddReminders> createState() => _AddRemindersState();
}

class _AddRemindersState extends State<AddReminders> {
  TimeOfDay? selectedTime;

  void _showTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime dateTime) {
              setState(() {
                selectedTime = TimeOfDay.fromDateTime(dateTime);
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.cancel),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => Reminderpage()));
                },
                child: Text("Save"))
          ],
        ),
        body: ListView(children: [
          kheight10,
          const Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "New Reminder",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ],
              )),
          kheight10,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Notification title",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          kheight10,
          Center(
            child: SizedBox(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          kheight10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Notification message",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          kheight10,
          Center(
            child: SizedBox(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          kheight10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text(
                  "Time",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: _showTimePicker,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: TextEditingController(
                        text: selectedTime != null
                            ? selectedTime!.format(context)
                            : '',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          kheight20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Notify on the following week days",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          kheight10,
          Reminderweeks()
        ]));
  }
}
