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

          // Map the habit history data from Firestore
          habitHistory = snapshot.data!.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          // Fill the habitHistory list with default values for any missing days
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
                      final currentDate = widget.selectedDate
                          .add(Duration(days: _getDaysCount() - 1 - index));
                      final habitData = habitHistory.firstWhere((data) {
                        final selectedDayIndex = data['selectedDayIndex'];
                        if (selectedDayIndex != null) {
                          final selectedDate = widget.selectedDate
                              .add(Duration(days: selectedDayIndex));
                          return selectedDate == currentDate;
                        }
                        return false;
                      }, orElse: () => {'isSelected': false, 'notes': ''});

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

                          // Display the notes for the day

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
                                onTap: () {
                                  setState(() {
                                    habitHistory[index]['isSelected'] =
                                        !habitHistory[index]['isSelected'];

                                    // Toggle the additional button visibility when the check_circle icon is clicked
                                    Provider.of<IconColorchangeprovider>(
                                            context,
                                            listen: false)
                                        .toggleAdditionalButtonVisibility(
                                            widget.habitId, index);
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  color: Provider.of<IconColorchangeprovider>(
                                              context)
                                          .isAdditionalButtonVisible(
                                    widget.habitId,
                                    index,
                                  )
                                      ? Color.fromARGB(255, 229, 113, 151)
                                      : habitHistory[index]['isSelected']
                                          ? Color.fromARGB(255, 229, 113, 151)
                                          : Colors.grey,
                                ),
                              )
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

  Future<void> _showMyDialog(int index) async {
    String notes = '';
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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
                      notes = value;
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
                    final habitId = widget.habitId;
                    final currentDate = widget.selectedDate
                        .add(Duration(days: _getDaysCount() - 1 - index));
                    final isSelected = !habitHistory[index]['isSelected'];
                    final timestamp = Timestamp.now();
                    final selectedDayIndex = _getDaysCount() -
                        1 -
                        index; // Calculate the selectedDayIndex

                    final documentId =
                        "$habitId-${currentDate.toIso8601String()}";

                    // Save the notes to the "history" collection with the specified document ID
                    await historyCollection.doc(documentId).set({
                      "habitId": habitId,
                      "isSelected": isSelected,
                      "notes": notes,
                      "selectedDayIndex":
                          selectedDayIndex, // Store the selectedDayIndex
                      "timestamp": timestamp,
                    });

                    // Update the local isSelected value and notes in the habitHistory list for the correct date
                    setState(() {
                      habitHistory[index]['notes'] = notes;
                      habitHistory[index]['isSelected'] = isSelected;
                    });

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
