import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/addhabits.dart/add_habits.dart';
import 'package:habits_track/bottom_pages/moodcheck.dart';
import 'package:habits_track/bottom_pages/today.dart';

import '../side_drawer.dart';

class Homapage extends StatelessWidget {
  const Homapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => MyHomePageToday()),
              );
            },
            child: Text("Today"),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      minRadius: 30,
                      backgroundImage: AssetImage(
                        "images/feel food.jpeg",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Good Morning Rasna ..,",
                        style: GoogleFonts.acme(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 177, 177)),
                    ),
                    child: Image.asset(
                      "images/lo.png",
                      width: 400,
                      height: 400,
                    ),
                    width: 360,
                    height: 230,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "How are you feeling today?",
                    style: GoogleFonts.acme(fontSize: 25),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => Moodchecking()),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text("Daily mood check-in"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Addhabits()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
