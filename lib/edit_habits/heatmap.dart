// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class HeatMapCell extends StatelessWidget {
//   final String value;
//   final bool isCompleted; // New property to indicate habit completion
//   final Color color;
//   final Function() onTap;

//   const HeatMapCell({
//     required this.value,
//     required this.isCompleted, // Include the isCompleted property
//     required this.color,
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(0.3),
//         child: Container(
//           decoration: BoxDecoration(
//             color: isCompleted
//                 ? Color.fromARGB(255, 229, 113, 151)
//                 : const Color.fromARGB(255, 246, 211, 223),
//             borderRadius: BorderRadius.circular(3),
//           ),
//           child: Center(
//             child: Text(
//               value,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget buildHeatMap(String habitId) {
//   return StreamBuilder<QuerySnapshot>(
//     stream: FirebaseFirestore.instance
//         .collection('history')
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

//       final startDate = DateTime(DateTime.now().year, 1, 1);
//       final endDate = DateTime(DateTime.now().year, 12, 31);

//       final Map<DateTime, int> dataset = {};

//       // Fill the dataset with values for each day
//       for (DateTime date = startDate;
//           date.isBefore(endDate);
//           date = date.add(const Duration(days: 1))) {
//         final randomValue = Random().nextInt(10) +
//             1; // Generate a random value between 1 and 10
//         dataset[date] = randomValue;
//       }

//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Container(
//           height: 360,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(17),
//             border: Border.all(color: Color.fromARGB(255, 193, 192, 192)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: Text(
//                   "Last 365 Days",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: GridView.count(
//                     crossAxisCount: 21, // 7 days in a week
//                     physics:
//                         const NeverScrollableScrollPhysics(), // Disable scrolling
//                     children: dataset.entries.map((entry) {
//                       final date = entry.key;
//                       final value = entry.value;
//                       final color = _getColorForValue(value);

//                       final isCompleted = habitHistory.any((data) {
//                         final completionDate =
//                             data['completionDate'] as DateTime?;
//                         return completionDate != null &&
//                             completionDate.isAtSameMomentAs(date);
//                       });

//                       return Padding(
//                         padding: const EdgeInsets.all(1),
//                         child: HeatMapCell(
//                           value: "", // Show day as text
//                           color: color,
//                           isCompleted:
//                               isCompleted, // Pass the isCompleted property
//                           onTap: () {
//                             // ScaffoldMessenger.of(context).showSnackBar(
//                             //   SnackBar(content: Text(date.toString())),
//                             // );
//                           },
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Color _getColorForValue(int value) {
//   if (value == 1) {
//     return Color.fromARGB(255, 229, 113, 151);
//   }
//   return Color.fromARGB(255, 246, 211, 223);
// }
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class HeatMapCell extends StatelessWidget {
  final String value;
  final bool isCompleted; // New property to indicate habit completion
  final Color color;
  final Function() onTap;

  const HeatMapCell({
    required this.value,
    required this.isCompleted, // Include the isCompleted property
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(0.3),
        child: Container(
          decoration: BoxDecoration(
            color: isCompleted ? kredcolor : Color.fromARGB(255, 226, 217, 188),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildHeatMap(String habitId) {
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

      final startDate = DateTime(DateTime.now().year, 1, 1);
      final endDate = DateTime(DateTime.now().year, 12, 31);

      final Map<DateTime, int> dataset = {};

      // Fill the dataset with values for each day
      for (DateTime date = startDate;
          date.isBefore(endDate);
          date = date.add(const Duration(days: 1))) {
        final randomValue = Random().nextInt(10) +
            1; // Generate a random value between 1 and 10
        dataset[date] = randomValue;
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Color.fromARGB(255, 193, 192, 192)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  "Last 365 Days",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                    crossAxisCount: 21, // 7 days in a week
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling
                    children: dataset.entries.map((entry) {
                      final date = entry.key;
                      final value = entry.value;
                      final color = _getColorForValue(value);

                      final isCompleted = habitHistory.any((data) {
                        final completionDate =
                            data['completionDate'] as DateTime?;
                        return completionDate != null &&
                            completionDate.isAtSameMomentAs(date);
                      });

                      return Padding(
                        padding: const EdgeInsets.all(1),
                        child: HeatMapCell(
                          value: "", // Show day as text
                          color: color,
                          isCompleted:
                              isCompleted, // Pass the isCompleted property
                          onTap: () {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text(date.toString())),
                            // );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Color _getColorForValue(int value) {
  if (value == 1) {
    return kredcolor;
  }
  return Color.fromARGB(255, 246, 211, 223);
}
