import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthBase extends StatefulWidget {
  const MonthBase({Key? key}) : super(key: key);

  @override
  State<MonthBase> createState() => _MonthBaseState();
}

class _MonthBaseState extends State<MonthBase> {
  final DateTime today = DateTime.now();
  Map<String, Map<DateTime, bool>> habitsData = {};

  @override
  void initState() {
    super.initState();
    fetchHabitsData();
  }

  Future<void> fetchHabitsData() async {
    final habitSnapshot =
        await FirebaseFirestore.instance.collection('add_habits').get();
    final habitNames =
        habitSnapshot.docs.map((doc) => doc['name'] as String).toList();

    // Initialize the habitsData map with an empty map for each habit
    for (var habitName in habitNames) {
      habitsData[habitName] = {}; // Store completion status in a nested map
    }
    print("Habits Data:");
    print(habitsData);
    // Fetch habit data (completion dates) for each habit
    for (var habitName in habitNames) {
      final habitId =
          habitSnapshot.docs.firstWhere((doc) => doc['name'] == habitName).id;
      final habitDataSnapshot = await FirebaseFirestore.instance
          .collection('history')
          .where('habitId', isEqualTo: habitId)
          .get();

      for (var doc in habitDataSnapshot.docs) {
        final data = doc.data();
        final completionDate = data['completionDate'] as Timestamp?;
        if (completionDate != null) {
          final date = DateTime(
            completionDate.toDate().year,
            completionDate.toDate().month,
            completionDate.toDate().day,
          );
          habitsData[habitName]![date] = true;
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "${today.year}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: habitsData.length,
          itemBuilder: (context, index) {
            final habitName = habitsData.keys.toList()[index];
            return monthCalendar(habitName);
          },
        ),
      ),
    );
  }

  Widget monthCalendar(String habitName) {
    final completionStatus = habitsData[habitName];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kredcolor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      rowHeight: 45,
                      headerStyle: const HeaderStyle(
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      //calculate the first day of the current month by using DateTime(today.year, today.month, 1)
                      firstDay: DateTime(today.year, today.month, 1),
                      lastDay: DateTime(today.year, today.month + 1, 0),
                      focusedDay: today,
                      calendarStyle: const CalendarStyle(
                        outsideDaysVisible: false,
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, date, _) {
                          if (date.month != today.month) {
                            return SizedBox.shrink();
                          }

                          final isSelected =
                              completionStatus?.containsKey(date) ?? false;
                          final isCompleted = completionStatus?[
                                  DateTime(date.year, date.month, date.day)] ??
                              false;

                          print(
                              "Date: $date, isSelected: $isSelected, isCompleted: $isCompleted");
                          return Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? kredcolor
                                  : (isCompleted ? Colors.green : korangecolor),
                            ),
                            child: Center(
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kwhite,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 3,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      habitName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:table_calendar/table_calendar.dart';

// class MonthBase extends StatefulWidget {
//   const MonthBase({
//     Key? key,
//   });

//   @override
//   State<MonthBase> createState() => _MonthBaseState();
// }

// class _MonthBaseState extends State<MonthBase> {
//   final DateTime today = DateTime.now();
//   List<String> habitNames = []; // Initialize to an empty list
//   Map<String, Map<DateTime, bool>> completionStatusMap = {};
//   List<Map<String, dynamic>> habitHistory = []; // Initialize to an empty list

//   @override
//   void initState() {
//     super.initState();
//     fetchHabits(); // Fetch both habit names and habit history on initialization
//   }

//   Future<void> fetchHabits() async {
//     try {
//       final QuerySnapshot habitSnapshot =
//           await FirebaseFirestore.instance.collection('add_habits').get();

//       setState(() {
//         habitNames = habitSnapshot.docs
//             .map((doc) => doc['name'] as String)
//             .toList(); // Extract habit names from Firestore documents
//       });

//       final QuerySnapshot historySnapshot =
//           await FirebaseFirestore.instance.collection('history').get();

//       setState(() {
//         completionStatusMap.clear(); // Clear the previous completion status map
//         habitNames.forEach((habit) {
//           completionStatusMap[habit] =
//               {}; // Initialize a new map for each habit
//         });

//         habitHistory = historySnapshot.docs
//             .map((doc) => doc.data() as Map<String, dynamic>)
//             .toList(); // Extract habit history from Firestore documents

//         // Update the completionStatusMap with the new data
//         for (var habitData in habitHistory) {
//           final habitId = habitData['habitId'] as String?;
//           Timestamp? completionDate = habitData['completionDate'] as Timestamp?;
//           if (habitId != null && completionDate != null) {
//             DateTime date = completionDate.toDate();
//             final completionDateTime =
//                 DateTime(date.year, date.month, date.day);
//             completionStatusMap[habitId]![completionDateTime] = true;
//           }
//         }
//       });
//       print(habitHistory);
//     } catch (e) {
//       print('Error fetching habits: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "2023",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: ListView.builder(
//           itemCount: habitNames.length,
//           itemBuilder: (context, index) {
//             final selectedHabit = habitNames[index];
//             return monthCalendar(selectedHabit);
//           },
//         ),
//       ),
//     );
//   }

//   Widget monthCalendar(String selectedHabit) {
//     final habitCompletionStatus = completionStatusMap[selectedHabit] ?? {};

//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Card(
//                 shape: RoundedRectangleBorder(
//                   side: BorderSide(color: Color.fromARGB(255, 205, 205, 205)),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TableCalendar(
//                     rowHeight: 45,
//                     headerStyle: const HeaderStyle(
//                       leftChevronVisible: false,
//                       rightChevronVisible: false,
//                       formatButtonVisible: false,
//                       titleCentered: true,
//                       titleTextStyle: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                     focusedDay: today,
//                     firstDay: DateTime.utc(2010, 10, 16),
//                     lastDay: DateTime.utc(2030, 3, 14),
//                     calendarStyle: const CalendarStyle(
//                       outsideDaysVisible: false,
//                       todayDecoration: BoxDecoration(
//                         color: Colors.pink, // Change color to pink
//                       ),
//                       defaultDecoration: BoxDecoration(
//                         color: Color.fromARGB(255, 246, 211, 223),
//                       ),
//                     ),
//                     calendarBuilders: CalendarBuilders(
//                       markerBuilder: (context, date, events) {
//                         if (habitCompletionStatus.containsKey(date)) {
//                           return Container(
//                             width: 8,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.green,
//                             ),
//                           );
//                         } else {
//                           return SizedBox.shrink();
//                         }
//                       },
//                       // Apply the defaultBuilder here if needed
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 left: 3,
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   child: Text(
//                     selectedHabit,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
