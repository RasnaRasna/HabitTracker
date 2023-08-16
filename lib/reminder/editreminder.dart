import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/reminder/reminder.dart';
import 'package:habits_track/reminder/reminderweekbox.dart';

import '../const.dart';

class EditReminder extends StatefulWidget {
  final String habitName;
  final String title;
  final String message;
  final String habitId;

  final String time; // Change the type to DateTime
  final List<String> selectedDays; // Receive selected days here
  final List<Map<String, dynamic>> habitHistory; // Add this parameter

  const EditReminder({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.selectedDays,
    required this.habitHistory,
    required this.habitName,
    required this.habitId, // Include selected days in the constructor
  });

  @override
  State<EditReminder> createState() => _EditReminderState();
}

final CollectionReference editReminder =
    FirebaseFirestore.instance.collection("AddReminder");

class _EditReminderState extends State<EditReminder> {
  TimeOfDay? selectedTime;
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  Set<String> _selectedDays = {}; // Initialize an empty set for selected days

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    messageController.text = widget.message;
    _selectedDays.addAll(widget.selectedDays); // Add selected days from props
  }

  Future<void> deleteReminder() async {
    await editReminder
        .where("Title",
            isEqualTo: widget.title) // Assuming "Title" is the field to match
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  void _showTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
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

  Future<void> _updateReminder() async {
    final updatedTitle = titleController.text;
    final updatedSelectedDays = _selectedDays.toList();
    final updatedTime =
        selectedTime != null ? selectedTime!.format(context) : widget.time;
    final updatedNotificationMessage = messageController.text;

    // Fetch the current reminder document
    final querySnapshot =
        await editReminder.where("Title", isEqualTo: widget.title).get();

    // Check if any of the fields have actually changed
    bool fieldsChanged = false;
    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      if (data['Title'] != updatedTitle ||
          !ListEquality().equals(data['selectedDays'], updatedSelectedDays) ||
          data['Time'] != updatedTime ||
          data['NotificationMessage'] != updatedNotificationMessage) {
        fieldsChanged = true;
        return; // Exit the loop early if any field changed
      }
    });

    if (!fieldsChanged) {
      // Fields haven't changed, show a "Didn't Update" message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Reminder didn't change"),
        ),
      );
      return; // No need to proceed further
    }

    // Fields have changed, update the reminder
    querySnapshot.docs.forEach((doc) {
      doc.reference.update({
        'Title': updatedTitle,
        'selectedDays': updatedSelectedDays,
        'Time': updatedTime,
        'NotificationMessage': updatedNotificationMessage,
      });
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Reminder updated successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel)),
        actions: [
          TextButton(
              onPressed: () {
                _updateReminder();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (ctx) => Reminderpage(
                            habitHistory: widget.habitHistory,
                            habitName: widget.habitName,
                            habitId: widget.habitId,
                          )),
                );
              },
              child: const Text("Save"))
        ],
      ),
      body: ListView(
        children: [
          kheight10,
          const Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Edit Reminder",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ],
              )),
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
                    border: Border.all(color: lightgrey)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: titleController,
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
                    border: Border.all(color: lightgrey)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: messageController,
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
                          border: Border.all(color: lightgrey)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: TextEditingController(
                            text: selectedTime != null
                                ? selectedTime!.format(context)
                                : widget.time,
                          ),
                          readOnly: true,
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
                  selectedDays: _selectedDays, // Pass selected days here
                  onDaySelected: (day) {
                    setState(() {
                      if (_selectedDays.contains(day)) {
                        _selectedDays.remove(day);
                      } else {
                        _selectedDays.add(day);
                      }
                    });
                  })),
          kheight10,
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Center(child: Text('Delete reminder')),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Are you sure you want to delete this reminder?',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              await deleteReminder(); // Just call the function without assigning
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:
                                      Text('Reminder deleted successfully'),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => Reminderpage(
                                          habitHistory: [],
                                          habitName: widget.habitName,
                                          habitId: widget.habitId,
                                        )),
                              );
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  color: Colors.red,
                ),
              ),
              Text(
                "Delete Reminder",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ],
      ),
    );
  }
}
