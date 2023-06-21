// import 'dart:math';

// import 'package:flutter/material.dart';

// class YearBase extends StatelessWidget {
//   const YearBase({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     final startDate = DateTime(DateTime.now().year, 1, 1);
//     final endDate = DateTime(DateTime.now().year, 12, 31);

//     final Map<DateTime, int> dataset = {};

//     // Fill the dataset with values for each day
//     for (DateTime date = startDate;
//         date.isBefore(endDate);
//         date = date.add(const Duration(days: 1))) {
//       final randomValue =
//           Random().nextInt(10) + 1; // Generate a random value between 1 and 10
//       dataset[date] = randomValue;
//     }

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: Container(
//           height: 330,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(17),
//               border: Border.all(color: Color.fromARGB(255, 193, 192, 192))),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: Text(
//                   "Last 365 Days",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 17),
//                   child: GridView.count(
//                     crossAxisCount: 21, // 7 days in a week
//                     physics:
//                         const NeverScrollableScrollPhysics(), // Disable scrolling
//                     children: dataset.entries.map((entry) {
//                       final date = entry.key;
//                       final value = entry.value;

//                       final color =
//                           _getColorForValue(value); // Get color based on value

//                       return Padding(
//                         padding: const EdgeInsets.all(1),
//                         child: GestureDetector(
//                           onTap: () {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text(date.toString())));
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: color,
//                               borderRadius: BorderRadius.circular(3),
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Color _getColorForValue(int value) {
//     // Define your color mapping logic here
//     if (value == 1) {
//       return Colors.red;
//       // } else if (value == 3) {
//       //   return Colors.orange;
//       // } else if (value == 5) {
//       //   return Colors.yellow;
//       // } else if (value == 7) {
//       //   return Colors.green;
//       // } else if (value == 9) {
//       //   return Colors.blue;
//       // } else if (value == 11) {
//       //   return Colors.indigo;
//       // } else if (value == 13) {
//       //   return Colors.purple;
//       // }
//     }
//     return Colors.grey;
//   }
// }
import 'package:flutter/material.dart';

class YearBase extends StatelessWidget {
  const YearBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
