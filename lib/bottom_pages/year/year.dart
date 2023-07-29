// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class YearBase extends StatefulWidget {
//   const YearBase({Key? key}) : super(key: key);

//   @override
//   State<YearBase> createState() => _YearBaseState();
// }

// class _YearBaseState extends State<YearBase> {
//   final DateTime today = DateTime.now();
//   Map<String, int> habitsData =
//       {}; // Modified to store the item count instead of completion dates
//   Map<DateTime, bool> completionStatus = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchHabitsData();
//   }

//   Future<void> fetchHabitsData() async {
//     final habitSnapshot =
//         await FirebaseFirestore.instance.collection('add_habits').get();
//     final habitNames =
//         habitSnapshot.docs.map((doc) => doc['name'] as String).toList();
//     print(habitsData);
//     final startDate = DateTime(DateTime.now().year, 1, 1);
//     final endDate = DateTime(DateTime.now().year, 12, 31);

//     // Initialize the habitsData map with 0 item count for each habit
//     for (var habitName in habitNames) {
//       habitsData[habitName] = 0;
//     }
//     // Fetch habit data (completion dates) for each habit
//     for (var habitName in habitNames) {
//       final habitId =
//           habitSnapshot.docs.firstWhere((doc) => doc['name'] == habitName).id;
//       final habitDataSnapshot = await FirebaseFirestore.instance
//           .collection('history')
//           .where('habitId', isEqualTo: habitId)
//           .get();
//       print(habitId);
//       print('Completion Status for Habit $habitName:');
//       completionStatus.forEach((date, isCompleted) {
//         print('$date: $isCompleted');
//       });

//       habitsData[habitName] =
//           habitDataSnapshot.docs.length; // Update the item count for each habit

//       for (var doc in habitDataSnapshot.docs) {
//         final data = doc.data();
//         final completionDate = data['completionDate'] as Timestamp?;
//         if (completionDate != null) {
//           final date = completionDate.toDate();
//           completionStatus[date] = true;
//         }
//       }
//     }

//     setState(() {}); // Trigger a rebuild to display the heatmap
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: Text("2023"),
//         ),
//         body: buildHeatMapYeartototalheatmap(),
//       ),
//     );
//   }

//   Widget buildHeatMapYeartototalheatmap() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: ListView(
//         children: habitsData.entries.map((entry) {
//           final habitName = entry.key;
//           // final itemCount = entry.value;
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   habitName,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 22),
//                   child: Text(
//                     "2023",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ),
//                 Divider(
//                   indent: 20,
//                   endIndent: 20,
//                 ),
//                 for (int i = 0; i < 12; i += 3)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       for (int monthIndex = i + 1;
//                           monthIndex <= i + 3;
//                           monthIndex++)
//                         if (monthIndex <= 12)
//                           Expanded(
//                             child: _buildMonthHeatMap(monthIndex, habitName),
//                           ),
//                     ],
//                   ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildMonthHeatMap(int month, String habitName) {
//     final startDate = DateTime(DateTime.now().year, month, 1);
//     final endDate = DateTime(DateTime.now().year, month + 1, 0);

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.count(
//         crossAxisCount: 7,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         children: List.generate(endDate.day, (dayIndex) {
//           final date = startDate.add(Duration(days: dayIndex));
//           final color = completionStatus[date] == true
//               ? const Color.fromARGB(255, 5, 86, 8)
//               : Colors.grey;
//           return Padding(
//             padding: const EdgeInsets.all(1),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//               width: 10,
//               height: 10,
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   Color _getColorForValue(int value) {
//     // Define your color mapping logic here
//     if (value == 1) {
//       return Colors.green;
//     }
//     return Colors.grey;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YearBase extends StatefulWidget {
  const YearBase({Key? key}) : super(key: key);

  @override
  State<YearBase> createState() => _YearBaseState();
}

class _YearBaseState extends State<YearBase> {
  final DateTime today = DateTime.now();
  Map<String, Map<DateTime, bool>> habitsData =
      {}; // Store the completion status for each habit

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
    print(habitsData);

    // Initialize the habitsData map with an empty map for each habit
    for (var habitName in habitNames) {
      habitsData[habitName] = {}; // Store completion status in a nested map
    }

    // Fetch habit data (completion dates) for each habit
    for (var habitName in habitNames) {
      final habitId =
          habitSnapshot.docs.firstWhere((doc) => doc['name'] == habitName).id;
      final habitDataSnapshot = await FirebaseFirestore.instance
          .collection('history')
          .where('habitId', isEqualTo: habitId)
          .get();
      print(habitId);

      for (var doc in habitDataSnapshot.docs) {
        final data = doc.data();
        final completionDate = data['completionDate'] as Timestamp?;
        if (completionDate != null) {
          final date = completionDate.toDate();
          habitsData[habitName]![date] =
              true; // Update the completion status for the specific habit and date
        }
      }
    }

    setState(() {}); // Trigger a rebuild to display the heatmap
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("${today.year}"), // Display the current year dynamically
        ),
        body: buildHeatMapYeartototalheatmap(),
      ),
    );
  }

  Widget buildHeatMapYeartototalheatmap() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: habitsData.entries.map((entry) {
          final habitName = entry.key;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(255, 196, 195, 195),
                ), // Border color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    child: Text(
                      habitName, // Replace 0 with the index of the habit name you want to display
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      ("${today.year}"), // Display the current year dynamically
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  for (int i = 0; i < 12; i += 3)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int monthIndex = i + 1;
                            monthIndex <= i + 3;
                            monthIndex++)
                          if (monthIndex <= 12)
                            Expanded(
                              child: _buildMonthHeatMap(monthIndex, habitName),
                            ),
                      ],
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMonthHeatMap(int month, String habitName) {
    final startDate = DateTime(DateTime.now().year, month, 1);
    final endDate = DateTime(DateTime.now().year, month + 1, 0);

    final completionStatus = habitsData[habitName];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(DateFormat('MMMM').format(startDate), // Display month name
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromARGB(255, 64, 64, 64),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(endDate.day, (dayIndex) {
                final date = startDate.add(Duration(days: dayIndex));
                final color = completionStatus![date] == true
                    ? const Color.fromARGB(255, 229, 113, 151)
                    : Color.fromARGB(255, 246, 211, 223);
                return Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    width: 10,
                    height: 10,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Color _getColorForValue(int value) {
  //   // Define your color mapping logic here
  //   if (value == 1) {
  //     return Colors.green;
  //   }
  //   return Colors.grey;
  // }
}
