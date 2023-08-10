import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';

class EditEntryScreen extends StatefulWidget {
  final String docId;
  final String question;
  String note; // Make note mutable
  final CollectionReference collection;
  final String formattedDate;

  EditEntryScreen({
    required this.docId,
    required this.question,
    required this.note,
    required this.collection,
    required this.formattedDate,
  });

  @override
  _EditEntryScreenState createState() => _EditEntryScreenState();
}

class _EditEntryScreenState extends State<EditEntryScreen> {
  late TextEditingController noteController;

  @override
  void initState() {
    super.initState();
    noteController = TextEditingController(text: widget.note);
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  // Function to update the note in Firestore and UI
  Future<void> updateNoteAndPop() async {
    final newNote = noteController.text;
    try {
      // Check if the note is actually changed
      if (newNote != widget.note) {
        await widget.collection.doc(widget.docId).update({
          "note": newNote,
        });

        // Update the UI with the new note
        setState(() {
          widget.note = newNote;
        });

        // Show a success Snackbar for successful edit
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Note edited successfully'),
          ),
        );
      } else {
        // Show a message indicating that no changes were made
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('No changes made'),
          ),
        );
      }

      Navigator.pop(context);
    } catch (e) {
      print('Error updating note: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Entry",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                widget.formattedDate,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                widget.question,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: TextField(
                controller: noteController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Edit your answer",
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: korangecolor,
                onPressed: () {
                  updateNoteAndPop(); // Call the update function
                },
                child: Icon(
                  Icons.check,
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
