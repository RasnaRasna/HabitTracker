import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/addhabits/add_habits.dart';
import 'package:habits_track/bottom_pages/Today/today.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/edit_habits/habitedit.dart';
import 'package:habits_track/edit_habits/heatmap.dart';
import 'package:habits_track/edit_habits/yearheatmap.dart';
import 'package:habits_track/history.dart/history.dart';
import 'package:habits_track/reminder/reminder.dart';

class EditHabits extends StatelessWidget {
  final String? habitName;
  final int? daysPerWeek;
  final DateTime? startDate;
  final String habitId;
  final List<Map<String, dynamic>> habitHistory; // Add this parameter

  final QueryDocumentSnapshot<Object?> habitData; // Add this parameter

  const EditHabits(
      {super.key,
      this.habitName,
      this.daysPerWeek,
      this.startDate,
      required this.habitId,
      required selectedDate,
      required this.habitData,
      required this.habitHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => MyHomePageToday()));
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text("🧘‍♂️ Meditation"),
      ),
      body: ListView(children: [
        Column(
          children: [
            kheight20,
            Row(
              children: [
                SizedBox(
                  width: 17,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => HabitEdit(
                              documentId: habitId,
                              habitName: habitName,
                              daysPerWeek: daysPerWeek,
                              startDate: startDate,
                              habitData: habitData,
                            )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color.fromARGB(255, 202, 199, 199),
                        )),
                    width: 150,
                    height: 40,
                    child: const Center(
                        child: Text(
                      '📝 Edit',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => Reminderpage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color.fromARGB(255, 202, 199, 199),
                        )),
                    width: 150,
                    height: 40,
                    child: const Center(
                        child: Text(
                      ' 🔔Reminders',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 110,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => History(
                        selectedDate: startDate!,
                        habitId: habitId,

                        // Pass the documentId to the History widget
                      ),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color.fromARGB(255, 202, 199, 199),
                        )),
                    width: 150,
                    height: 40,
                    child: const Center(
                        child: Text(
                      '⏲️ History',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            kheight20,
            Container(
              width: 320,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color.fromARGB(255, 202, 199, 199), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 19, vertical: 6),
                    child: Text(
                      "All -time status",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Row(
                    children: [
                      Kwidth,
                      Text("Current Streak"),
                      Kwidth,
                      Text("4 Days")
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Kwidth,
                      Text("Completion "),
                      Kwidth,
                      Text("24 %(9 of 37 days)")
                    ],
                  ),
                  kheight10,
                  Row(
                    children: [
                      Kwidth,
                      Text("Start Date"),
                      Kwidth,
                      Text(
                        startDate != null
                            ? getFormattedDate(startDate!)
                            : 'Select Date',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            kheight20,
            buildHeatMap(habitId),
            // buildHeatMapyear(context)
            kheight20,
            buildHeatMapYear(),
            kheight20,
          ],
        ),
      ]),
    );
  }
}
