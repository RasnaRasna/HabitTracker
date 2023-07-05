import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

import '../bottom_pages/bottom_bar.dart';
import '../reminder/reminder.dart';
import 'addhabits_templates.dart';
import 'weekbox.dart';

class Addhabits extends StatefulWidget {
  const Addhabits({super.key});

  @override
  State<Addhabits> createState() => _AddhabitsState();
}

class _AddhabitsState extends State<Addhabits> {
  DateTime? selectedDate;
  String? selectedHabit;
  void updateSelectedHabit(String habit) {
    setState(() {
      selectedHabit = habit;
    });
  }

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
                Navigator.pop(context);
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
                    border: Border.all(
                        color: const Color.fromARGB(255, 236, 137, 170))),
                child: TextField(
                  controller: TextEditingController(text: selectedHabit),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
          habitTemplates((habit) {
            updateSelectedHabit(habit);
          }),
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
          SelectableContainer(),
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
                          color: Color.fromARGB(255, 229, 113, 151))),
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
                    border:
                        Border.all(color: Color.fromARGB(255, 229, 113, 151))),
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
