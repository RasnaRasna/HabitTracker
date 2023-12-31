import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/addhabits/weekbox.dart';
import 'package:habits_track/bottom_pages/Today/today.dart';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';

import '../Firebase/delet.dart';
import '../Firebase/update.dart';
import '../reminder/reminder.dart';

class HabitEdit extends StatefulWidget {
  final String? documentId;
  final String? habitName;
  final int? daysPerWeek;
  final DateTime? startDate;
  final List<Map<String, dynamic>> habitHistory; // Add this parameter

  final QueryDocumentSnapshot<Object?> habitData; // Add this parameter

  const HabitEdit({
    super.key,
    this.habitName,
    this.daysPerWeek,
    this.startDate,
    this.documentId,
    required this.habitData,
    required this.habitHistory,
  });

  @override
  State<HabitEdit> createState() => _HabitEditState();
}

class _HabitEditState extends State<HabitEdit> {
  DateTime? selectedDate;
  int reminderCount = 0; // Initialize with 0

  String? selectedHabit;
  int selectedDaysPerWeek = -1;
  TextEditingController habitNameController = TextEditingController();

  final CollectionReference habitsTemplates =
      FirebaseFirestore.instance.collection("HabitsTemplates");
  // final CollectionReference Addhabits =
  //     FirebaseFirestore.instance.collection("add_habits");

  @override
  void initState() {
    super.initState();
    final String habitId = widget.habitData.id; // Get the habit ID

    FirebaseFirestore.instance
        .collection('AddReminder')
        .where('habitId', isEqualTo: habitId) // Filter based on habitId
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        reminderCount = querySnapshot.docs.length; // Calculate reminder count
      });
    });
    print('Document ID: ${widget.documentId}');
    print("habit history in editpage${widget.habitHistory}");

    // Set the initial values from the widget arguments
    selectedHabit = widget.habitName;
    selectedDaysPerWeek = widget.daysPerWeek ?? -1;
    selectedDate = widget.startDate;
    habitNameController.text = selectedHabit ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Center(child: Text(' Warning')),
              content: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('If you made changes, they will\n be discarded'),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the alert dialog
                    Navigator.pop(
                        context); // Navigate back to the previous screen
                  },
                  child: const Text(
                    'Discard changes',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          child: const Icon(
            Icons.cancel_sharp,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                bool success = await updateHabitData(widget.documentId!,
                    selectedHabit, selectedDaysPerWeek, selectedDate);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Habit updated successfully'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MyHomePageToday(
                        habitHistory: widget.habitHistory,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Failed to update habit'),
                    ),
                  );
                }
              },
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ))
        ],
        title: const Text(
          "Edit habit",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            kheight10,
            const Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Habbit Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ],
                )),
            kheight10,
            Center(
              child: SizedBox(
                // width: 350,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 236, 137, 170))),
                  child: TextField(
                    controller: habitNameController,
                    onChanged: (value) {
                      setState(() {
                        selectedHabit = value;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        hintText: selectedHabit,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
            ),
            kheight10,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Templates",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            kheight10,
            StreamBuilder(
              stream: habitsTemplates.snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 50, // Specify a fixed height for the ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot templates =
                            snapshot.data!.docs[index];
                        return Row(
                          children: [
                            const SizedBox(
                                // width: 10,
                                // height: 10,
                                ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedHabit = templates["habit Name"];
                                  habitNameController.text =
                                      selectedHabit ?? '';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 229, 113, 151),
                                  ),
                                ),
                                width: 130,
                                child: Center(
                                  child: Text(
                                    templates['habit Name'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
                return const Text(
                    "No templates"); // Return a widget when snapshot does not have data
              },
            ),
            kheight10,
            const Text(
              "How many days per Week should you complete that habit? ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            kheight10,
            SelectableContainer(
              selectedIndex: selectedDaysPerWeek - 1,
              onSelected: (Index) {
                setState(() {
                  selectedDaysPerWeek = Index + 1;
                });
              },
            ),
            kheight10,
            const Text(
              "Start Date ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            kheight10,
            GestureDetector(
              onTap: () {
                _showDatePicker(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 229, 113, 151))),
                width: 350,
                height: 50,
                child: Center(
                  child: Text(
                    selectedDate != null
                        ? getFormattedDate(selectedDate!)
                        : 'Select Date',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            kheight10,
            const Text(
              "Reminders  ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            kheight10,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => Reminderpage(
                              habitName: widget.habitName!,
                              habitHistory: widget.habitHistory,
                              habitId: widget.habitData.id,
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 229, 113, 151))),
                width: 350,
                height: 50,
                child: Center(
                  child: Text(
                    ' Reminders (${reminderCount.toString()})',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            kheight20,
            deletbutton(context),
          ],
        ),
      ),
    );
  }

  Column deletbutton(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Center(child: Text('Delete Habit')),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Are you sure you want to delete this habit $selectedHabit?',
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
                          bool success = await deleteHabit(widget.documentId!);
                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                    'Habit and associated history deleted successfully'),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => MyHomePageToday(
                                  habitHistory: widget.habitHistory,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to delete habit'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
            ),
            const Text(
              "Delete Habit",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? newDate;
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 216,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate ?? DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  newDate = newDateTime;
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (newDate != null) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  }
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String getFormattedDate(DateTime date) {
    final formatter = DateFormat('d-MMMM-yyyy');
    return formatter.format(date);
  }

  // void updateHabitData(String documentId) async {
  //   try {
  //     await Addhabits.doc(documentId).update({
  //       'name': selectedHabit,
  //       'daysPerWeek': selectedDaysPerWeek + 1,
  //       'startDate': Timestamp.fromDate(selectedDate!),
  //     });
  //     // Display a success message or navigate to a new screen
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text('Habit updated successfully'),
  //       ),
  //     );
  //   } catch (e) {
  //     print('Error updating habit data: $e');
  //     // Display an error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text('Failed to update habit'),
  //       ),
  //     );
  //   }
  // }

  // void deleteHabit(String documentId) async {
  //   try {
  //     // Get the habit data to retrieve the habit ID
  //     final habitSnapshot = await Addhabits.doc(documentId).get();
  //     final habitData = habitSnapshot.data() as Map<String, dynamic>;

  //     // Delete the habit
  //     await Addhabits.doc(documentId).delete();

  //     // Delete the associated history
  //     final historySnapshot = await FirebaseFirestore.instance
  //         .collection('history')
  //         .where('habitId',
  //             isEqualTo:
  //                 documentId) // Use the documentId directly as the habitId
  //         .get();

  //     // Delete each history document one by one
  //     for (final doc in historySnapshot.docs) {
  //       await doc.reference.delete();
  //     }

  //     // Display a success message or navigate to a new screen
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text('Habit and associated history deleted successfully'),
  //       ),
  //     );
  //     // Navigate to the desired screen after deleting the habit and history
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (ctx) => const MyHomePageToday(
  //                 habitHistory: [],
  //               )),
  //     );
  //   } catch (e) {
  //     print('Error deleting habit: $e');
  //     // Display an error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Failed to delete habit'),
  //       ),
  //     );
  //   }
  // }
}
