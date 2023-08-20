import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/const.dart';
import 'package:habits_track/provider/stateofbutton.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  final DateTime selectedDate;
  final String habitId; // Add the habitId as a parameter
  List<Map<String, dynamic>> habitHistory; // Add this parameter

  History({
    Key? key,
    required this.selectedDate,
    required this.habitId,
    required this.habitHistory,
  }) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late List<Map<String, dynamic>> habitHistory;
  List<bool> isNotesAdded = List.generate(
      31, (index) => false); // Track if notes are added for each day

  final CollectionReference historyCollection =
      FirebaseFirestore.instance.collection('history');
  bool isProcessingData = false;

  @override
  Widget build(BuildContext context) {
    final buttonProvider =
        Provider.of<MyButtonClickedProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("History & Notes"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: historyCollection
            .where('habitId', isEqualTo: widget.habitId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          habitHistory = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            // Retrieve the 'completionDate' from the document and update the 'habitData' map
            final completionDate = data['completionDate'] as Timestamp?;
            if (completionDate != null) {
              data['completionDate'] = completionDate.toDate();
            }
            return data;
          }).toList();

          for (int i = habitHistory.length; i < _getDaysCount(); i++) {
            habitHistory.add({
              'isSelected': false,
              'notes': '',
            });
          }

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _getDaysCount(),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final currentDate =
                      widget.selectedDate.add(Duration(days: index));
                  final habitData = habitHistory.firstWhere(
                    (data) {
                      final selectedDayIndex = data['selectedDayIndex'];
                      if (selectedDayIndex != null) {
                        final selectedDate = widget.selectedDate
                            .add(Duration(days: selectedDayIndex));
                        return selectedDate == currentDate;
                      }
                      return false;
                    },
                    orElse: () => {'isSelected': false, 'notes': ''},
                  );

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: const Color.fromARGB(255, 221, 221, 221),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: Text(_getFormattedDate(currentDate)),
                      subtitle: Text(habitData['notes'] ?? ''),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: habitData['isSelected'] ?? false,
                            child: IconButton(
                              onPressed: () {
                                _showMyDialog(index);
                              },
                              icon: const Icon(Icons.message),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              historyAddtofirestor(index);
                              setState(() {
                                final habitData = habitHistory[index];
                                // If the day is unchecked, toggle the isSelected state immediately
                                habitData['isSelected'] = true;
                              });
                            },
                            child: Builder(
                              builder: (context) {
                                final habitData = habitHistory[index];
                                final bool isSelected =
                                    habitData['isSelected'] ?? false;

                                final Color iconColor =
                                    isSelected ? kredcolor : Colors.grey;

                                return Icon(
                                  Icons.check_circle,
                                  color: iconColor,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  int _getDaysCount() {
    final difference = DateTime.now().difference(widget.selectedDate).inDays;
    return difference.abs() + 1;
  }

  String _getFormattedDate(DateTime date) {
    final formatter = DateFormat('dd-MMM-yyyy (EEEE)');
    return formatter.format(date);
  }

  Future<void> historyAddtofirestor(int index) async {
    final currentDate = widget.selectedDate.add(Duration(days: index));
    final documentId = "${widget.habitId}-${currentDate.toIso8601String()}";
    final habitData = habitHistory[index];
    final isSelected = !habitData['isSelected'];

    if (isSelected == false && habitData['notes'].isNotEmpty) {
      final shouldUncheck = await _showUncheckConfirmationDialog(index);
      if (!shouldUncheck) {
        return;
      }
    }
    setState(() {
      // Show the CircularProgressIndicator while data is being fetched
      isProcessingData = true;
    });
    try {
      final docSnapshot = await historyCollection.doc(documentId).get();
      if (docSnapshot.exists) {
        await historyCollection.doc(documentId).update({
          "isSelected": isSelected,

          "completionDate": isSelected ? Timestamp.fromDate(currentDate) : null,
          "messageButton": isSelected
              ? true
              : habitData['messageButton'], // Preserve the messageButton state
        });
      } else {
        final timestamp = Timestamp.now();
        final selectedDayIndex = index;

        await historyCollection.doc(documentId).set({
          "habitId": widget.habitId,
          "isSelected": isSelected,
          "notes": "",
          "selectedDayIndex": selectedDayIndex,
          "timestamp": timestamp,
          "completionDate": isSelected ? Timestamp.fromDate(currentDate) : null,
          "messageButton":
              isSelected, // Set the initial state for messageButton
        });
      }

      habitData['isSelected'] = isSelected;
      habitData['messageButton'] =
          isSelected; // Update the local messageButton state
      habitData['isCompleted'] = isSelected;
      habitData['completionDate'] = isSelected ? currentDate : null;
      isProcessingData = false; // Hide the CircularProgressIndicator
    } catch (e) {
      print("Error updating document: $e");
      setState(() {
        // Hide the CircularProgressIndicator in case of an error
        isProcessingData = false;
      });
    }
  }

  Future<void> _updateNoteInFirestore(int index, String newNotes) async {
    final currentDate = widget.selectedDate.add(Duration(days: index));
    final documentId = "${widget.habitId}-${currentDate.toIso8601String()}";
    final existingNotes =
        habitHistory[index]['notes'] as String; // Get existing notes

    try {
      // Append the new notes to the existing notes
      final updatedNotes = "$existingNotes  $newNotes";
      await historyCollection.doc(documentId).update({
        "notes": updatedNotes,
      });

      setState(() {
        habitHistory[index]['notes'] = updatedNotes;
      });
    } catch (e) {
      print("Error updating notes: $e");
    }
  }

  Future<void> _showMyDialog(int index) async {
    String notes = habitHistory[index]['notes'];
    // final habitData = habitHistory[index];

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateInsideDialog) {
            return AlertDialog(
              title: const Text('Enter your notes'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setStateInsideDialog(() {
                            notes = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Save'),
                      onPressed: () {
                        // Save the notes to Firestore
                        _updateNoteInFirestore(index, notes);

                        // Close the notes dialog
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<bool> _showUncheckConfirmationDialog(int index) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Notes and Completion?'),
          content: const Text(
              'Are you sure you want to delete the notes and reset the completion for this day?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (result == true) {
      _resetCompletionAndNotes(index);
    }
    return result ?? false;
    // Add a return statement here
  }

  Future<void> _resetCompletionAndNotes(int index) async {
    final currentDate = widget.selectedDate.add(Duration(days: index));
    final documentId = "${widget.habitId}-${currentDate.toIso8601String()}";
    final habitData = habitHistory[index];

    try {
      // Update the Firestore document to reset completion and remove notes
      await historyCollection.doc(documentId).update({
        "isSelected": false,
        "completionDate": null,
        "notes": "",
        'messageButton': false
      });

      // Update the local habitHistory list to reflect the changes
      setState(() {
        habitData['isSelected'] = false;
        habitData['isCompleted'] = false;
        habitData['notes'] = "";
        habitData['messageButton'] = false;
      });
    } catch (e) {
      print("Error updating document: $e");
    }
  }
}
