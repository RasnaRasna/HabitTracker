import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits_track/addhabits/add_habits.dart';
import 'package:habits_track/bottom_pages/moodcheck.dart';
import 'package:habits_track/bottom_pages/today.dart';

import '../side_drawer.dart';

class Homapage extends StatelessWidget {
  final String? selectedGender;

  final String? name;

  const Homapage({Key? key, this.selectedGender, this.name}) : super(key: key);

  String getGreeting() {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour >= 5 && currentHour < 12) {
      return 'Good Morning';
    } else if (currentHour >= 12 && currentHour < 17) {
      return 'Good Afternoon';
    } else if (currentHour >= 17 && currentHour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    String imagePath =
        selectedGender == "Female" ? "images/girl.png" : "images/boy.png";

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
                      backgroundImage:
                          AssetImage(imagePath), // Updated image path
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${getGreeting()} $name ..,",
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Container(
                    child: Image.asset(
                      "images/lo.png",
                      width: 400,
                      height: 400,
                    ),
                    width: 360,
                    height: 200,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => Moodchecking()),
                        );
                      },
                      icon: Icon(Icons.emoji_emotions),
                      label: Text("Daily mood check-in"),
                    ),
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
