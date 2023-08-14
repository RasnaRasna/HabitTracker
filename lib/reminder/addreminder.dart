import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/Firebase/notification_service.dart';
import 'package:habits_track/reminder/reminder.dart';
import 'package:habits_track/reminder/reminderweekbox.dart';
import '../const.dart';

class AddReminders extends StatefulWidget {
  const AddReminders({Key? key}) : super(key: key);

  @override
  State<AddReminders> createState() => _AddRemindersState();
}

class _AddRemindersState extends State<AddReminders> {
  final CollectionReference addReminder =
      FirebaseFirestore.instance.collection("AddReminder");
  DateTime sheduleTime = DateTime.now();

  TimeOfDay? selectedTime;
  Set<String> selectedDays = {};
  TextEditingController notificationTitleController = TextEditingController();
  TextEditingController notificationMessageController = TextEditingController();

  void _showTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: sheduleTime,
            onDateTimeChanged: (DateTime dateTime) {
              setState(() {
                sheduleTime = dateTime;
                selectedTime = TimeOfDay.fromDateTime(dateTime);
              });
            },
          ),
        );
      },
    );
  }

  // void _showDateTimePicker() async {
  //   final selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: sheduleTime,
  //     firstDate: DateTime(DateTime.now().year - 5),
  //     lastDate: DateTime(DateTime.now().year + 5),
  //   );

  //   if (selectedDate != null) {
  //     final selectedTimeOfDay = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay.fromDateTime(sheduleTime),
  //     );

  //     if (selectedTimeOfDay != null) {
  //       setState(() {
  //         sheduleTime = DateTime(
  //           selectedDate.year,
  //           selectedDate.month,
  //           selectedDate.day,
  //           selectedTimeOfDay.hour,
  //           selectedTimeOfDay.minute,
  //         );
  //         selectedTime = selectedTimeOfDay;
  //       });
  //     }
  //   }
  // }

  void toggleSelectedDay(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  Future<void> addReminders() async {
    if (selectedTime != null && selectedDays.isNotEmpty) {
      final String title = notificationTitleController.text;
      final String message = notificationMessageController.text;

      await addReminder.add({
        'Title': title,
        'selectedDays': selectedDays.toList(),
        'Time': selectedTime!.format(context),
        'NotificationMessage': message,
      });

      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const Reminderpage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Incomplete Reminder Settings"),
            content: const Text(
                "Please select both time and days for the reminder."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const Reminderpage()),
              );
            },
            icon: const Icon(Icons.cancel),
          ),
          actions: [
            TextButton(
              onPressed: () {
                addReminders();
                NotificationService().SheduleNotification(
                    title: "Sehdule Notification",
                    body: '$sheduleTime',
                    sheduleNotificationDateTime: sheduleTime);
              },
              child: const Text("Save"),
            ),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          kheight10,
          const Padding(
            padding: EdgeInsets.symmetric(
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
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: korangecolor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: notificationTitleController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
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
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: korangecolor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller:
                        notificationMessageController, // Connect controller

                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Time",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _showTimePicker,
                  //The AbsorbPointer widget ensures
                  //that the text field is not editable directly by the user.
                  child: AbsorbPointer(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: korangecolor)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: TextEditingController(
                            text: selectedTime != null
                                ? selectedTime!.format(context)
                                : '',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          kheight20,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Notify on the following week days",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Reminderweeks(
              selectedDays: selectedDays,
              onDaySelected: toggleSelectedDay,
            ),
          )
        ]));
  }
}
