import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entery.dart';

class Hompagecard extends StatelessWidget {
  final List<String> questions = [
    "What small changes are you making in your life?",
    "What did you do after waking up?",
    // Add more questions here
  ];

  final CollectionReference cardone =
      FirebaseFirestore.instance.collection("enterycardone");
  final CollectionReference cardTwo =
      FirebaseFirestore.instance.collection("enterycardtwo");

  Hompagecard({Key? key}) : super(key: key);

  void _addNote(BuildContext context, CollectionReference collection,
      String question, String note) async {
    print("Adding note: $note");
    print("Question: $question");

    await collection.add({
      "date": Timestamp.now(),
      "note": note,
      "question": question, // Add the question here
    });

    print("Note added successfully!");

    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const Entery()));
  }

  void _showBottomSheet(
      BuildContext context, String question, CollectionReference collection) {
    String formattedDate =
        DateFormat("EEEE, MMMM dd, yyyy").format(DateTime.now());
    String enteredText = '';

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          width: 370,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(formattedDate),
              SizedBox(height: 20),
              Text(question),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Type your answer",
                ),
                onChanged: (text) {
                  enteredText = text;
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    onPressed: () {
                      _addNote(context, collection, question, enteredText);
                    },
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Prompt of the Day"),
              Text("Guided Journal"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  final selectedQuestion = questions[0];
                  _showBottomSheet(context, selectedQuestion, cardone);
                },
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/workout.jpeg",
                        fit: BoxFit.cover,
                        width: 150,
                        height: 250,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  final selectedQuestion = questions[1];
                  _showBottomSheet(context, selectedQuestion, cardTwo);
                },
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/workout.jpeg",
                        fit: BoxFit.cover,
                        width: 150,
                        height: 250,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
