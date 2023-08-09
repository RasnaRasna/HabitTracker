import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/const.dart';

import 'package:intl/intl.dart';

import '../../entery.dart';

class GuidedJournaling extends StatefulWidget {
  GuidedJournaling({Key? key}) : super(key: key);

  @override
  State<GuidedJournaling> createState() => _GuidedJournalingState();
}

class _GuidedJournalingState extends State<GuidedJournaling> {
  final List<String> guidedJournalingQuestions = [
    "If you could relive any moment from your past, what would it be and why?",
    "What's a fear you've overcome in the past, and how did you do it?",
    "Describe a time when you felt truly grateful and why.",
    "If you had the power to change one thing in the world, what would it be and why?",
    "What's a challenge you're currently facing, and how can you approach it differently?",
    "Describe a dream or goal that you've always had but haven't pursued yet.",
    "If you could spend a day with your younger self, what advice would you give?",
    "What's a habit or routine that brings you a sense of peace and well-being?",
    "Reflect on a recent accomplishment or milestone and how it has impacted you.",
    "Describe a person who has had a positive influence on your life and why.",
    "What's an experience you've had that changed your perspective on life?",
    "If you could step into the shoes of someone else for a day, who would it be and why?",
    "Think about a mistake you've made. What did you learn from it, and how did it shape you?",
    "What's a place in nature that resonates with you, and why?",
    // Add more questions here
  ];

  final CollectionReference cardTwo =
      FirebaseFirestore.instance.collection("enterycardtwo");
  bool isNoteEntered = false; // Track whether a note is entered

  final formattedDate =
      DateFormat("EEEE, MMMM dd, yyyy").format(DateTime.now());
  String note = '';
  @override
  Widget build(BuildContext context) {
    DateTime referenceDate = DateTime(DateTime.now().year, 1, 1); // January 1st
    int daysDifference = DateTime.now().difference(referenceDate).inDays;
    int questionIndex = daysDifference % guidedJournalingQuestions.length;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => bottombar(
                          startDate: DateTime.now(), habitHistory: [])));
            },
            icon: Icon(Icons.cancel)),
        centerTitle: true,
        title: Text(
          "Guided Journaling",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kheight10,
            Kwidth,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                guidedJournalingQuestions[
                    questionIndex], // Display the new question for the day
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your answer",
                ),
                onChanged: (text) {
                  setState(() {
                    note = text;
                    isNoteEntered =
                        text.isNotEmpty; // Update the validation flag
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: isNoteEntered
                    ? Colors.orange
                    : Colors.grey, // Change button color based on validation
                onPressed: isNoteEntered
                    ? () {
                        addNote(context, cardTwo,
                            guidedJournalingQuestions[questionIndex], note);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    const Entery(fromGuidedJournaling: true)));
                      }
                    : null, // Disable button if note is not entered
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void addNote(
    BuildContext context, collection, String question, String note) async {
  print("Adding note: $note");
  print("Question: $question");

  await collection.add({
    "date": Timestamp.now(),
    "note": note,
    "question": question, // Add the question here
  });
}
