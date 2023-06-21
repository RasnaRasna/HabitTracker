import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

import '../addhabits.dart/addhabits_templates.dart';
import '../addhabits.dart/weekbox.dart';
import '../bottom_pages/bottom_bar.dart';
import '../reminder/reminder.dart';

class HabitEdit extends StatefulWidget {
  const HabitEdit({super.key});

  @override
  State<HabitEdit> createState() => _HabitEditState();
}

class _HabitEditState extends State<HabitEdit> {
  DateTime? selectedDate;
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
                                builder: (ctx) => const HabitEdit())),
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const ButtonBar()));
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ))
        ],
        title: const Text(
          "Edit habit",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
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
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10.0),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          kheight10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Templates",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          kheight10,
          habitTemplates(),
          kheight10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "How many days per Week should you\n complete that habit? ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          kheight10,
          weetemapltes(),
          kheight10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Start Date ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
          ),
          kheight10,
          GestureDetector(
            onTap: () {
              _showDatePicker(context);
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 199, 199, 199))),
                  width: 350,
                  height: 50,
                  child: Center(
                    child: Text(
                      selectedDate != null
                          ? selectedDate.toString()
                          : 'Select Date',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          kheight10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Reminders  ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
          ),
          kheight10,
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const Reminderpage()));
            },
            child: Row(children: [
              const SizedBox(
                width: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: const Color.fromARGB(255, 163, 162, 162))),
                width: 350,
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
          kheight20,
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "Delete Habit",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final newDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 216,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate ?? DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                selectedDate = newDateTime;
              });
            },
          ),
        );
      },
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }
}
