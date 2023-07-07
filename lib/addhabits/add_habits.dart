import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/today.dart';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';

import '../bottom_pages/bottom_bar.dart';
import '../reminder/reminder.dart';
import 'weekbox.dart';

class Addhabits extends StatefulWidget {
  const Addhabits({super.key});

  @override
  State<Addhabits> createState() => _AddhabitsState();
}

class _AddhabitsState extends State<Addhabits> {
  DateTime? selectedDate;
  String? selectedHabit;
  int selectedDaysPerWeek = -1;
  TextEditingController Habitname = TextEditingController();

  final CollectionReference HabitsTemplates =
      FirebaseFirestore.instance.collection("HabitsTemplates");
  final CollectionReference Addhabits =
      FirebaseFirestore.instance.collection("add_habits");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Center(child: Text(' Warning')),
                    content: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text('if you made changes they will\n be discarded'),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (ctx) => const bottombar())),
                        child: const Text(
                          'Discard changes',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
            icon: const Icon(
              Icons.cancel_sharp,
              color: Colors.black,
            )),
        actions: [
          TextButton(
              onPressed: () {
                saveHabitData();
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => MyHomePageToday()));
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ))
        ],
        title: const Text(
          "New habit",
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
                    controller: Habitname,
                    onChanged: (value) {
                      setState(() {
                        selectedHabit = value;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        hintText: selectedHabit,
                        hintStyle: TextStyle(
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
              stream: HabitsTemplates.snapshots(),
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
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 229, 113, 151),
                                  ),
                                ),
                                width: 130,
                                child: Center(
                                  child: Text(
                                    templates['habit Name'],
                                    style: TextStyle(
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
                return Text(
                    "No templates"); // Return a widget when snapshot does not have data
              },
            ),
            kheight10,
            Text(
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
            Text(
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
              child: Row(
                children: [
                  // const SizedBox(
                  //   width: 25,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 229, 113, 151))),
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        selectedDate != null
                            ? getFormattedDate(selectedDate!)
                            : 'Select Date',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kheight10,
            Text(
              "Reminders  ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            kheight10,
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const Reminderpage()));
              },
              child: Row(children: [
                // const SizedBox(
                //   width: 25,
                // ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: Color.fromARGB(255, 229, 113, 151))),
                  width: 300,
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Remindes ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
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

  Future<void> saveHabitData() async {
    try {
      await Addhabits.add({
        'name': selectedHabit,
        'daysPerWeek': selectedDaysPerWeek + 1,
        'startDate': Timestamp.fromDate(selectedDate!),
      });
    } catch (e) {
      print('Error saving habit data: $e');
    }
  }
}
