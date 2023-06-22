import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/Home_page.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/edit_habits.dart/habitedit.dart';
import 'package:habits_track/edit_habits.dart/heatmap.dart';
import 'package:habits_track/edit_habits.dart/yearheatmap.dart';
import 'package:habits_track/history.dart/history.dart';
import 'package:habits_track/reminder/reminder.dart';

class EditHabits extends StatelessWidget {
  const EditHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => bottombar()));
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
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => HabitEdit()));
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => History()));
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
              width: 350,
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
                      Text(" 01-may-2023")
                    ],
                  )
                ],
              ),
            ),
            kheight20,
            buildHeatMap(),
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
