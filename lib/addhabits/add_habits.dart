import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/Firebase/Addhabits.dart';
import 'package:habits_track/addhabits/leading_cancel.dart';
import 'package:habits_track/bottom_pages/Today/today.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/reminder/reminder.dart';
import 'package:intl/intl.dart';

import 'weekbox.dart';

class Addhabits extends StatefulWidget {
  final List<Map<String, dynamic>> habitHistory;
  final String? habitName;

  const Addhabits({
    super.key,
    required this.habitHistory,
    this.habitName,
  });

  @override
  State<Addhabits> createState() => _AddhabitsState();
}

class _AddhabitsState extends State<Addhabits> {
  DateTime? selectedDate;
  String? selectedHabit = '';
  int selectedDaysPerWeek = -1;

  TextEditingController Habitname = TextEditingController();
  final CollectionReference HabitsTemplates =
      FirebaseFirestore.instance.collection("HabitsTemplates");
  bool _isFormValid() {
    return selectedHabit != null &&
        selectedHabit!.isNotEmpty &&
        selectedDaysPerWeek != -1 &&
        selectedDate != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: LeadingCancelButton(widget: widget),
        actions: [
          TextButton(
            onPressed: () {
              if (_isFormValid()) {
                AddHabitData(
                    selectedHabit: selectedHabit!,
                    selectedDaysPerWeek: selectedDaysPerWeek,
                    selectedDate: selectedDate!,
                    context: context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => MyHomePageToday(
                      habitHistory: widget.habitHistory,
                    ),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content:
                          const Text('Please fill in all required fields.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
        title: const Text(
          "New Habit",
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
                        "Habit Name",
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
                      border: Border.all(color: kredcolor)),
                  child: TextField(
                    controller: Habitname,
                    onChanged: (value) {
                      setState(() {
                        selectedHabit = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintText: selectedHabit, // Keep the hint text here
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color:
                            Habitname.text.isEmpty ? Colors.black : Colors.grey,
                      ),
                    ),
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
            habitTemplateItems(),
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
              selectedIndex: selectedDaysPerWeek,
              onSelected: (Index) {
                setState(() {
                  selectedDaysPerWeek = Index;
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
                    border: Border.all(color: kredcolor)),
                width: 340,
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
              "Reminders ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            kheight10,
            GestureDetector(
              onTap: () async {
                if (_isFormValid()) {
                  await AddHabitData(
                    selectedHabit: selectedHabit!,
                    selectedDaysPerWeek: selectedDaysPerWeek,
                    selectedDate: selectedDate!,
                    context: context,
                  );
                  Future<String> getHabitIdFromFirestore() async {
                    final user = FirebaseAuth.instance.currentUser;
                    final userId = user?.uid;

                    final habitSnapshot = await FirebaseFirestore.instance
                        .collection('add_habits')
                        .where('name', isEqualTo: selectedHabit)
                        .where('userId', isEqualTo: userId)
                        .get();

                    if (habitSnapshot.docs.isNotEmpty) {
                      return habitSnapshot.docs.first.id;
                    }

                    return ''; // Return a default value if no habitId is found
                  }

                  final habitId =
                      await getHabitIdFromFirestore(); // Fetch the habitId

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => Reminderpage(
                        habitId: habitId,
                        habitName: Habitname.text.isNotEmpty
                            ? Habitname.text
                            : selectedHabit!,
                        habitHistory: widget.habitHistory,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content:
                            const Text('Please fill in all required fields.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: kredcolor),
                ),
                width: 350,
                height: 50,
                child: const Center(
                  child: Text(
                    'Reminders',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> habitTemplateItems() {
    return StreamBuilder(
      stream: HabitsTemplates.snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 50, // Specify a fixed height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot templates = snapshot.data!.docs[index];
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
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: kredcolor,
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
        return const Text("No templates");
        // Return a widget when snapshot does not have data
      },
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
            SizedBox(
              height: 216,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate ?? DateTime.now(),
                minimumDate: selectedDate != null &&
                        selectedDate!.isAfter(DateTime.now())
                    ? DateTime.now()
                    : null,
                onDateTimeChanged: (DateTime newDateTime) {
                  // Check if selected date is before or equal to current date
                  if (newDateTime.isBefore(DateTime.now()) ||
                      newDateTime.isAtSameMomentAs(DateTime.now())) {
                    newDate = newDateTime;
                  }
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
}

String getFormattedDate(DateTime date) {
  final formatter = DateFormat('d-MMMM-yyyy');
  return formatter.format(date);
}

  // Future<void> AddHabitData() async {
  //   try {
  //     // Retrieve the current user ID
  //     final user = FirebaseAuth.instance.currentUser;
  //     final userId = user?.uid;

  //     // Check if the selectedHabit is empty or null
  //     if (selectedHabit == null || selectedHabit!.trim().isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: Colors.red,
  //           content: Text('Please enter a valid habit name'),
  //         ),
  //       );
  //       return;
  //     }

  //     // Check if selectedDaysPerWeek is a valid value
  //     if (selectedDaysPerWeek < 0) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: Colors.red,
  //           content: Text('Please select the number of days per week'),
  //         ),
  //       );
  //       return;
  //     }

  //     // All validation checks passed, add the habit data to the database
  //     final QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collection('add_habits')
  //         .where('name', isEqualTo: selectedHabit)
  //         .where('userId', isEqualTo: userId)
  //         .get();

  //     if (snapshot.docs.isNotEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: Colors.red,
  //           content: Text('Habit already exists'),
  //         ),
  //       );
  //     } else {
  //       await FirebaseFirestore.instance.collection('add_habits').add({
  //         'name': selectedHabit,
  //         'daysPerWeek': selectedDaysPerWeek + 1,
  //         'startDate': Timestamp.fromDate(selectedDate!),
  //         'userId': userId,
  //         // Store the user ID with the habit data
  //       });

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: Colors.green,
  //           content: Text('Habit added successfully'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error saving habit data: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text('Failed to save habit'),
  //       ),
  //     );
  //   }
  // }
