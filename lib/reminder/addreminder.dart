import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/Firebase/notification_service.dart';
import 'package:habits_track/reminder/reminder.dart';
import 'package:habits_track/reminder/reminderweekbox.dart';
import '../const.dart';

class AddReminders extends StatefulWidget {
  final String? habitName;
  final String habitId;
  final List<Map<String, dynamic>> habitHistory; // Add this parameter

  const AddReminders(
      {Key? key,
      this.habitName,
      required this.habitId,
      required this.habitHistory})
      : super(key: key);

  @override
  State<AddReminders> createState() => _AddRemindersState();
}

class _AddRemindersState extends State<AddReminders> {
  final CollectionReference addReminder =
      FirebaseFirestore.instance.collection("AddReminder");
  DateTime sheduleTime = DateTime.now();

  TimeOfDay? selectedTime =
      TimeOfDay.fromDateTime(DateTime.now()); // Initialize with current time
  Set<String> selectedDays = {};
  TextEditingController notificationTitleController = TextEditingController();
  TextEditingController notificationMessageController = TextEditingController();

  void _showTimePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200.0,
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
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void toggleSelectedDay(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  Future<void> _scheduleRemindersOnSelectedDays() async {
    for (String day in selectedDays) {
      int dayIndex = DateTime.now().weekday;

      // Map the selected day to its index (0 = Monday, 6 = Sunday)
      switch (day.toLowerCase()) {
        case 'monday':
          dayIndex = 1;
          break;
        case 'tuesday':
          dayIndex = 2;
          break;
        case 'wednesday':
          dayIndex = 3;
          break;
        case 'thursday':
          dayIndex = 4;
          break;
        case 'friday':
          dayIndex = 5;
          break;
        case 'saturday':
          dayIndex = 6;
          break;
        case 'sunday':
          dayIndex = 7;
          break;
      }

      // Calculate the number of days to add to get to the selected day
      int daysToAdd = dayIndex - DateTime.now().weekday;
      if (daysToAdd <= 0) {
        daysToAdd += 7;
      }

      // Calculate the scheduledDateTime for the selected day and time
      DateTime scheduledDateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + daysToAdd,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      // Schedule the reminder for the calculated date and time
      NotificationService().sheduleNotification(
        title: notificationTitleController.text,
        body: notificationMessageController.text,
        sheduleNotificationDateTime: scheduledDateTime,
      );
    }
  }

  Future<void> addReminders() async {
    if (selectedTime != null && selectedDays.isNotEmpty) {
      DateTime currentTime = DateTime.now();
      DateTime selectedDateTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day + 1,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      if (selectedDateTime.isBefore(currentTime)) {
        // The selected time is in the past
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Invalid Time"),
              content: const Text(
                "Please select a future time for the reminder.",
              ),
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
        return; // Do not proceed with saving
      }

      final String title = notificationTitleController.text;
      final String message = notificationMessageController.text;

      await addReminder.add({
        'Title': title,
        'habitName': widget.habitName!, // Add the habitName here
        'habitId': widget.habitId,
        'selectedDays': selectedDays.toList(),
        'Time': selectedTime!.format(context),
        'NotificationMessage': message,
      });
      // await _scheduleRemindersOnSelectedDays();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => Reminderpage(
            habitName: widget.habitName!, // Pass the habitName
            habitHistory: widget.habitHistory,
            habitId: widget.habitId, // Pass the habitId
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Incomplete Reminder Settings"),
            content: const Text(
              "Please select both time and days for the reminder.",
            ),
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
  void initState() {
    super.initState();
    notificationTitleController.text = 'Reminder'; // Set default title
    notificationMessageController.text =
        widget.habitName!; // Set default message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (ctx) => Reminderpage(
                          habitHistory: widget.habitHistory,
                          habitName: widget.habitName!,
                          habitId: widget.habitId,
                        )),
              );
            },
            icon: const Icon(Icons.cancel),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _scheduleRemindersOnSelectedDays();
                addReminders();
                NotificationService().sheduleNotification(
                    title: notificationTitleController.text,
                    body: notificationMessageController.text,
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
                    " New Reminder",
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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

                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
