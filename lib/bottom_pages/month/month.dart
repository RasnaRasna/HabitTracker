import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthBase extends StatefulWidget {
  const MonthBase({Key? key}) : super(key: key);

  @override
  State<MonthBase> createState() => _MonthBaseState();
}

class _MonthBaseState extends State<MonthBase> {
  final DateTime today = DateTime.now();
  late List<String> habitNames = [];
  late List<Map<String, dynamic>> habitHistory = [];
  late List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    fetchHabitNames();
    fetchHabitHistory();
  }

  Future<void> fetchHabitNames() async {
    try {
      final QuerySnapshot habitSnapshot =
          await FirebaseFirestore.instance.collection('add_habits').get();

      setState(() {
        habitNames =
            habitSnapshot.docs.map((doc) => doc['name'] as String).toList();
      });
    } catch (e) {
      print('Error fetching habits: $e');
    }
  }

  Future<void> fetchHabitHistory() async {
    try {
      final QuerySnapshot historySnapshot =
          await FirebaseFirestore.instance.collection('history').get();

      setState(() {
        habitHistory = historySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        isSelectedList = List.generate(habitHistory.length, (index) {
          final selectedDayIndex = habitHistory[index]['selectedDayIndex'];
          return selectedDayIndex != null && selectedDayIndex >= 0;
        });
      });
    } catch (e) {
      print('Error fetching habit history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "2023",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: habitNames.length,
          itemBuilder: (context, index) {
            final selectedHabit = habitNames[index];
            return monthCalendar(selectedHabit, index, habitHistory);
          },
        ),
      ),
    );
  }

  Widget monthCalendar(String selectedHabit, int index,
      List<Map<String, dynamic>> habitHistory) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(255, 205, 205, 205)),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                    ),
                    calendarBuilders: CalendarBuilders(
                      // Customize the appearance of each cell
                      defaultBuilder: (context, date, _) {
                        final isSelected = habitHistory.any((data) {
                          final selectedDayIndex =
                              data['selectedDayIndex'] as int?;
                          final completionDate =
                              data['completionDate'] as Timestamp?;

                          if (completionDate != null &&
                              selectedDayIndex != null) {
                            final completedDate = completionDate.toDate();

                            // Check if the date is either the completion date or one of the selected dates.
                            return completedDate.year == date.year &&
                                completedDate.month == date.month &&
                                completedDate.day == date.day;
                          }

                          return false;
                        });
                        print(
                            "history:of${habitNames}in monthbase}${habitHistory}");
                        // print('Date: $date, isSelected: $isSelected');

                        return Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.green : Colors.pink,
                          ),
                          child: Center(
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
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
                    selectedHabit,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Add spacing between the calendar and additional text
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
