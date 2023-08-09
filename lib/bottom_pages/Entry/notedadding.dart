import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/const.dart';

import 'package:intl/intl.dart';

import '../../entery.dart';

class PromptOfThaDay extends StatefulWidget {
  PromptOfThaDay({Key? key}) : super(key: key);

  @override
  State<PromptOfThaDay> createState() => _PromptOfThaDayState();
}

class _PromptOfThaDayState extends State<PromptOfThaDay> {
  final List<String> questions = [
    "What's something that made you smile today?",
    "If you could travel anywhere in the world right now, where would you go?",
    "What's a book that has had a significant impact on your life?",
    "What's a goal you're currently working towards?",
    "Describe a moment when you felt proud of yourself recently.",
    "If you could have dinner with any historical figure, who would it be and why?",
    "What's a skill you've always wanted to learn?",
    "What's a place in your city/town you've never visited but want to explore?",
    "What's a quote that inspires you?",
    "Share a recent act of kindness you've either given or received.",
    "Describe a favorite childhood memory.",
    "What's a hobby that you find relaxing and enjoyable?",
    // Add more questions here
  ];

  final CollectionReference cardone =
      FirebaseFirestore.instance.collection("enterycardone");
  bool isNoteEntered = false; // Track whether a note is entered

  final formattedDate =
      DateFormat("EEEE, MMMM dd, yyyy").format(DateTime.now());
  String note = '';
  @override
  Widget build(BuildContext context) {
    DateTime referenceDate = DateTime(DateTime.now().year, 1, 1); // January 1st
    int daysDifference = DateTime.now().difference(referenceDate).inDays;
    int questionIndex = daysDifference % questions.length;
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
          "Prompt of the Day",
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
                questions[questionIndex], // Display the question for the day
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
                        addNote(
                            context, cardone, questions[questionIndex], note);
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
