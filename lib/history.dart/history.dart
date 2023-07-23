// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:habits_track/provider/notesand_iconcolors.dart';

// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

// import '../const.dart';

// class History extends StatefulWidget {
//   final DateTime selectedDate;

//   const History({Key? key, required this.selectedDate}) : super(key: key);

//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   late List<bool> showAdditionalButtonList;

//   @override
//   void initState() {
//     super.initState();

//     showAdditionalButtonList =
//         List<bool>.generate(_getDaysCount(), (_) => false);
//   }

//   final CollectionReference Addhabits =
//       FirebaseFirestore.instance.collection("history");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("History & Notes"),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               "Select days on which you completed your habit goal. To add more dates in the past, change the habit's 'start date' by tapping 'Edit' on the previous page. You can attach a note to each day completed.",
//             ),
//           ),
//           kheight20,
// ListView.separated(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),
//   itemCount: _getDaysCount(),
//   separatorBuilder: (context, index) => const SizedBox(height: 8),
//   itemBuilder: (context, index) {
//     final currentDate = widget.selectedDate
//         .add(Duration(days: _getDaysCount() - 1 - index));
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: ListTile(
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: const Color.fromARGB(255, 221, 221, 221),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         title: Text(_getFormattedDate(currentDate)),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (Provider.of<IconColorchangeprovider>(context)
//                 .isAdditionalButtonVisible(index))
//               IconButton(
//                 onPressed: () {
//                   _showMyDialog();
//                 },
//                 icon: const Icon(Icons.message),
//               ),
//             GestureDetector(
//               onTap: () {
//                 Provider.of<IconColorchangeprovider>(context,
//                         listen: false)
//                     .updateColor(index);
//               },
//               child: Icon(
//                 Icons.check_circle,
//                 color: Provider.of<IconColorchangeprovider>(context)
//                         .isAdditionalButtonVisible(index)
//                     ? Color.fromARGB(255, 229, 113, 151)
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   int _getDaysCount() {
//     final difference = DateTime.now().difference(widget.selectedDate).inDays;
//     return difference.abs() + 1;
//   }

//   String _getFormattedDate(DateTime date) {
//     final formatter = DateFormat('dd-MMM-yyyy (EEEE)');
//     return formatter.format(date);
//   }

//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Enter your notes'),
//           content: SingleChildScrollView(
//             child: ListBody(children: <Widget>[
//               Container(
//                 width: 250,
//                 height: 200,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadiusDirectional.circular(10.0),
//                     border: Border.all(color: Colors.grey)),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                 ),
//               )
//             ]),
//           ),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   child: const Text('Cancel'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('Save'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_track/provider/notesand_iconcolors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  final DateTime selectedDate;
  final String habitId; // Add the habitId as a parameter

  const History({
    Key? key,
    required this.selectedDate,
    required this.habitId,
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

  @override
  Widget build(BuildContext context) {
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

          habitHistory = snapshot.data!.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          for (int i = habitHistory.length; i < _getDaysCount(); i++) {
            habitHistory.add({
              'isSelected': false,
              'notes': '',
            });
          }

          return Consumer<IconColorchangeprovider>(
            builder: (context, iconColorchangeprovider, _) {
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
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
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
                              if (iconColorchangeprovider
                                  .isAdditionalButtonVisible(
                                      widget.habitId, index))
                                IconButton(
                                  onPressed: () {
                                    _showMyDialog(index);
                                  },
                                  icon: const Icon(Icons.message),
                                ),
                              GestureDetector(
                                onTap: () async {
                                  await _handleCheckCircle(
                                      index); // Call the _handleCheckCircle function
                                  setState(() {
                                    final habitData = habitHistory[index];
                                    // If the day is unchecked, toggle the isSelected state immediately
                                    habitData['isSelected'] = true;
                                    Provider.of<IconColorchangeprovider>(
                                            context,
                                            listen: false)
                                        .toggleAdditionalButtonVisibility(
                                            widget.habitId, index);
                                  });
                                },
                                child: Builder(
                                  builder: (context) {
                                    final habitData = habitHistory[index];
                                    final bool isSelected =
                                        habitData['isSelected'] ?? false;

                                    final Color iconColor = isSelected
                                        ? Color.fromARGB(255, 229, 113, 151)
                                        : Provider.of<IconColorchangeprovider>(
                                                    context)
                                                .isAdditionalButtonVisible(
                                                    widget.habitId, index)
                                            ? Color.fromARGB(255, 229, 113, 151)
                                            : Colors.grey;

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

  Future<void> _handleCheckCircle(int index) async {
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

    try {
      final docSnapshot = await historyCollection.doc(documentId).get();
      if (docSnapshot.exists) {
        await historyCollection.doc(documentId).update({
          "isSelected": isSelected,
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
        });
      }

      setState(() {
        habitData['isSelected'] = isSelected;
      });
    } catch (e) {
      print("Error updating document: $e");
    }
  }

  Future<void> _updateNoteInFirestore(int index, String newNotes) async {
    final currentDate = widget.selectedDate.add(Duration(days: index));
    final documentId = "${widget.habitId}-${currentDate.toIso8601String()}";

    try {
      await historyCollection.doc(documentId).update({
        "notes": newNotes,
      });

      setState(() {
        habitHistory[index]['notes'] = newNotes;
      });
    } catch (e) {
      print("Error updating notes: $e");
    }
  }

  Future<void> _showMyDialog(int index) async {
    String notes = habitHistory[index]['notes'];
    final habitData = habitHistory[index];

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
                      onPressed: () async {
                        // Save the notes to Firestore
                        await _updateNoteInFirestore(index, notes);

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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
