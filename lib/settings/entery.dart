import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/bottom_pages/Entry/editcardtwo.dart';
import 'package:habits_track/bottom_pages/bottom_bar.dart';
import 'package:habits_track/const.dart';
import 'package:intl/intl.dart';

class Entery extends StatefulWidget {
  final bool fromGuidedJournaling;

  const Entery({Key? key, required this.fromGuidedJournaling})
      : super(key: key);

  @override
  _EnteryState createState() => _EnteryState();
}

class _EnteryState extends State<Entery> {
  late int initialTabIndex;
  @override
  void initState() {
    super.initState();
    initialTabIndex = widget.fromGuidedJournaling ? 1 : 0;
  }

  final CollectionReference cardone =
      FirebaseFirestore.instance.collection("enterycardone");
  final CollectionReference cardTwo =
      FirebaseFirestore.instance.collection("enterycardtwo");

  List<QueryDocumentSnapshot> notes = [];

  Future<void> _showDeleteConfirmationDialog(String docId, String question,
      CollectionReference collection, int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Are you sure you want to delete this entry?'),
                Text('Question: $question'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteEntry(docId, collection, index);
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Entry deleted successfully'),
        ),
      );

      await collection.doc(docId).delete();

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
      initialIndex: initialTabIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) =>
                      bottombar(startDate: DateTime.now(), habitHistory: []),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: const Text("Entries"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 50,
              width: 350,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: const BoxDecoration(color: Colors.white),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: korangecolor,
                ),
                tabs: [
                  Tab(
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.5, // Adjust this value to your preference
                      child: const Center(child: Text("Prompt of the Day")),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.5, // Adjust this value to your preference
                      child: const Center(child: Text("Guided Journaling")),
                    ),
                  ),
                ],
              ),
            ),
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
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("No data available"));
        }

        notes = snapshot.data!.docs;

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
                  border: Border.all(color: korangecolor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          formattedDate,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _showDeleteConfirmationDialog(
                                  docId, question, collection, index);
                            },
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditEntryScreen(
                                    docId: docId,
                                    question: question,
                                    note: note,
                                    collection: collection,
                                    formattedDate: formattedDate,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit_outlined),
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
