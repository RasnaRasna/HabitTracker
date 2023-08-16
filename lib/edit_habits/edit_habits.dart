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
  final String habitName;
  final int? daysPerWeek;
  final DateTime startDate;
  final String habitId;
  final List<Map<String, dynamic>> habitHistory; // Add this parameter

  final QueryDocumentSnapshot<Object?> habitData; // Add this parameter

  const EditHabits(
      {super.key,
      required this.habitName,
      this.daysPerWeek,
      required this.startDate,
      required this.habitId,
      // required selectedDate,
      required this.habitData,
      required this.habitHistory});

  @override
  Widget build(BuildContext context) {
    print("habit name in editpage${habitName}");
    print("habit history in editpage${habitHistory}");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => MyHomePageToday(
                        habitHistory: habitHistory,
                      )));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(habitName),
      ),
      body: ListView(children: [
        Column(
          children: [
            kheight20,
            Row(
              children: [
                const SizedBox(
                  width: 30,
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
                              habitHistory: habitHistory,
                            )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 202, 199, 199),
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
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Reminderpage(
                              habitHistory: habitHistory,
                              habitName: habitName,
                              habitId: habitId,
                            )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 202, 199, 199),
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

            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 110,
                ),
                GestureDetector(
                  onTap: () {
                    print("habitHistory in EditHabits: $habitHistory");

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => History(
                        selectedDate: startDate,
                        habitId: habitId,
                        habitHistory: habitHistory,

                        // Pass the documentId to the History widget
                      ),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 202, 199, 199),
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
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            kheight20,
            Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 202, 199, 199), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19, vertical: 6),
                    child: Text(
                      "All -time status",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  const Row(
                    children: [
                      Kwidth,
                      Text("Current Streak"),
                      Kwidth,
                      Text("4 Days")
                    ],
                  ),
                  const Row(
                    children: [
                      Kwidth,
                      Text("Completion "),
                      Kwidth,
                      Text("0 %(0 of 4 weeks)")
                    ],
                  ),
                  const Row(
                    children: [
                      Kwidth,
                      Text("Days Completion "),
                      Kwidth,
                      Text("24 %(9 of 37 days)")
                    ],
                  ),
                  Row(
                    children: [
                      Kwidth,
                      const Text("Start Date"),
                      Kwidth,
                      Text(
                        startDate != null
                            ? getFormattedDate(startDate)
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
            buildHeatMapYear(startDate, habitHistory, habitId, habitName),
            kheight20,
          ],
        ),
      ]),
    );
  }
}
