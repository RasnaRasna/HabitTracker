import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:intl/intl.dart';

class Entery extends StatefulWidget {
  final bool fromGuidedJournaling; // Add this parameter

  const Entery({Key? key, required this.fromGuidedJournaling})
      : super(key: key);

  @override
  _EnteryState createState() => _EnteryState();
}

class _EnteryState extends State<Entery> {
  late int initialTabIndex; // To store the initial tab index
  @override
  void initState() {
    super.initState();
    // Determine the initial tab index based on the source of navigation
    initialTabIndex = widget.fromGuidedJournaling ? 1 : 0;
  }

  final CollectionReference cardone =
      FirebaseFirestore.instance.collection("enterycardone");
  final CollectionReference cardTwo =
      FirebaseFirestore.instance.collection("enterycardtwo");

  List<QueryDocumentSnapshot> notes = []; // List to store notes

  Future<void> _showDeleteConfirmationDialog(String docId, String question,
      CollectionReference collection, int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this entry?'),
                Text('Question: $question'), // Display the question
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () async {
                await _deleteEntry(docId, collection, index); // Pass index here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteEntry(
      String docId, CollectionReference collection, int index) async {
    try {
      await collection.doc(docId).delete();

      // Remove the deleted item from the list
      setState(() {
        notes.removeAt(index);
      });
    } catch (e) {
      print('Error deleting entry: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialTabIndex, // Set the initial tab index

      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => bottombar(
                            startDate: DateTime.now(), habitHistory: [])));
              },
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text("Entries"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Prompt of the Day"),
              Tab(text: "Guided Journaling"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTab(cardone),
            _buildTab(cardTwo),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(CollectionReference collection) {
    return StreamBuilder<QuerySnapshot>(
      stream: collection.orderBy("date", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData) {
          return Center(child: Text("No data available"));
        }

        notes = snapshot.data!.docs; // Update the notes list

        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final noteData = notes[index].data() as Map<String, dynamic>;
            final docId = notes[index].id;
            final date = noteData["date"] as Timestamp?;
            final formattedDate = date != null
                ? DateFormat("EEEE, MMMM dd, yyyy").format(date.toDate())
                : "No date available";

            final question = noteData["question"] ?? "No question available";
            final note = noteData["note"] ?? "No note available";

            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(formattedDate),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(question),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: note,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _showDeleteConfirmationDialog(
                                  docId, question, collection, index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              // Edit action
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
