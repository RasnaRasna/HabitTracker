// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../const.dart';

// // Define the buildHeatMapYear function
// Widget buildHeatMapYear(DateTime selectedDate,
//     List<Map<String, dynamic>> habitHistory, String habitId) {
//   final startDate = DateTime(DateTime.now().year, 1, 1);
//   final endDate = DateTime(DateTime.now().year, 12, 31);
//   late List<String> habitNames = [];

//   final Map<DateTime, int> dataset = {};
//   Future<void> fetchHabitNames() async {
//     try {
//       final QuerySnapshot habitSnapshot =
//           await FirebaseFirestore.instance.collection('add_habits').get();

//       habitNames = habitSnapshot.docs
//           .map((doc) => doc['name'] as String)
//           .toList(); // Extract habit names from Firestore documents
//     } catch (e) {
//       print('Error fetching habits: $e');
//     }
//   }

//   // Fill the dataset with values for each day
//   for (DateTime date = startDate;
//       date.isBefore(endDate);
//       date = date.add(const Duration(days: 1))) {
//     final randomValue =
//         Random().nextInt(10) + 1; // Generate a random value between 1 and 10
//     dataset[date] = randomValue;
//   }

//   return StreamBuilder<QuerySnapshot>(
//     stream: FirebaseFirestore.instance
//         .collection('history') // Use the correct collection name 'history'
//         .where('habitId', isEqualTo: habitId)
//         .snapshots(),
//     builder: (context, snapshot) {
//       if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       }
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator();
//       }

//       final habitHistory = snapshot.data!.docs.map((doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         // Retrieve the 'completionDate' from the document and update the 'habitData' map
//         final completionDate = data['completionDate'] as Timestamp?;
//         if (completionDate != null) {
//           data['completionDate'] = completionDate.toDate();
//         }
//         return data;
//       }).toList();

//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadiusDirectional.circular(20),
//             border: Border.all(
//                 color:
//                     const Color.fromARGB(255, 196, 195, 195)), // Border color
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//                 child: Text(
//                   "$habitNames", // Replace 'Habit Name' with the actual habit name
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 22),
//                 child: Text(
//                   "2023",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               Divider(
//                 indent: 20,
//                 endIndent: 20,
//               ),
//               for (int i = 0; i < 12; i += 3) // Display 4 rows
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     for (int monthIndex = i + 1;
//                         monthIndex <= i + 3;
//                         monthIndex++)
//                       if (monthIndex <= 12)
//                         Expanded(
//                           child: _buildMonthHeatMap(
//                               monthIndex, dataset, selectedDate, habitHistory),
//                         ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget _buildMonthHeatMap(int month, Map<DateTime, int> dataset,
//     DateTime selectedDate, List<Map<String, dynamic>> habitHistory) {
//   final monthDates = dataset.keys.where((date) => date.month == month).toList();

//   return Container(
//     margin: EdgeInsets.all(4),
//     child: Column(
//       children: [
//         kheight10,
//         Text(
//           DateFormat('MMMM').format(DateTime(DateTime.now().year, month)),
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//             color: Color.fromARGB(255, 64, 64, 64),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GridView.count(
//             crossAxisCount: 7,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             children: monthDates.map((date) {
//               final value = dataset[date];
//               final isSelected = habitHistory.firstWhere(
//                 (data) =>
//                     data['selectedDayIndex'] != null &&
//                     selectedDate
//                             .add(Duration(days: data['selectedDayIndex'])) ==
//                         date,
//                 orElse: () => {'isSelected': false},
//               )['isSelected'];

//               final color = _getColorForValue(value!, isSelected);

//               return Padding(
//                 padding: const EdgeInsets.all(1),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: color,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                   width: 10,
//                   height: 10,
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Color _getColorForValue(int value, bool isSelected) {
//   // If the day is selected (completed), return green color
//   if (isSelected) {
//     return Colors.green;
//   }
//   // Return the default color (grey) for other cases
//   return Colors.grey;
// }

// Future<List<String>> fetchHabitNames() async {
//   try {
//     final QuerySnapshot habitSnapshot =
//         await FirebaseFirestore.instance.collection('add_habits').get();

//     return habitSnapshot.docs
//         .map((doc) => doc['name'] as String)
//         .toList(); // Extract habit names from Firestore documents
//   } catch (e) {
//     print('Error fetching habits: $e');
//     return [];
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../const.dart';

// Define the buildHeatMapYear function
Widget buildHeatMapYear(
  DateTime selectedDate,
  List<Map<String, dynamic>> habitHistory,
  String? habitId,
  String habitName, // New parameter to pass the habit name
) {
  final startDate = DateTime(DateTime.now().year, 1, 1);
  final endDate = DateTime(DateTime.now().year, 12, 31);
  final DateTime today = DateTime.now();
  // Fill the dataset with values for each day
  final Map<DateTime, int> dataset = {};
  for (DateTime date = startDate;
      date.isBefore(endDate);
      date = date.add(const Duration(days: 1))) {
    final randomValue =
        Random().nextInt(10) + 1; // Generate a random value between 1 and 10
    dataset[date] = randomValue;
  }

  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('history')
        .where('habitId', isEqualTo: habitId)
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }

      final habitHistory = snapshot.data!.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        // Retrieve the 'completionDate' from the document and update the 'habitData' map
        final completionDate = data['completionDate'] as Timestamp?;
        if (completionDate != null) {
          data['completionDate'] = completionDate.toDate();
        }
        return data;
      }).toList();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Text(
                  habitName, // Replace 0 with the index of the habit name you want to display
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  ("${today.year}"), // Display the current year dynamically
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              for (int i = 0; i < 12; i += 3) // Display 4 rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int monthIndex = i + 1;
                        monthIndex <= i + 3;
                        monthIndex++)
                      if (monthIndex <= 12)
                        Expanded(
                          child: _buildMonthHeatMap(
                              monthIndex, dataset, selectedDate, habitHistory),
                        ),
                  ],
                ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildMonthHeatMap(int month, Map<DateTime, int> dataset,
    DateTime selectedDate, List<Map<String, dynamic>> habitHistory) {
  final monthDates = dataset.keys.where((date) => date.month == month).toList();

  return Container(
    margin: EdgeInsets.all(4),
    child: Column(
      children: [
        kheight10,
        Text(
          DateFormat('MMMM').format(DateTime(DateTime.now().year, month)),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromARGB(255, 64, 64, 64),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: monthDates.map((date) {
              final value = dataset[date];
              final isSelected = habitHistory.firstWhere(
                (data) =>
                    data['selectedDayIndex'] != null &&
                    selectedDate
                            .add(Duration(days: data['selectedDayIndex'])) ==
                        date,
                orElse: () => {'isSelected': false},
              )['isSelected'];

              final color = _getColorForValue(value!, isSelected);

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
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

Color _getColorForValue(int value, bool isSelected) {
  // If the day is selected (completed), return green color
  if (isSelected) {
    return Color.fromARGB(255, 229, 113, 151);
  }
  // Return the default color (grey) for other cases
  return Color.fromARGB(255, 246, 211, 223);
}
