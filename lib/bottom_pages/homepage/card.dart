import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/Entry/cardtwonotes.dart';
import 'package:habits_track/bottom_pages/Entry/notedadding.dart';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Hompagecard extends StatelessWidget {
  final CollectionReference cardone =
      FirebaseFirestore.instance.collection("enterycardone");
  final CollectionReference cardTwo =
      FirebaseFirestore.instance.collection("enterycardtwo");

  Hompagecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Prompt of the Day",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Kwidth,
              Text(
                "Guided Journal",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  showBottomSheetnotes(context);
                },
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/day.jpeg",
                        fit: BoxFit.cover,
                        width: 150,
                        height: 170,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showGuidedJournalBottomSheet(context);
                },
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/journal.jpeg",
                        fit: BoxFit.cover,
                        width: 150,
                        height: 170,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Discover your inner \nthoughts and reflections",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "New to Journaling ? \nwe are here to \nhelp.☝️",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void showGuidedJournalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 400,
            width: 370,
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Welcome to Guided Journaling!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Guided journaling provides a structured approach to introspection and self-discovery.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Each day, you'll receive a thought-provoking question designed to stimulate your creativity and self-reflection.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Take your time to contemplate and express your thoughts. Your journey to self-awareness starts here!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        backgroundColor: Colors.orange,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GuidedJournaling()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

showBottomSheetnotes(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 400,
            width: 370,
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Here's a thought-provoking question for you:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Take a moment to reflect and jot down your thoughts:",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "This question is designed to inspire introspection and creativity. Embrace this opportunity to explore your thoughts, feelings, and experiences.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Feel free to write as little or as much as you'd like. Your thoughts matter.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        backgroundColor: Colors.orange,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PromptOfThaDay()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
